*** Settings ***

Resource    ../../../shared/resources/common.resource
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource
Resource    ../../Login/resources/login.resource

Variables    ../../../shared/locators/login_locators.py
Variables    ../../../shared/locators/cart_locators.py
Variables    ../../../shared/locators/purchase_locators.py
Variables    ../../../shared/locators/wishlist_locators.py


Library    SeleniumLibrary
Library    FakerLibrary         locale=pt_BR



Documentation
...    Este recurso é feito exclusivamente para os testes de funcionalidade de carrinho

***Keywords***
Dado que eu esteja logado no westwing now
    Element Text Should Be              ${BUTTONREGISTER}                     Cadastre-se
    Login                               qa.test.user@westwing.com.br          1234@westwingbr

Dado que eu esteja logado no westwing now padrao stage
    Element Text Should Be              ${BUTTONREGISTER}                     Cadastre-se
    Login                               qa.test.user@westwing.com.br          123456

Quando acessar o carrinho
    Click Element                       ${HOMEBUTTONCART}
    Wait Until Element IS Visible       ${VALIDATECART}
    Wait Until Element IS Visible       ${VALIDATECARTCONTINUECOMPRANDO}

Então acesso meu carrinho westwing
    Wait Until Element IS Visible       ${VALIDATECART}
    Wait Until Element IS Visible       ${VALIDATECARTCONTINUECOMPRANDO}

Validar carrinho
    Wait Until Element IS Visible       ${VALIDATECART_PRODUTO}             10
    Wait Until Element IS Visible       ${VALIDATECARTMEDIDA}               10
    Wait Until Element IS Visible       ${VALIDATECARTQUANTIDADE}           10
    Wait Until Element IS Visible       ${VALIDATECARTPRECOTOTAL}           10
    Wait Until Element IS Visible       ${VALIDATECARTAPLICARVOUCHER}       10
    Wait Until Element IS Visible       ${VALIDATECARTINFORMESEUCEP}        10
    Wait Until Element IS Visible       ${VALIDATECARTVALORDOFRETE}         10
    Wait Until Element IS Visible       ${VALIDATECARTCALCULARFRETE}        10
    Wait Until Element IS Visible       ${VALIDATECARTVALORTOTAL}           10
    Wait Until Element IS Visible       ${VALIDATECARTCONTINUECOMPRANDO}    10
    Wait Until Element IS Visible       ${VALIDATECARTBTNCOMPRARCIMA}       10
    Wait Until Element IS Visible       ${VALIDATECARTBTNCOMPRARBAIXO}      10

Quando acessar o carrinho e inserir produtos nele
    Quando buscar por um produto valido1
    Sleep                               3                    
    Click Element                       ${HOMEBUTTONCART}
    Validar carrinho

Quando buscar por um produto valido1
    Input Text                          ${inputProduto}            ${produtoValido1} 
    Press Keys                          None                       ENTER
    Sleep                               2
    Wait Until Page Contains            ${validaBuscaProduto1}     15
    Sleep                               2
    Capture Page Screenshot
    Click Element                       ${primeiroProduto1}
    Sleep                               3
    Click Button                        ${buttonAddCart}

Quando buscar por um produto valido2
    Input Text                          ${inputProduto}            ${produtoValido2} 
    Press Keys                          None                       ENTER
    Sleep                               1 
    Wait Until Page Contains            ${validaBuscaProduto2}     15
    Sleep                               1
    Capture Page Screenshot
    Click Element                       ${primeiroProduto2}
    Sleep                               3
    Click Element                       ${buttonAddCart}
    Sleep                               3        

Quando acessar o carrinho e inserir produtos nele2
    Quando buscar por um produto valido2
    Click Element                       ${HOMEBUTTONCART}
    Validar carrinho    

Então irei limpar o carrinho
    Click Element                       ${HOMEBUTTONCART}
    Wait Until Element Is Visible       ${VALIDATECART}
    Repeat Keyword      5               limpar carrinho

Limpar carrinho
    ${checkElement}=  Run Keyword and Return Status   Wait Until Page Contains Element    ${CLEARCART}
    LOG     ${checkElement}
    IF      ${checkElement} == True
        Click Element                       ${CLEARCART}
        Wait Until Element Is Visible       ${POPUPCLEARCART}
        Click Element                       ${BUTTONCONFIRMREMOVEFROMCART}
        Wait Until Element Is Visible       ${REMOVEFROMCARTMSG}
        ELSE
        Wait Until Element Is Visible       ${VALIDATECART}
        Wait Until Element Is Visible       ${VALIDATECARTEMPTY}
    END
  
