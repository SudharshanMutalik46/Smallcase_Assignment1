import random
from flask import Flask

app = Flask(__name__)

@app.route('/api/v1')
def get_random_string():
    strings = ["Investments", "Smallcase", "Stocks", "buy-the-dip", "TickerTape"]
    return random.choice(strings)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8081)
