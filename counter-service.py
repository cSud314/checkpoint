#!flask/bin/python
from flask import Flask, request, request_started
import os
app = Flask(__name__)
counter = 0
if os.path.isfile('counter.txt'):
   print("file already exists")
   f = open("counter.txt", "r")
   for i in f:
       if i.idigit() == True:
           counter = int(i)
else:
    os.system('touch counter.txt')
@app.route('/', methods=["POST", "GET"])
def index():
    global counter
    if request.method == "POST":
        counter+=1
        g = open('counter.txt', 'rw+')
        g.truncate(0)
        g.write(str(counter))
        return "Hmm, Plus 1 please "
    else:
        return str("Our Counter Is= " + str(counter))
if __name__ == '__main__':
    app.run(debug=True,port=80,host='0.0.0.0')
