from twttr import shorten

def test_shorten():
    assert shorten("Hermione") == "Hrmn"
    assert shorten("Harry") == "Hrry"
    assert shorten("Ron") == "Rn"
    assert shorten("123aeiouAEIOU4567") == "1234567"
