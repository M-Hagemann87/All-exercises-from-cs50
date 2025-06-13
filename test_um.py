import pytest
from um import count

def test_s():

    assert count("um um") == 2
    assert count("um") == 1
    assert count("umumum") == 0
    assert count("UMUmuM um! um, um. um?") == 4



def test_wrongwords():
    assert count("umdog dog") == 0
    assert count("cat") == 0

def test_phrases():
    assert count("Um hello, um how are you, um?") == 3
    assert count("Hi, um, I am Um doing ok") == 2
