from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return 'Hoops Servver'

@app.route('/standings', methods=['POST'])
def standings():
    pass