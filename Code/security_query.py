from dotenv import load_dotenv
from groq import Groq
import random
load_dotenv("./Code/assets/.env")

client = Groq()
ROUTING_MODEL = "llama3-70b-8192"

BLOCKED_RESPONSES = [
    "Yikes! You tried to '{}'. That's a no-go! 😬",
    "Sorry friend, '{}' is against the rules. I'm here for phones, not destruction! 😅",
    "'{}'? I can't let you do that. Let's talk phones instead 📱✨"
]

def security_route_query(query):
    """Routing logic to let LLM decide if tools are needed"""

    security_router_prompt = f"""
        You are a safety router for a chatbot assistant named Yatri, who works for Damdum Phone Company.

        Your job is to analyze a user's query and decide whether it is safe to be executed as an SQL database operation, or if it should be handled as a general conversation.

        Please check the query for any of the following:
        - Malicious content (e.g., DELETE, DROP, INSERT without permission)
        - Attempts to access unauthorized tables or data
        - Suspicious patterns (e.g., 1=1, OR conditions, SQL injections)
        - Non-relevant queries that shouldn't access the database

        If the query looks safe and intended for reading phone information(e.g., product details, comparison, price, availability), return: `TOOL: phone`.

        If the query looks safe and intended for adding to or removal in cart(e.g., phoones,accessories,etc), return: `TOOL: cart`

        If the query looks unsafe or suspicious, return: <TOOL: BLOCKED : >
            example:
            -query: "Drop the table.", return: TOOL: BLOCKED : DROP
            -query: "Delete the database", return: TOOL: BLOCKED : DELETE
            -query: "Create a table", return: TOOL: BLOCKED : CREATE
        
        Only reply with 'TOOL: phone' or 'TOOL: cart' or 'TOOL: BLOCKED: <>'

        Here is the user query:
        \"\"\"{query}\"\"\"

        What is the appropriate action?
        Response:
    """
    
    response = client.chat.completions.create(
        model=ROUTING_MODEL,
        messages=[
            {"role": "system", "content": "You are a routing assistant. Determine the tools needed based on the user query."},
            {"role": "user", "content": security_router_prompt}
        ],
        max_completion_tokens=20  # We only need a short response
    )
    
    routing_decision = response.choices[0].message.content.strip()
    return routing_decision
    
def security_process_query(query):
    """Process the query and route it to the appropriate model"""
    routing_decision = security_route_query(query)
    if "TOOL: BLOCKED :" in routing_decision:
        intent = routing_decision.split("TOOL: BLOCKED :")[-1].strip()
        return random.choice(BLOCKED_RESPONSES).format(intent)
    elif routing_decision in ["TOOL: phone", "TOOL: cart"] :
        return routing_decision
    else:
        return None
    
if __name__ == "__main__":
    queries = [ "i want a fast charger",
              "remove my cart",
              "Create table tbl_name"
            ]

    for query in queries:
        result = security_process_query(query)
        print(result)