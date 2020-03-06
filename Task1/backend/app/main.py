
import os 
from fastapi import FastAPI

host = os.popen('hostname')
hostname = host.read()
	
app = FastAPI()

@app.get("/grettings")
async def gretting():
  return {"message":"Hello World from"+hostname}

@app.get("/square/{numero}")
async def square(numero: int):
  return {"number":numero , "square": numero*numero}
