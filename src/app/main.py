import os
from dotenv import load_dotenv
from fastapi import FastAPI

load_dotenv()

app = FastAPI(title="Docker Python Template API")


@app.get("/")
def read_root():
    env = os.getenv("APP_ENV", "unknown")
    debug = os.getenv("DEBUG", "false")
    return {
        "message": "Hello from Docker Python Template",
        "environment": env,
        "debug": debug,
    }


@app.get("/health")
def health():
    return {"status": "ok"}


def main():
    env = os.getenv("APP_ENV")
    debug = os.getenv("DEBUG")
    print(f"Environment: {env}, Debug: {debug}")


if __name__ == "__main__":
    main()
