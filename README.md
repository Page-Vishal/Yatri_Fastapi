# Yatri FastAPI Server

This is a FastAPI-powered backend for **Yatri**, a conversational agent designed to handle natural language queries and route them intelligently. The server is structured for easy development and testing.
---

The main yatri python code is available in repo: [Yatri](https://github.com/Page-Vishal/Yatri)

---


## 📁 Project Structure

```
Yatri
├── Code/ # Contains Yatri-specific logic (e.g. query processing) 
│   └── yatri.py # Main logic for processing queries 
|
├── main.py # FastAPI server entry point 
├── test.py # Script for testing API using requests 
├── requirements.txt # Python dependencies 
└── README.md # Project overview (you are here!)
```
---

## 🚀 Running the Server

First, install the dependencies:

```bash
pip install -r requirements.txt
```
Then start the FastAPI server:
```bash
uvicorn main:app --reload
```
Also, add the .env file at [here](./Code/Assets)
```
GROQ_API_KEY='API_KEY'
pgsql=postgresql://A:B@C:D/db_phone
```

Visit the interactive API docs at:
➡️ http://127.0.0.1:8000/docs

---
## 🧪 Testing the API
Run the test script to send a sample query:
```bash
python test.py
```
This sends a POST request to the /chat endpoint and prints the response.

## 🛠️ API Models
➤ queryRequest (Request Model)
```python
class queryRequest(BaseModel):
    query: str
```
➤ messageResponse (Response Model)
```python
class messageResponse(BaseModel):
    message: str
```
---
## 📦 Requirements
Make sure to have the required packages installed. These should be listed in requirements.txt:
```
fastapi
uvicorn
requests
pydantic

```
## 🐳 Docker
- Clone the repo [as usual]
- put the .env at the working directory in the same format
```
GROQ_API_KEY='API_KEY'
pgsql=postgresql://A:B@host.docker.internal:D/db_phone
```
---
```
docker build -t <name> .
docker run --env-file .env -p 8000:8000 <name>
```
---
OR 
---
use the docker-compose.yaml ,
```
docker compose up --build
```
➡️ http://localhost:8000/docs
---
## 📌 Notes
- The Code/yatri.py file contains the process_query() function that powers the logic behind user queries.

- The messageResponse model is used to ensure consistent, validated API responses.

- Modify queryRequest and messageResponse if your input/output schema changes.
---
### Author
[Vishal Sigdel](https://github.com/Page-Vishal)
