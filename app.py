from flask import Flask
from redis import Redis
import os

app = Flask(__name__)
redis = Redis(host='redis', port=6379, decode_responses=True)

@app.route('/')
def hello():
    count = redis.incr('visits')
    return f"""
    <html>
        <head><title>Visitor Counter</title></head>
        <body style="font-family: Arial; text-align: center; margin-top: 50px;">
            <h1>Welcome to My Docker App!</h1>
            <h2>Visitor Count: {count}</h2>
            <p>This app uses Docker containers.</p>
            <p>Redis (Database) + Python (Web)</p>
        </body>
    </html>
    """

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
