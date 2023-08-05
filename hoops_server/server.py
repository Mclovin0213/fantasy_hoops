from flask import Flask, request, jsonify
from api import getStandingsInfo

app = Flask(__name__)

@app.route('/')
def home():
    return 'Hoops Servver'

@app.route('/standings', methods=['POST'])
def standings():
    result = getStandingsInfo()
    return jsonify(result)

if __name__ == '__main__':
    app.run(host='0.0.0.0')