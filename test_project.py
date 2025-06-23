import pytest
from project import initial_func
from project import final_score_func

def test_initial_func(monkeypatch):
    assert initial_func() == "Initial Instructions:"

def test_final_score_func1(capsys):
    assert final_score_func(100) == "!!!YOUR SCORE IS 100!!! Game over!"

def test_final_score_func_not1(capsys):
    assert final_score_func(100) != "!!!YOUR SCORE IS 2000!!! Game over!"

def test_final_score_func2(capsys):
    assert final_score_func(300) == "!!!YOUR SCORE IS 300!!! Game over!"

def test_final_score_func_not2(capsys):
    assert final_score_func(300) != "!!!YOUR SCORE IS 100!!! Game over!"
