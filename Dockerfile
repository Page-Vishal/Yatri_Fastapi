FROM python:3.11-bookworm

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt


COPY . .

CMD ["uvicorn", "main:app", "--host=0.0.0.0", "--reload"]
