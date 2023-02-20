Documentation
...Suíte com testes de cadastro

*** Settings ***
Resource                  ../compartilhado/localizadores/login/keywords.robot
Resource                  ../compartilhado/localizadores/login/variables.robot
Resource                  ../compartilhado/recursos/recursos_comuns.robot
Test Setup                Abrir navegador
Test Teardown             Fechar navegador

*** Test Case ***

Test Case 01: Cadastro com sucesso
    Dado que esteja na tela de cadastro
    Quando inserir dados validos
    Então o usúario será cadastrado com sucesso

Test Case 02: Cadastro sem sucesso desistencia
    Dado que esteja na tela de cadastro
    Quando inserir dados validos e desistir do cadastro
    Então Clico em refresh

Test Case 03: Cadastro sem sucesso
    Dado que esteja na tela de cadastro
    Quando inserir dados invalidos
    Então recebo a mensagem de dado invalido