***Settings***
Documentation
...    Suite de testes destinada aos testes de carrinho para cliente em primeira compra

Resource                  ../../Login/tests/login.robot
Resource                  ../resources/cart.resource
Resource                  ../../../shared/resources/setup.resource
Resource                  ../../../shared/resources/teardown.resource

Test Setup       Access website
Test Teardown    Close website and clear cart


***Test Cases***
Cenário 01: Acessar carrinho vázio
    Dado que eu esteja navegando no westwing NOW
    Quando acessar o carrinho sem nenhum produto adicionado
    Então devo visualizar a mensagem "Seu carrinho está vazio!".

Cenário 02: Limpar carrinho
    Dado que eu esteja navegando no westwing NOW
    Quando acessar o carrinho e inserir produtos nele
    Então irei limpar o carrinho

Cenário 03: Aumentar quantidade de itens no carrinho
    Dado que eu esteja navegando no westwing NOW
    Quando acessar o carrinho e inserir produtos nele
    Então irei aumentar a quantidade de itens

Cenário 04: Diminuir quantidade de itens no carrinho
    Dado que eu esteja navegando no westwing NOW
    Quando acessar o carrinho e inserir produtos nele
    Então irei diminuir a quantidade de itens

Cenário 05: Adicionar produto na wishlist pelo carrinho
    Dado que eu esteja navegando no westwing NOW
    Quando acessar o carrinho e inserir produtos nele
    E tentar adicionar o produto na wishlist
    Então um modal será aberto para efetuar o login ou me cadastrar

Cenário 06: Acessar a tela de checkout após inserir produtos no carrinho
    Dado que eu esteja navegando no westwing NOW
    Quando acessar o carrinho e inserir produtos nele
    E optar por seguir com a compra do produto adicionado no carrinho
    Então devo ser direcionado para a tela de login e cadastro

Cenário 07: Validar preço total e valor total
    Dado que eu esteja navegando no westwing NOW
    Quando acessar o carrinho e inserir produtos nele
    Então valido preço total e valor total

Cenário 08: Validar preço total e valor total aumentando a quantidade de itens
    Dado que eu esteja navegando no westwing NOW
    Quando acessar o carrinho e inserir produtos nele
    Então valido preço total e valor total ao aumentar a quantidade

Cenário 09: Validar preço total e valor total aumentando a quantidade de itens e diminuindo
    Dado que eu esteja navegando no westwing NOW
    Quando acessar o carrinho e inserir produtos nele
    Então valido preço total e valor total ao aumentar a quantidade e diminuir

Cenário 10: Validar preço total e valor total aumentando a quantidade de itens
    Dado que eu esteja navegando no westwing NOW
    Quando inserir um produto diferente no carrinho
    Então valido preço total e valor total ao aumentar a quantidade2

Cenário 11: Validar preço total e valor total aumentando a quantidade de itens e diminuindo
    Dado que eu esteja navegando no westwing NOW
    Quando inserir um produto diferente no carrinho
    Então valido preço total e valor total ao aumentar a quantidade e diminuir2

Cenário 12: Insiro ceps validos
    Dado que eu esteja navegando no westwing NOW
    Quando inserir ceps validos
    Então todos os ceps serão calculados

Cenário 13: Insiro Ceps invalidos
    Dado que eu esteja navegando no westwing NOW
    Quando inserir ceps invalidos
    Então irei receber a mensagem de erro

Cenário 14: Não inserir os dados do CEP e calcular frete
    Dado que eu esteja navegando no westwing NOW
    Quando acessar o carrinho e inserir produtos nele
    E não informar o CEP e clicar no botão de calcular frete
    Então no campo de valor do frete deve estar com a mensagem "Calcular Frete"
    E nenhum valor somado ao preço total da compra

Cenário 15: Abrir produto pelo carrinho
    Dado que eu esteja navegando no westwing NOW
    Quando acessar o carrinho e inserir produtos nele
    E abrir o produto pelo carrinho
    Então devo ser direcionado para a página do produto

Cenário 16: Cálculo do frete com CEP elegível NDD
    Dado que eu esteja navegando no westwing NOW
    Quando adicionar um produto que seja NDD
    E inserir um CEP que seja atendido para o NDD
    Então a flag do "caminhãozinho" para produtos elegíveis NDD deve estar visível ao lado do nome do produto

Cenário 17: Cálculo do frete com CEP não elegível NDD
    Dado que eu esteja navegando no westwing NOW
    Quando adicionar um produto que seja NDD
    E inserir um CEP que não seja disponível para o NDD
    Então a flag do "caminhãozinho" para produtos elegíveis NDD não deve estar visível ao lado do nome do produto

Cenário 18: Cálculo do frete quando há mais de um produto diferente no carrinho
    Dado que eu esteja navegando no westwing NOW
    Quando acessar o carrinho e inserir mais de um produto nele
    E inserir um CEP válido para calcular frete
    Então os valores do produto, frete e valor total devem estar visíveis