import os
from dotenv import load_dotenv
from groq import Groq
from langchain_community.utilities import SQLDatabase
from Code.Assets.memory import add_history,chat_history

load_dotenv("./Code/assets/.env")
client = Groq()
MODEL = "llama-3.3-70b-versatile"

db = SQLDatabase.from_uri(os.getenv('pgsql'))
schema = db.get_table_info(["tbl_cart"])

def get_product_id(question):
    schema = db.get_table_info(["tbl_phones","tbl_accessories"])
    sys_prompt = """
    You are Yatri, a friendly and helpful digital assistant working for DamDum, a phone company. You sound like a cool, tech-savvy Nepali friend who helps customers with phone suggestions and buying decisions — all through conversation.
    """
    user_prompt = f"""
        You are provided with:
            Conversation History: {chat_history}
            User Question: {question}
            Database Schema: {schema}
        based on this data, generate sql query to determine the product id and price per unit of the specified phone or accessories.

        write only the SQL query and nothing else. Do not wrap the SQL query
        in any other text, not even backticks.
    """
    response = client.chat.completions.create(
        model=MODEL,
        messages=[
            {"role": "system", "content": sys_prompt},
            {"role": "user", "content": user_prompt}
        ],
        max_completion_tokens = 100
    )
    answer = response.choices[0].message.content.strip()
    res = db.run(answer)

    return res

def get_user_id(index):
    id = ["111","112","113"]
    return id[index]

def cart_query(question):

    user_id = get_user_id(0)
    prod_id = get_product_id(question)
    chat_hist = chat_history()
    print(chat_hist)
    add_history('user',question)
    user_prompt= f"""
        You help users add, remove or view from their cart.
        You have to perform:
            - Add data to cart
            - Remove data from cart
            - View the cart

        cart_id:  cart_{user_id}
        <SCHEMA>{schema}</SCHEMA>
        CONVERSATION HISTORY: {chat_hist}
        user_id: {user_id}
        product_id and price per unit: {prod_id}

        You use user's question to determine user's intent and what operation user wants in cart:

        You generate SQL query to perform the user's intended sql task. You only generate top notch sql task for handling user's query.
        keep in mind, the CONFLICT is resolved if <quantity> is to be increased in the cart.
        Do not add unnecessary items like accessoreis to the cart unless specified.

        write onlly the SQL query and nothing else. Do not wrap the SQL query
        in any other text, not even backticks.

        Your turn:

        Question: {question}
        SQL QUERY:
    """
    response = client.chat.completions.create(
        model=MODEL,
        messages=[
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": user_prompt}
        ],
        max_completion_tokens = 1024
    )
    response = response.choices[0].message.content.strip()
    add_history('assistant',response)
    return response

def cart_implementation(question):

    SQL_query = cart_query(question)
    chat_hist = chat_history()
    try:
        db_response = db.run(SQL_query)
    except Exception as e:
        db_response = "Failed to run query"
    user_prompt= f"""
        You are provided with:
            Conversation History: {chat_hist}
            User Question: {question}
            Database query: {SQL_query}
            Database Response: {db_response}
        based on this data, provide the user with a proper and human natural resonse to the asked task. Only provide relevant short answer of affermation or failure. If database resposne is: "Failed to run query", inform user accordingly.
    """
    response = client.chat.completions.create(
        model=MODEL,
        messages=[
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": user_prompt}
        ],
        max_completion_tokens = 1024
    )
    response = response.choices[0].message.content.strip()
    add_history('assistant',response)
    return response

if __name__ == "__main__":
    query = "add it to my cart"
    check = cart_query(query)
    print(check)
    print(chat_history())