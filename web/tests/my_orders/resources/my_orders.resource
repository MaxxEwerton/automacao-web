***Settings***
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource
Resource    ../../../tests/Login/resources/login.resource

Variables     ../../../shared/locators/my_orders_locators.py

*** Keywords ***

Dado que estou logado em uma conta que já possui ao menos um pedido feito
    Login    qa.test.user@westwing.com.br    1234@westwingbr 

Dado que estou logado em uma conta que não possui pedidos
    Login    besasa2560@nevyxus.com    123456

Quando eu acessar um pedido
    Acessar tela de pedidos
    Click Element                   ${MOST_RECENT_ORDER}

Quando acessar a aba de fale conosco
    Acessar tela de pedidos
    Click Element                   ${MOST_RECENT_ORDER}
    Click Element                   ${CONTACT_BUTTON}

Quando acessar os meus pedidos
    Acessar tela de pedidos

Então as informações do pedido deverão ser exibidas
    Wait Until Page Contains Element    ${ORDER_TRACKING}    30
    Page Should Contain Element         ${CONTACT_BUTTON}
    Page Should Contain Element         ${ORDER_RESUME}

Então o sistema deverá me direcionar para a tela de contato
    Wait Until Page Contains       Fale Conosco WestwingNow    30
    Page Should Contain Element    ${FAQ_ELEMENTS}
    Page Should Contain Element    ${CONTACT_CENTRAL}

Então deverei ver a lista de meus pedidos
    Wait Until Page Contains Element    ${ORDERS_TABLE}             30
    Page Should Contain Element         ${ORDER_NUMBER_COLUMN}
    Page Should Contain Element         ${ORDER_STATUS_COLUMN}
    Page Should Contain Element         ${ORDER_DATE_COLUMN}
    Page Should Contain Element         ${ORDER_PRICE_COLUMN}
    Page Should Contain Element         ${ORDER_ACTION_COLUMN}
    Page Should Contain Element         ${ORDER_ELEMENT}

Então uma tela informando que não há pedidos deverá ser exibida
    Wait Until Page Contains    Desculpe, você não tem nenhum pedido    30

Acessar tela de pedidos
    Click Element               ${MY_ORDERS_BUTTON}
    Wait Until Page Contains    Encontre aqui seus últimos pedidos    30
