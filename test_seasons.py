import pytest
from seasons import calc

def test_calc():

    assert calc("1987-10-10") == "Nineteen million, eight hundred twenty thousand, one hundred sixty"
    assert calc("1732-07-05") == "One hundred fifty-four million, seventy-five thousand, six hundred eighty"
    assert calc("1995-01-03") == "Sixteen million, fifteen thousand, six hundred eighty"

def test_invalid():

    with pytest.raises(SystemExit):
        calc("Invalid date")
