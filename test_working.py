import pytest
from working import convert

def test_s():

    assert convert("12 AM to 1 PM") == "00:00 to 13:00"
    assert convert("1 AM to 12 PM") == "01:00 to 12:00"
    assert convert("7 PM to 7 AM") == "19:00 to 07:00"
    assert convert("3 PM to 3 AM") == "15:00 to 03:00"
    assert convert("2 PM to 2 AM") == "14:00 to 02:00"
    assert convert("9:13 AM to 5:14 PM") == "09:13 to 17:14"
    assert convert("2:21 AM to 2:21 PM") == "02:21 to 14:21"
    assert convert("1:59 AM to 1:59 PM") == "01:59 to 13:59"
    assert convert("12:20 AM to 12:20 PM") == "00:20 to 12:20"
    assert convert("11:37 PM to 11:11 AM") == "23:37 to 11:11"
    assert convert("7:37 PM to 2:37 AM") == "19:37 to 02:37"


def test_wrongtime():
    with pytest.raises(ValueError):
        convert("12 aM to 1 PM")

    with pytest.raises(ValueError):
        convert("12 AM to 1 pM")

    with pytest.raises(ValueError):
        convert("13 AM to 1 PM")

    with pytest.raises(ValueError):
        convert("12 aM to 21 PM")

def test_invalid():
    with pytest.raises(ValueError):
        convert("cat")

    with pytest.raises(ValueError):
        convert("dog:dogAM to dog:dogPM")
