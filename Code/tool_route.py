from Code.tool_phone import generate_response
from Code.tool_cart import cart_implementation


def phone_tool(query):
    return generate_response(query)
def cart_tool(query):
    return cart_implementation(query)

def db_tool(name,query):
    registery = {
        "TOOL: phone" : phone_tool,
        "TOOL: cart"  : cart_tool
    }
    f_call = registery[name]
    f_response = f_call(query)
    return f_response