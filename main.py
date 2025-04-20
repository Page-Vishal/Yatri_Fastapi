from fastapi import FastAPI
from pydantic import BaseModel
from Code.yatri import process_query

app = FastAPI()

class queryRequest(BaseModel):
    query: str

class messageResponse(BaseModel):
    query: str
    route: str
    response: str

@app.post("/chat", response_model=messageResponse)
def greet_user(question: queryRequest):
    try:
        response = process_query(question.query)
        return response
    except Exception as e:
        print("Error:", e)
        return {"message": "Oops, something went wrong."}