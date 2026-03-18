from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

app = Flask(__name__)


db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'bazededate1',
    'database': 'proiect_pandele_florin'
}

def get_db_connection():
    return mysql.connector.connect(**db_config)

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/soferi', methods=['GET', 'POST'])
def gestiune_soferi():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    if request.method == 'POST':
        cursor.execute("INSERT INTO soferi (nume, prenume, cnp) VALUES (%s, %s, %s)",
                       (request.form['n'], request.form['p'], request.form['c']))
        conn.commit()
        return redirect(url_for('gestiune_soferi'))
    cursor.execute("SELECT * FROM soferi")
    date = cursor.fetchall()
    conn.close()
    return render_template('soferi.html', date=date)

@app.route('/edit_sofer/<int:id>')
def edit_sofer(id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM soferi WHERE idsofer = %s", (id,))
    sofer = cursor.fetchone()
    conn.close()
    return render_template('edit_sofer.html', s=sofer)

@app.route('/update_sofer', methods=['POST'])
def update_sofer():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("UPDATE soferi SET nume=%s, prenume=%s, cnp=%s WHERE idsofer=%s",
                   (request.form['n'], request.form['p'], request.form['c'], request.form['id']))
    conn.commit()
    conn.close()
    return redirect(url_for('gestiune_soferi'))

@app.route('/sterge_sofer/<int:id>')
def sterge_sofer(id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM soferi WHERE idsofer = %s", (id,))
    conn.commit()
    conn.close()
    return redirect(url_for('gestiune_soferi'))


@app.route('/vehicule', methods=['GET', 'POST'])
def gestiune_vehicule():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    if request.method == 'POST':
        cursor.execute("INSERT INTO vehicule (marca, model, nr_inmatriculare) VALUES (%s, %s, %s)",
                       (request.form['m'], request.form['mo'], request.form['nr']))
        conn.commit()
        return redirect(url_for('gestiune_vehicule'))
    cursor.execute("SELECT * FROM vehicule")
    date = cursor.fetchall()
    conn.close()
    return render_template('vehicule.html', date=date)

@app.route('/edit_vehicul/<int:id>')
def edit_vehicul(id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM vehicule WHERE idvehicul = %s", (id,))
    vehicul = cursor.fetchone()
    conn.close()
    return render_template('edit_vehicul.html', v=vehicul)

@app.route('/update_vehicul', methods=['POST'])
def update_vehicul():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("UPDATE vehicule SET marca=%s, model=%s, nr_inmatriculare=%s WHERE idvehicul=%s",
                   (request.form['m'], request.form['mo'], request.form['nr'], request.form['id']))
    conn.commit()
    conn.close()
    return redirect(url_for('gestiune_vehicule'))

@app.route('/sterge_vehicul/<int:id>')
def sterge_vehicul(id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM vehicule WHERE idvehicul = %s", (id,))
    conn.commit()
    conn.close()
    return redirect(url_for('gestiune_vehicule'))


@app.route('/performante', methods=['GET', 'POST'])
def perfo():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    if request.method == 'POST':
        cursor.execute("INSERT INTO performante_vehicule (idsofer, idvehicul, cai_putere, cuplu_nm, greutate_kg) VALUES (%s, %s, %s, %s, %s)",
                       (request.form['ids'], request.form['idv'], request.form['hp'], request.form['nm'], request.form['kg']))
        conn.commit()
        return redirect(url_for('perfo'))

    cursor.execute("""SELECT p.idperfo, s.nume, s.prenume, v.marca, v.model, p.cai_putere, p.cuplu_nm, p.greutate_kg 
                      FROM performante_vehicule p 
                      JOIN soferi s ON p.idsofer = s.idsofer 
                      JOIN vehicule v ON p.idvehicul = v.idvehicul""")
    date = cursor.fetchall()
    conn.close()
    return render_template('performante.html', date=date)

@app.route('/edit_perfo/<int:id>')
def edit_perfo(id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM performante_vehicule WHERE idperfo = %s", (id,))
    perfo = cursor.fetchone()
    conn.close()
    return render_template('edit_perfo.html', p=perfo)

@app.route('/update_perfo', methods=['POST'])
def update_perfo():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("UPDATE performante_vehicule SET idsofer=%s, idvehicul=%s, cai_putere=%s, cuplu_nm=%s, greutate_kg=%s WHERE idperfo=%s",
                   (request.form['ids'], request.form['idv'], request.form['hp'], request.form['nm'], request.form['kg'], request.form['id']))
    conn.commit()
    conn.close()
    return redirect(url_for('perfo'))

@app.route('/sterge_perfo/<int:id>')
def sterge_perfo(id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM performante_vehicule WHERE idperfo = %s", (id,))
    conn.commit()
    conn.close()
    return redirect(url_for('perfo'))

if __name__ == '__main__':
    app.run(debug=True, port=5001)