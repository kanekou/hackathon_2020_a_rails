from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello, Flask!"

@app.route('/test')
def test():
    return jsonify({'message': 'test is ok'})

if __name__ == "__main__":
    app.run()
