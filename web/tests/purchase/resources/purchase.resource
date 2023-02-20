***Settings***
Resource    ../../Login/resources/login.resource
Resource    ../../Register/resources/register.resource
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource
Resource    ../../../shared/resources/common.resource

Variables    ../../../shared/locators/purchase_locators.py

Library    SeleniumLibrary
Library    FakerLibrary         locale=pt_BR
Library    Collections

Documentation
...    Este recurso é feito exclusivamente para os testes de funcionalidade de compra

***Keywords***
Dado que eu estou logado no westwing now
    Element Text Should Be      ${buttonRegister}                  Cadastre-se
    Login                       qa.test.user@westwing.com.br       1234@westwingbr

Dado que sou um novo usuário
    Click Element                       ${buttonRegister}                  
    Wait Until Element Is Visible       ${identifierTextField}

    ${firstName}                        FakerLibrary.First Name 
    ${lastName}                         FakerLibrary.Last Name      
    ${email}                            Get Random Email
    Fill in registration                ${firstName}                    ${lastName}    ${email}   123456  
    Click Element                       ${acceptedTerms}
    Click and Scroll Item               ${buttonRegisterForFree}  
    Wait Until Page Contains            Cadastro realizado com sucesso  30
    

Quando realizar a primeira compra via PIX
    Pesquisar por um produto
    Adicionar produto ao carrinho
    Acessar carrinho
    Checkout PIX na primeira compra


Quando realizar uma compra por PIX com endereço já cadastrado
    Pesquisar por um produto
    Adicionar produto ao carrinho
    Acessar carrinho
    Checkout PIX com endereço já cadastrado

Quando realizar uma compra por PIX trocando um endereço de entrega já cadastrado
    Pesquisar por um produto
    Adicionar produto ao carrinho
    Acessar carrinho
    Checkout PIX alterando endereço de entrega já cadastrado

Pesquisar por um produto
    Input Text                          ${SEARCH_BAR_INPUT}        Faca de
    Press Keys                          None                       ENTER
    Wait Until Element Is Visible       ${FIRST_SEARCH_RESULT}     30
    Click Element                       ${FIRST_SEARCH_RESULT}

Adicionar produto ao carrinho
    Wait Until Element Is Visible       ${ADD_PRODUCT_TO_CART_BUTTON}   30
    Click Element                       ${ADD_PRODUCT_TO_CART_BUTTON}
    Wait Until Element Is Visible       ${VALIDATE_PRODUCT_AT_CART}     30

Acessar carrinho
    Click Element                       ${ACCESS_CART_BUTTON}
    Sleep                               1

Checkout PIX com endereço já cadastrado
    Click Element                       ${PROCEED_TO_CHECKOUT_BUTTON}
    Sleep                               1
    Click and Scroll Item               ${CHECKOUT_BUTTON_PIX}
    Click Element                       ${CONFIRM_PAYMENT_METHOD}
    Finalizar pedido

Checkout PIX alterando endereço de entrega já cadastrado
    Sleep  1
    Click Element                       ${PROCEED_TO_CHECKOUT_BUTTON}
    Sleep                               1
    Click and Scroll Item               ${CHECKOUT_BUTTON_PIX}
    Click Element                       ${CONFIRM_PAYMENT_METHOD}
    Sleep  3
    Click Element                       ${EDIT_SHIPPING_ADDRESS_BUTTON}
    Editar endereço já existente
    Finalizar pedido

Checkout PIX na primeira compra
    Sleep                    1
    Click Element            ${PROCEED_TO_CHECKOUT_BUTTON}
    Sleep                    1
    ${cpf}=                  Get New Cpf
    &{myAddress}=            Get New Address
    ${myPostalCode}=         Get From Dictionary      ${myAddress}                     cep
    ${myAddressNumber}=      Evaluate                 random.sample(range(1, 11), 3)   random

    Input Text  ${BILLING_ADDRESS_CPF}      ${cpf}
    Input Text  ${BILLING_ADDRESS_CEP}      ${myPostalCode}
    Input Text  ${BILLING_ADDRESS_NUMBER}   ${myAddressNumber}
    Input Text  ${BILLING_ADDRESS_PHONE}    19992898282

    Sleep  1
    Press Keys    None      ENTER

    Wait Until Page Contains    Endereço salvo com sucesso   15

    Click and Scroll Item               ${CHECKOUT_BUTTON_PIX}
    Click Element                       ${CONFIRM_PAYMENT_METHOD}
    Finalizar pedido

Finalizar pedido
    Sleep                               1
    Page Should contain                 ${ORDER_CONFIRMATION_TEXT}
    Click Element                       ${CONFIRM_ORDER_BUTTON}
    Sleep                               3

Editar endereço já existente
    &{myAddress}=        Get New Address
    ${myPostalCode}=     Get From Dictionary    ${myAddress}  cep
    ${myAddressNumber}=  Evaluate               random.sample(range(1, 11), 3)  random
    ${myFirstName}=      Get From Dictionary    ${myAddress}    city
    ${myLasttName}=      Get From Dictionary    ${myAddress}    neighborhood

    Click Element    ${ADDRESS_FEMALE_USER_GENDER}

    Click Element         ${ADDRESS_FIRST_NAME}
    Clear Element Text    ${ADDRESS_FIRST_NAME}
    Input Text            ${ADDRESS_FIRST_NAME}    ${myFirstName}
    Sleep  1

    Click Element         ${ADDRESS_LAST_NAME}
    Clear Element Text    ${ADDRESS_LAST_NAME}
    Input Text            ${ADDRESS_LAST_NAME}    ${myLasttName}
    Sleep  1
    
    Click Element         ${ADDRESS_CEP}
    Clear Element Text    ${ADDRESS_CEP}
    Input Text            ${ADDRESS_CEP}    ${myPostalCode}
    Sleep  1

    Click and Scroll Item    ${ADDRESS_NUMBER}
    Sleep  5
    Clear Element Text       ${ADDRESS_NUMBER}
    Input Text               ${ADDRESS_NUMBER}    ${myAddressNumber}
    Sleep  1

    Click and Scroll Item    ${ADDRESS_PHONE_NUMBER}
    Clear Element Text       ${ADDRESS_PHONE_NUMBER}
    Input Text               ${ADDRESS_PHONE_NUMBER}    19992898282
    Sleep  1
    Press Keys    None      ENTER
    Sleep  1

    Wait Until Page Contains    Endereço salvo com sucesso   15

Então a compra deverá ser feita com sucesso
    Wait Until Page Contains      ${TEXT_PURCHASE_SUCCESS}    20
