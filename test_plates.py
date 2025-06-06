from plates import is_valid

def test_plate1():
    assert is_valid("12345") == False
    assert is_valid("N1") == False
    assert is_valid("NA35") == True
    assert is_valid("NAR32A") == False
    assert is_valid("NA1A") == False
    assert is_valid("NAR2A") == False
    assert is_valid("NARA3A") == False
    assert is_valid("NARAA4") == True
    assert is_valid("AA") == True
    assert is_valid("AAA") == True
    assert is_valid("AAAA") == True
    assert is_valid("AAAAA") == True
    assert is_valid("AAAAAA") == True
    assert is_valid("A") == False
    assert is_valid("AAAAAAA") == False
    assert is_valid("AAAAAAAA") == False
    assert is_valid("AAAAAAAAA") == False
    assert is_valid("AAAAAAAAAA") == False
    assert is_valid("AA.123") == False
    assert is_valid("A.A") == False

def test_plate2():
    assert is_valid("AAAAA,") == False
    assert is_valid("AA!AA") == False

def test_plate3():
    assert is_valid("AA!AA") == False

def test_plate4():
    assert is_valid("AAAAA,") == False
