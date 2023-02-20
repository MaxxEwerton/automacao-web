***Settings***
Resource                  ../resources/purchase.resource

Test Setup       Access website
Test Teardown    Close website

Documentation

...    Suite de testes destinada aos testes de compra
***Test Cases***
    
Cenário 01: Compra por PIX com endereço já cadastrado
    Dado que eu estou logado no westwing now
    Quando realizar uma compra por PIX com endereço já cadastrado
    Então a compra deverá ser feita com sucesso

Cenário 02: Compra por PIX inserindo novo endereço de entrega
    Dado que eu estou logado no westwing now
    Quando realizar uma compra por PIX trocando um endereço de entrega já cadastrado
    Então a compra deverá ser feita com sucesso

Cenário 03: Compra por PIX com novo usuário
    Dado que sou um novo usuário
    Quando realizar a primeira compra via PIX
    Então a compra deverá ser feita com sucesso