#!/usr/bin/env python3.7

import mysql.connector
from flask import Flask, request
import sys

app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def hello_world():

    if(request.method == 'GET'):
        template = open('template.html', 'r').read()
        print(request.args.get('code'))
        return template.format(request.args.get('code')), 200
    else:
        con = mysql.connector.connect(host=sys.argv[4],  user=sys.argv[1],  password=sys.argv[2], database=sys.argv[3])
        cursor = con.cursor()
        try:
            cursor.execute("INSERT INTO presenca (nome, matricula, cpf, email, codevento) VALUES ('{}', '{}', '{}', '{}', '{}')".format(request.form['nome'], request.form['matricula'], request.form['cpf'], request.form['email'], request.form['code']))
            con.commit()
            con.close()
            return "<h1>Registrado, Obrigado</h1>", 200
        except:
            con.close()
            return "<h2>Problema com o registro, favor verificar o evento e tentar novamente</h2>", 200


assert (len(sys.argv) > 4), "usage: {} <usr> <password> <database> <host>".format(sys.argv[0])
app.run('0', '8000')