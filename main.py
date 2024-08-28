from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles

app = FastAPI()

# Mount the static directory to serve HTML and other static files
app.mount("/static", StaticFiles(directory="static"), name="static")

@app.post("/device-created")
async def device_created(request: dict):
    # Log the device creation or interact with NetBox
    print(f"Device Created: {request['name']}")
    # Perform additional actions here, e.g., interact with NetBox API
    return {"status": "success"}