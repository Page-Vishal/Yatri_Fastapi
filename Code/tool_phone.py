import os
from dotenv import load_dotenv
from groq import Groq
from langchain_community.utilities import SQLDatabase
from Code.Assets.memory import add_history,chat_history

load_dotenv("./Code/assets/.env")
client = Groq()
MODEL = "llama-3.3-70b-versatile"

db = SQLDatabase.from_uri(os.getenv('pgsql'))
schema = db.get_table_info()
def generate_query(question):
    sys_prompt = f"""
        You are given 2 tables in the database: tbl_phone contains the details of the phone,
        tbl_accessories contains the necessary accessories from the phone. You are an excellent query generator
        that generates awesome accurate queries.
    """
    chat_hist = chat_history()
    user_prompt = f"""
        You are a data analyst at a company. You are interacting with a user
        who is asking you questions about the company's database.
        Based on the table schema below, write a SQL query that would
        answer the user's question. take teh conversation historyinto account.

        <SCHEMA>{schema}</SCHEMA>

        Conversational History: {chat_hist}

        write only the SQL query and nothing else. Do not wrap the SQL query
        in any other text, not even backticks.

        For example:
        Question: How many phones are in the database that are cheaper than 500 dollars?
        SQL Query: SELECT COUNT(*) FROM "tbl_phones" WHERE "price" < 500;  

        Question: Name 5 brand models?
        SQL Query: SELECT "model" FROM tbl_phones LIMIT 5;

        Question: What are the different chargers available?
        SQL Query: SELECT name FROM tbl_accessories WHERE category = 'Charger' limit 5;

        Your turn:

        Question: {question}
        SQL QUERY: 
    """

    response = client.chat.completions.create(
        model=MODEL,
        messages=[
            {"role": "system", "content": sys_prompt},
            {"role": "user", "content": user_prompt}
        ],
        max_completion_tokens= 1024
    )
    answer = response.choices[0].message.content.strip()
    return answer

def generate_response(question):

    query = generate_query(question)
    try:
        sql_response = db.run(query)
    except Exception as err:
        sql_response = "SQL cannot be genrated or run."

    sys_prompt="""
        You are an intelligent natural response generator that generates humna like response form provided SQL query and necesdsary inputs.
    """
    user_prompt = f"""
        You are Yatri, a smart and friendly assistant for a phone company called Damdum. Your goal is to help users with their phone-related questions by giving natural, warm, and easy-to-understand responses. You have access to database responses, and your job is to turn that data into a helpful conversation.

        Below is what you have:

        - User Question: {question}
        - Database Schema: {schema}
        - SQL Query Used: {query}
        - Raw SQL Result: {sql_response}

        Your task is to read the user question and respond as if you're a helpful person working at a phone shop. Don't mention SQL or technical details. Just summarize the result in a friendly, human way. Try to be specific, helpful, and as little conversational to not genrate too lenthy response to read. list their name, color and price readily and other details if asked.

        Avoid listing raw data or columns. Instead, summarize what the user would care about based on the question.

        Respond in English with a tone that is confident, trustworthy, and supportive.

        if the sql_response is "SQL cannot be genrated or run." inform user accordingly.

        Now, write the response:
    """
    response = client.chat.completions.create(
        model=MODEL,
        messages=[
            {"role": "system", "content": sys_prompt},
            {"role": "user", "content": user_prompt}
        ],
        max_completion_tokens= 1024
    )
    answer = response.choices[0].message.content.strip()
    add_history('user',question)
    add_history ('assistant', answer)
    return answer

if __name__ == "__main__":
    input = "find me all accessories for damdum x1"
    # input = "SELECT * from tbl_accessories limit 5;"
    result  = generate_response(input)
    print(result)