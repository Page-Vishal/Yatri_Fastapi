# Yatri — Your Smart Friend

**Yatri** is a friendly, conversational agent that helps users discover, compare, and buy mobile phones from **Damdum Phone Company**. It's more than a bot — it’s like chatting with a smart, modern, culturally-rooted assistant who really knows phones!

---

## ✨ Features

- **Natural Chat**: Casual, human-like conversations — Yatri sounds like your helpful, tech-savvy friend.
- **Smart Routing**: Classifies user queries into:
  - Phone information (e.g., “Compare X1 and X2”)
  - Cart management (e.g., “Add this to my cart”)
  - General chat (e.g., “How are you?”)
  - Malicious query blocking (e.g., SQL injection attempts)
- **LLM-Powered**: Uses a large language model to understand intent and generate helpful or witty replies.
- **PostgreSQL Integration**: Fetches phone data from `tbl_phones` accessories from `tbl_accessories`, and updates shopping cart data in `tbl_cart`.

---

## 🛠️ Tech Stack

| Tech | Purpose |
|------|---------|
| **Python** | Core development |
| **PostgreSQL** | Database for phones,accessories and cart |
| **LLM (llama-3.3)** | Natural language understanding and generation |
| **Routing** | Intent detection and secure SQL gating |
| **Modular Codebase** | Clean file separation (router, tools, core)

---

## 🧩 Project Structure

```
yatri_bot/ 
├── Assets/
|   ├── .env # necessary environment file 
|   ├── config.ini # config file for the db
|   ├── Memomry.py # Shared memory for the project
|   └── sql_connection.py # Custom created SQL connnection Class
|
├── yatri.py # main bot script 
├── conversational_tool.py # Handles friendly chitchat
├── security_query.py # checks for the healthy and unharmful sql attempts 
├── tool_route.py # Routes the sql attempt to phone or cart tools
├── tool_phone.py # tool for getting phones' and accessories' data
├── tool_cart.py # tool for cart manipulation
└── README.md # This file!
```

---

## 🚀 Getting Started

### 1. Clone the Repo
```bash
git clone https://github.com/Page-Vishal/Yatri.git
cd Yatri
```

### 2. Set up the Environment
```
pip install -r requirements.txt
```

### 3. Configure Database
config.ini is to be configured as:

```
[pgsql]
hostname = localhost
database = db_phone
username = postgres
password = yourpassword
port = 5432
```
OR <br/>
You can initilaize the sql uri inside the .env file as: **(PREFERRED)**
```
postgresql://{user}:{password}@{host}:{port}/{database}
```

#### - SQL DATABASE
The SQL database is provided inside the [SQL](./Assets/SQL/) folder.
 - [tbl_phones](./Assets/SQL/tbl_phones.sql)
 - [tbl_accessories](./Assets/SQL/tbl_accessories.sql)
 - [tbl_cart](./Assets/SQL/tbl_cart.sql)

## Security & Safety
- All SQL queries are filtered by a smart router to avoid SQL injection.

- Suspicious queries are blocked, and Yatri responds with witty, non-malicious replies like:

  **"Trying to DROP the database? Naughty naughty! 😏📛"**

## 🇳🇵 Cultural Touch
Yatri (यात्री) means “traveler” in Nepali — a warm, friendly companion that walks with users on their phone-buying journey. A blend of tradition and tech!

## Author
[Vishal Sigdel](https://github.com/Page-Vishal)