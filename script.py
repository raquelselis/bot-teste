import requests #faz consulta em api
import os
from dotenv import load_dotenv
load_dotenv(".env") #le o arquivo env
updates = requests.get(f"https://api.telegram.org/bot{os.getenv('TELEGRAM_TOKEN')}/getUpdates") #os.getenv vai pegar o token do arquivo env 
updates = updates.json()
updates["result"][-1]

requests.post(
        url=f"https://api.telegram.org/bot{os.getenv('TELEGRAM_TOKEN')}/sendMessage",
        data={"chat_id": 1042885840, "text": "Olá tudo bem?"}
    ).json()
    asdgggfc
    skjfsknjg
    ff