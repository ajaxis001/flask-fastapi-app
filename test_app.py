from app import random_fruit

def test_random_fruit():
    assert random_fruit()[0] in ['apple', 'cherry', 'orange']