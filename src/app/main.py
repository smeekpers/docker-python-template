import os
from dotenv import load_dotenv

load_dotenv()

def main():
    env = os.getenv("APP_ENV")
    debug = os.getenv("DEBUG")
    print(f"Environment: {env}, Debug: {debug}")

if __name__ == "__main__":
    main()