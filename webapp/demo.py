from flask import Flask
import MySQLdb

app = Flask(__name__)

@app.route("/")
def hello():
  return "Hello World!"

@app.route("/viewer")
def viewer():
  views = 0

  return "Views: " + views

if __name__ == "__main__":
  app.run()
