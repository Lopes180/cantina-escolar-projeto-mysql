
import os
import mysql.connector
from dotenv import load_dotenv
from pathlib import Path

# Localiza a pasta principal do projeto
BASE_DIR = Path(__file__).resolve().parent.parent

# Carrega o arquivo .env da pasta principal
load_dotenv(BASE_DIR / ".env")


def conectar():
    conexao = mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        port=int(os.getenv("DB_PORT")),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME")
    )

    return conexao
