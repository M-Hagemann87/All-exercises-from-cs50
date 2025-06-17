class Jar:
    def __init__(self, capacity=12, deposit=0, withdraw=0):
        self._capacity = capacity
        self._size = 0
        self.deposit(deposit)
        self.withdraw(withdraw)

    def __str__(self):
        cookie_symbol = "🍪"
        str1 = self._size*cookie_symbol
        return str1

    def deposit(self, n):
        if self._size + n > self._capacity:
            raise ValueError("Capacity Error")
        self._size += n

    def withdraw(self, n):
        if self._size - n < 0:
            raise ValueError("Withdraw Error")
        self._size -= n

    @property
    def capacity(self):
        if self._capacity < 0:
            raise ValueError("Capacity Error")
        return self._capacity

    @property
    def size(self):
        return self._size
