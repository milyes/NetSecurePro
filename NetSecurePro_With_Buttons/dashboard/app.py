
from flask import Flask, render_template, jsonify, redirect, url_for
import json
import os
from datetime import datetime

app = Flask(__name__)

MODULES_DIR = '../modules'
LOG_FILE = '../logs/system.log'

@app.route('/')
def index():
    modules = {}
    for module_name in os.listdir(MODULES_DIR):
        status_file = os.path.join(MODULES_DIR, module_name, "status.json")
        if os.path.exists(status_file):
            with open(status_file, "r") as f:
                modules[module_name] = json.load(f)
    return render_template("index.html", modules=modules)

@app.route('/restart/<module>', methods=['POST'])
def restart(module):
    log_message(f"[MANUEL] Redémarrage simulé de {module}")
    return redirect(url_for('index'))

@app.route('/log/<module>', methods=['GET'])
def log(module):
    return f"<h3>Log pour {module}</h3><pre>{read_logs(module)}</pre><a href='/'>Retour</a>"

def log_message(msg):
    with open(LOG_FILE, "a") as f:
        f.write(f"{datetime.utcnow().isoformat()} - {msg}\n")

def read_logs(module_name):
    if not os.path.exists(LOG_FILE):
        return "Aucun log trouvé."
    with open(LOG_FILE, "r") as f:
        lines = [line for line in f if module_name in line]
        return "\n".join(lines) if lines else "Aucun log pour ce module."

if __name__ == '__main__':
    app.run(debug=True, port=5050)