Então irei aumentar a quantidade de itens
    Click Element                       ${SELECTQUANTITY}
    Click Element                       ${QUANTITY_3}
    Wait Until Element Is Visible       ${MSGSUCCESSUPDATECART}         10

Então irei diminuir a quantidade de itens
    Click Element                       ${SELECTQUANTITY}
    Click Element                       ${QUANTITY_3}
    Wait Until Element Is Visible       ${MSGSUCCESSUPDATECART}
    Sleep                               5
    Click Element                       ${SELECTQUANTITY}
    Click Element                       ${QUANTITY_2}
    Wait Until Element Is Visible       ${MSGSUCCESSUPDATECART}

Então irei inserir o produto na wishlist e depois retirar
    Click Element                       ${ADDTOWISHLISTFROMCART}
    Wait Until Element Is Visible       ${POPUPWISHLISTCART}
    Click Element                       ${BUTTONADDWISHLIST}
    Wait Until Element Is Visible       ${MSGADDEDTOWISHLIST}
    Click Element                       ${ENTERWISHLIST}
    Wait Until Element Is Visible       ${VALIDATEWISHLIST}              10
    Wait Until Element Is Visible       ${REMOVEFROMWISHLIST}            10
    Click Element                       ${REMOVEFROMWISHLIST}
    Wait Until Page Contains            O Produto foi removido da lista "Minha wishlist"    10
    Wait Until Element Is Visible       ${MSGEMPTYWISHLIST}              10
    Click Element                       ${HOMEBUTTONCART}
    Wait Until Element Is Visible       ${VALIDATECART}           

Então acesso a tela de checkout
    Click Element                       ${VALIDATECARTBTNCOMPRARCIMA}
    Wait Until Element Is Visible       ${VALIDATECHECKOUT}
    Wait Until Element Is Visible       ${BTNCHECKOUTBACKTOCART}
    Click Element                       ${BTNCHECKOUTBACKTOCART}
    Validar carrinho

Então valido preço total e valor total
    Validar carrinho
    
Então valido preço total e valor total ao aumentar a quantidade
    Validar carrinho
    Então irei aumentar a quantidade de itens
    Validar carrinho

Então valido preço total e valor total ao aumentar a quantidade e diminuir
    Validar carrinho
    Então irei aumentar a quantidade de itens
    Validar carrinho
    Click Element                       ${SELECTQUANTITY}
    Click Element                       ${QUANTITY_2}
    Wait Until Element Is Visible       ${MSGSUCCESSUPDATECART}
    Validar carrinho

Então valido preço total e valor total ao aumentar a quantidade2
    Validar carrinho
    Então irei aumentar a quantidade de itens
    Validar carrinho

Quando inserir um produto diferente no carrinho
    Quando acessar o carrinho e inserir produtos nele2

Então valido preço total e valor total ao aumentar a quantidade e diminuir2
    Validar carrinho
    Então irei aumentar a quantidade de itens
    Validar carrinho
    Click Element                       ${SELECTQUANTITY}
    Click Element                       ${QUANTITY_2}
    Wait Until Element Is Visible       ${MSGSUCCESSUPDATECART}
    Validar carrinho

Quando inserir ceps validos
    Quando acessar o carrinho e inserir produtos nele2
    Sleep                               2
    Double Click Element                ${INPUTCEP}
    Sleep                               2
    Repeat Keyword         2            Press Keys                  ${INPUTCEP}             BACKSPACE               
    Press Keys                          ${INPUTCEP}                 07929000
    Click Element                       ${BTNCALCULARFRETE}

Então todos os ceps serão calculados
    Wait Until Element is Visible       ${VALIDATECEPSUCCESS}
    Capture Page Screenshot

Quando inserir ceps invalidos
    Quando acessar o carrinho e inserir produtos nele2
    Sleep                               2
    Double Click Element                ${INPUTCEP}
    Sleep                               2
    Repeat Keyword  2      Press Keys                                ${INPUTCEP}             BACKSPACE  
    Press Keys                          ${INPUTCEP}                  22222222
    Click Element                       ${BTNCALCULARFRETE}

Então irei receber a mensagem de erro
    Wait Until Element Is Visible       ${POSTCODEERROR}             10
    Element Text Should Be              ${POSTCODEERROR}             Por favor digite um CEP válido
    Capture Page Screenshot

E abrir o produto pelo carrinho
    Click Element                       ${PRODUCTNAMEINCART}

