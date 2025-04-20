import requests

url = "http://127.0.0.1:8000/chat"

payload = {
    "query" : "cheap phones under 600 dollars"
}

# Make a POST request
response = requests.post(url, json=payload)
# Print the response
print("Status code:", response.status_code)
print("Response JSON:", response.json()["response"])