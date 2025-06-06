from bank import value

def test_value():
    assert value("Hello") == 0
    assert value("hello") == 0
    assert value("1234567") == 100
    assert value("Hey!!!") == 20
    assert  value("Haha") == 20

def test_general():
    for greeting in ["Hermione!?", "Harry!?", "Harley!!!","Harrison?", "Hudson!!!???"]:
        assert value(greeting[0]) == 20
