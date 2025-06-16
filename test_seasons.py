import pytest
from seasons import calc

def test_calc():

    assert calc("1987-10-10") == "Nineteen million, eight hundred and twenty thousand, one hundred and sixty"
    assert calc("1732-07-05") == "One hundred and fifty-four million, seventy-five thousand, six hundred and eighty"
    assert calc("1995-01-03") == "Sixteen million, fifteen thousand, six hundred and eighty"


def test_wrongrange():

    assert calc("cat") == "Invalid date"
    assert calc("cat.dog.cat.dog") == "Invalid date"
    assert calc("1.1.1.1.1") == "Invalid date"
    assert calc("1") == "Invalid date"

def test_invalid():
    assert calc("-1.-1.-1.-1") == "Invalid date"
    assert calc("256.256.256.256") == "Invalid date"
