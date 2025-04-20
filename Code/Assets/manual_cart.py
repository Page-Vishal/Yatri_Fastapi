import os
from dotenv import load_dotenv
from groq import Groq
from langchain_community.utilities import SQLDatabase

load_dotenv("./assets/.env")
client = Groq()
MODEL = "llama-3.3-70b-versatile"

def view_cart(cart_id):
    sql= f"""
    SELECT * FROM tbl_cart
    WHERE cart_id = {cart_id};
    """

def add_to_cart(product_id,product_name,quantity,price_per_unit):
    quantity = int(quantity)
    price_per_unit = float(price_per_unit)
    sql = """
        INSERT INTO tbl_cart (product_id, product_name, quantity,price_per_unit)
        VALUES ({product_id}, {product_name}, {quantity},{price_per_unit})
        ON CONFLICT (product_id) DO UPDATE SET quantity = tbl_cart.quantity + {quantity};
    """

def delete_cart(cart_id):
    sql = f"""
    DELETE FROM tbl_cart
    WHERE cart_id = '{cart_id}';
    """

def cart_query(question):

    user_id = get_user_id(0)
    prod_id = get_product_id(question)
    user_prompt= f"""
        You help users add, remove or view from their cart.
        You have to perform:
            - Add data to cart
            - Remove data from cart
            - View the cart

        cart_id:  cart_{user_id}
        <SCHEMA>{schema}</SCHEMA>
        CONVERSATION HISTORY: {chat_history}
        user_id: {user_id}
        product_id and price per unit: {prod_id}

        You use question: {question} to determine user's intent and what operation user wants in cart:

        You have to reply based on user's intent:
        if user wants to view the cart, reply with reply with the function and required arguments
        as : `view_cart (<cart_id>)`

        if user wants to add into cart, reply with the function and required arguments
        as : `add_to_cart (<product_id>,<product_name>,<quantity>,<price_per_unit>)`

        if user wants to remove items from cart, reply with reply with the function and required arguments
        as : `delete_cart (<cart_id>)`

        only reply based on the intent from user and from the 3 designed function and so excess words.
        Your response:
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
    return response