Então devo ser direcionado para a página do produto
    Wait Until Element Is Visible       ${VALIDATEPRODUCTNAME}
    Element Text Should Be              ${VALIDATEPRODUCTNAME}       ${produtoValido1}

Quando adicionar um produto que seja NDD
    Quando buscar por um produto valido1
    Sleep                               2        
    Click Element                       ${HOMEBUTTONCART}
    Validar carrinho

E inserir um CEP que seja atendido para o NDD
    Input Text                          ${INPUTCEP}                    05371000
    Click Element                       ${BTNCALCULARFRETE}

Então a flag do "caminhãozinho" para produtos elegíveis NDD deve estar visível ao lado do nome do produto
    Wait Until Page Contains Element    ${ISNDD}                       10  
    
E inserir um CEP que não seja disponível para o NDD
    Input Text                          ${INPUTCEP}                    07902250
    Click Element                       ${BTNCALCULARFRETE}   

Então a flag do "caminhãozinho" para produtos elegíveis NDD não deve estar visível ao lado do nome do produto
    Wait Until Element Is Not Visible   ${ISNDD}                       10

Quando acessar o carrinho e inserir mais de um produto nele
    Quando buscar por um produto valido1
    Quando buscar por um produto valido2
    Click Element                       ${HOMEBUTTONCART}
    Validar carrinho
    
E inserir um CEP válido para calcular frete
    Input Text                          ${INPUTCEP}                    05371000
    Click Element                       ${BTNCALCULARFRETE}

Então os valores do produto, frete e valor total devem estar visíveis
    Wait Until Element Is Visible       ${VALIDATEPRICEPRODUCT1}       10
    Wait Until Element Is Visible       ${VALIDATEPRICEPRODUCT2}       10
    Wait Until Element Is Visible       ${VALIDATECARTVALORDOFRETE}    10       
    Wait Until Element Is Visible       ${VALIDATECARTVALORTOTAL}      10  

Dado que eu esteja navegando no westwing NOW
    Element Text Should Be              ${BUTTONREGISTER}              Cadastre-se
    Click Element                       ${COOKIEPOLICYOVERLAY}

Quando acessar o carrinho sem nenhum produto adicionado
    Click Element                       ${HOMEBUTTONCART}
    Wait Until Element IS Visible       ${VALIDATECART}
    Wait Until Element IS Visible       ${VALIDATECARTCONTINUECOMPRANDO}

Então devo visualizar a mensagem "Seu carrinho está vazio!".
    Wait Until Element Is Visible       ${VALIDATECARTEMPTY }          10

E tentar adicionar o produto na wishlist
    Click Element                       ${ADDTOWISHLISTFROMCART} 

Então um modal será aberto para efetuar o login ou me cadastrar
    Wait Until Element Is Visible       ${NEWHERE}                     10
    Element Should Contain              ${NEWHERE}                     Novo no Westwing?
    Wait Until Element Is Visible       ${BTNREGISTER_MODAL}           10
    Wait Until Element Is Visible       ${BTNLOGIN_MODAL}              10
    Click Element                       ${BTNCLOSE_MODAL}
    Wait Until Element Is Visible       ${VALIDATECART}                10

E optar por seguir com a compra do produto adicionado no carrinho
    Click Element                      ${VALIDATECARTBTNCOMPRARCIMA}

Então devo ser direcionado para a tela de login e cadastro
    Wait Until Page Contains Element    ${BREADCRUMBSCHECKOUT}         10
    Element Should Contain              ${TITLELOGIN_CHECKOUT}         Eu já sou um cliente Westwing
    Element Should Contain              ${TITLEREGISTER_CHECKOUT}      Eu sou novo aqui
    Page Should Contain Element         ${BTNLOGIN_CHECKOUT}
    Page Should Contain Element         ${BTNREGISTER_CHECKOUT}
    Click Element                       ${BTNCHECKOUTBACKTOCART}
    Validar carrinho

E não informar o CEP e clicar no botão de calcular frete
    ${price1}  Get Text                 ${VALIDATEPRICEPRODUCT1}
    Set Global Variable                 ${price1}
    Element Text Should Be              ${INPUTCEP}                    ${EMPTY}
    Click Element                       ${BTNCALCULARFRETE}

Então no campo de valor do frete deve estar com a mensagem "Calcular Frete"
    Wait Until Element Is Visible       ${FIELD_DELIVERYVALUE}         10
    Element Should Contain              ${FIELD_DELIVERYVALUE}         Calcular Frete       
    
E nenhum valor somado ao preço total da compra
    Element Should Contain              ${FIELD_TOTALVALUE}            ${price1}