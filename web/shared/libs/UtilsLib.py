from time import time
from requests import get
from random import randint

__version__ = '1.0'
__scope__ = 'GLOBAL'


class UtilsLib(object):
    ROBOT_LIBRARY_VERSION = __version__
    ROBOT_LIBRARY_SCOPE = __scope__

    def get_current_date(self) -> str:
        return str(int(time()))

    def get_new_address(self) -> dict:
        newAddress = get("https://geradornv.com.br/wp-json/api/cep/random-by-states?state=SP").json()
        return newAddress
    
    def get_new_cpf(self) -> str:
        while True:
            cpf = [randint(0, 9) for i in range(9)]
            if cpf != cpf[::-1]:
                break

        for i in range(9, 11):
            value = sum((cpf[num] * ((i + 1) - num) for num in range(0, i)))
            digit = ((value * 10) % 11) % 10
            cpf.append(digit)

        my_cpf = ''.join(map(str, cpf))
        return my_cpf