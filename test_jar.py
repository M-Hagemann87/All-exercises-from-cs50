from jar import Jar


def test_init():
    jar = Jar(12, 3, 1)
    assert str(jar) == "🍪🍪"


def test_str():
    jar = Jar()
    assert str(jar) == ""
    jar.deposit(1)
    assert str(jar) == "🍪"


def test_deposit():
    jar = Jar(12)
    jar.deposit(11)
    assert str(jar) == "🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪"


def test_withdraw():
    jar = Jar(12)
    jar.deposit(3)
    jar.withdraw(3)
    assert str(jar) == ""
