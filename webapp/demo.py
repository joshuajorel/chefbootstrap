from flask import Flask
import MySQLdb

app = Flask(__name__)

@app.route("/")
def hello():
  return "Hello World!"

@app.route("/viewer")
def viewer():
  db = MySQLdb.Connection(host="52.14.59.54", user="demouser", passwd="randompassword", db="demo-site")
  cur = db.cursor()
  cur.execute("""
    select counter
    from views
    where pkey = 1""")

  views_tup = cur.fetchone()

  views = views_tup[0] + 1

  cur.execute("""
    update views
    set counter = %s
    where pkey = 1""", (str(views)))

  db.commit()
  db.close()

  return "Views: " + str(views)

if __name__ == "__main__":
  app.run()
