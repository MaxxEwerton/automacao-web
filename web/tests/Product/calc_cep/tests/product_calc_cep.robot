***Settings***
Resource    ../resources/product_calc_cep.resource

Test Setup       Access website
Test Teardown    Close website


Documentation
...    Suite de testes destinada aos testes de Login. Qualquer outra feature do sistema
...    deverá ser escrita em outro arquivo.

***Test Cases***
1 - Calculo CEP Invalido
    DADO que eu esteja na pagina de produto
    QUANDO calcular um CEP invalido
    ENTÃO o sistema deve exibir mensagem de erro

2 - Calculo CEP Válido com Rua
    DADO que eu esteja na pagina de produto
    QUANDO calcular um CEP que preencha a rua do endereço
    ENTÃO o sistema deve aplicar o CEP e apresentar a estimativa
 3 - Calculo CEP Sem Rua     
    DADO que eu esteja na pagina de produto
    QUANDO calcular um CEP sem rua
    ENTÃO o sistema deve aplicar o CEP e apresentar a estimativa sem rua

 4 - Calculo com campo vazio
    DADO que eu esteja na pagina de produto
    QUANDO calcular um o CEP sem preencher o CEP
    ENTÃO o sistema deve exibir mensagem de erro solicitando o CEP

# 5 - Calculo do CEP produto esgotado - ***ATENÇÃO*** - Teste comentado até integração com banco de dados for implementado para gerar produtos esgotados
#     DADO que eu esteja na pagina de produto esgotado
#     QUANDO acessar a tela 
#     ENTÃO o campo de consulta CEP não deve ser exibido

6 - Calculo CEP elegível NDD
    DADO que eu esteja na pagina de produto NDD
    QUANDO calcular um o CEP elegível a NDD
    ENTÃO o sistema deve calcular o CEP e exibir o ícone do NDD

7 - Calculo CEP não elegível NDD
    DADO que eu esteja na pagina de produto NDD
    QUANDO calcular um o CEP não elegível a NDD
    ENTÃO o sistema deve calcular o CEP e exibir o icone do NDD

8 - Calcular CEP com novo usuario
    DADO que eu esteja logado com um novo usuario
    QUANDO eu acessar a tela de um produto
    E calcular um CEP valido
    ENTÃO o sistema deve aplicar o CEP e apresentar a estimativa