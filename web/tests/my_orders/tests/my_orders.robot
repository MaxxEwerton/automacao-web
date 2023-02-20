***Settings***
Resource                  ../resources/my_orders.resource

Test Setup       Access website
Test Teardown    Close website

Documentation
...    Suite de testes destinada aos testes dos meus pedidos

***Test Cases***

Cenário 01: Acessar a lista de pedidos
    Dado que estou logado em uma conta que já possui ao menos um pedido feito
    Quando acessar os meus pedidos
    Então deverei ver a lista de meus pedidos

Cenário 02: Acessar um pedido
    Dado que estou logado em uma conta que já possui ao menos um pedido feito
    Quando eu acessar um pedido
    Então as informações do pedido deverão ser exibidas

Cenário 03: Acessar a aba de fale conosco
    Dado que estou logado em uma conta que já possui ao menos um pedido feito
    Quando acessar a aba de fale conosco
    Então o sistema deverá me direcionar para a tela de contato

Cenário 04: Acessar a tela de meus pedidos sem nenhum pedido
    Dado que estou logado em uma conta que não possui pedidos
    Quando acessar os meus pedidos
    Então uma tela informando que não há pedidos deverá ser exibida
