from numb3rs import validate

def test_ips():

    assert validate("0.0.0.0") == "Valid"
    assert validate("1.1.1.1") == "Valid"
    assert validate("9.9.9.9") == "Valid"
    assert validate("21.21.21.21") == "Valid"
    assert validate("197.175.254.0") == "Valid"
    assert validate("255.255.255.255") == "Valid"


def test_wrongrange():

    assert validate("cat") == "Invalid"
    assert validate("cat.dog.cat.dog") == "Invalid"
    assert validate("1.1.1.1.1") == "Invalid"
    assert validate("1.1.1.1.1.1") == "Invalid"
    assert validate("1") == "Invalid"
    assert validate("1.1") == "Invalid"
    assert validate("1.1.1") == "Invalid"

def test_invalid():
    assert validate("-1.-1.-1.-1") == "Invalid"
    assert validate("256.256.256.256") == "Invalid"
