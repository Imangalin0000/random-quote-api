import os
import random
from flask import Flask, jsonify

app = Flask(__name__)

QUOTES = [
    {"id": 1, "author": "Albert Einstein", "text": "Life is like riding a bicycle. To keep your balance, you must keep moving."},
    {"id": 2, "author": "Steve Jobs", "text": "The only way to do great work is to love what you do."},
    {"id": 3, "author": "Nelson Mandela", "text": "It always seems impossible until it's done."},
    {"id": 4, "author": "Mark Twain", "text": "The secret of getting ahead is getting started."},
    {"id": 5, "author": "Confucius", "text": "It does not matter how slowly you go as long as you do not stop."}
]

@app.route('/')
def home():
    return jsonify({"message": "Welcome to the Random Quote API"})

@app.route('/healthz')
def healthz():
    return jsonify({"status": "healthy"}), 200

@app.route('/quote')
def get_random_quote():
    quote = random.choice(QUOTES)
    return jsonify(quote)

if __name__ == '__main__':
    port = int(os.environ.get("PORT", 8080))
    app.run(host='0.0.0.0', port=port)
