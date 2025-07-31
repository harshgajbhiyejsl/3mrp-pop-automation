# run.py
from flask import Flask
from dotenv import load_dotenv
load_dotenv()

app = Flask(__name__)

@app.get("/health")
def health():
    return {"status": "ok"}, 200

if __name__ == "__main__":
    app.run(debug=True, port=5000)
