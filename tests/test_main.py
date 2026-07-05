from app.main import hello


def test_hello_default():
    assert hello() == "Hello, Stephen! Your Docker Python project is running."


def test_hello_custom_name():
    assert hello("Docker") == "Hello, Docker! Your Docker Python project is running."
