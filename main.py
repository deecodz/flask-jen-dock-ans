
from flask import Flask

app = Flask(__name__)


@app.route("/")
def index():
    return "A couple 100 internet documentations and I are Devops Engineers! lol"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=int("5000"), debug=True)
