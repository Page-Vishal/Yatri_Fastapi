import requests

url = "http://127.0.0.1:8000/chat"

querys = ["Hi, How are you",
          "I think i need a new phone",
          "Tell me about damdum x5",
          "Add that damdum x5 to my cart",
          "Show my cart."]

for query in querys:
    payload = {"query" : query}
    response = requests.post(url, json=payload)

    print(f"\nQuery: {query}")
    print("Status Code:", response.status_code)

    try:
        data = response.json()
        print("Route: ",data["route"])
        print("Response:", data["response"])
    except Exception as e:
        print("Error decoding response:", e)
        print("Raw text:", response.text)