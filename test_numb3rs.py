from numb3rs import validate

def test_ips():

    assert validate("0.0.0.0") == True
    assert validate("1.1.1.1") == True
    assert validate("9.9.9.9") == True
    assert validate("21.21.21.21") == True
    assert validate("197.175.254.0") == True
    assert validate("255.255.255.255") == True


def test_wrongrange():

    assert validate("cat") == False
    assert validate("cat.dog.cat.dog") == False
    assert validate("1.1.1.1.1") == False
    assert validate("1.1.1.1.1.1") == False
    assert validate("1") == False
    assert validate("1.1") == False
    assert validate("1.1.1") == False

def test_invalid():
    assert validate("-1.-1.-1.-1") == False
    assert validate("255.255.255.256") == False
    assert validate("-11.1.1.1") ==  False
    assert validate("1.-1.1.1") == False
    assert validate("1.1.-1.1") == False
    assert validate("1.1.1.-1") == False
    assert validate("1.1000.1.1") == False
    assert validate("1.1.1000.1") == False
    assert validate("1.1.1.1000") == False
    assert validate("1.a.1.1") == False
    assert validate("1.1.a.1") == False
    assert validate("1.1.1.a") == False

def test_argument():
    for ip in ["cat.123.123.123", "123.cat.123.123", "123.123.cat.123","123.123.123cat"]:
        assert validate(ip) == False
