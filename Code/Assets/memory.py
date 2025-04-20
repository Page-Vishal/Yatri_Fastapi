history = []

def add_history( role: str, message: str):
    history.append({"role": role, "content": message})

def chat_history():
    return history