from fuel import gauge, convert, main

def test_convert():

    assert convert("4/4") == 100
    assert convert("3/4") == 75
    assert convert("2/4") == 50
    assert convert("1/4") == 25
    assert convert("3/10") == 30
    assert convert("1/100") == 1

def test_gauge():

    assert gauge(1) == "E"
    assert gauge(100) == "F"
    assert gauge(75) == "75"
    assert gauge(50) == "50"
    assert gauge(25) == "25"
    assert gauge(99) == "F"

def test_invalid():
    
    with pytest.raises(ZeroDivisionError):
        convert("1/0")

    with pytest.raises(ValueError):
        convert("cat/dog")
