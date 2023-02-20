***Settings***
Resource    ../resources/wishlist.resource
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource
Resource    ../../../shared/resources/common.resource
Resource    ../../../tests/Login/resources/login.resource

Variables    ../../../shared/locators/wishlist_locators.py

Library    SeleniumLibrary
Library    FakerLibrary                        locale=pt_BR
Library    ../../../shared/libs/EmailLib.py


Documentation
...    Este recurso é feito exclusivamente para os testes de funcionalidade de wishlist

*** Variable ***
${productDescription}          Descrição do produto
${firstProductDescription}     Descrição primeiro produto
${secondProductDescription}    Descrição segundo produto
${thirdProductDescription}     Descrição terceiro produto
${firstNameWishlist}           Nome da primeira Wishlist personalizada
${secondNameWishlist}          Nome da segunda Wishlist personalizada

*** Keywords ***
Dado que sou um usuário logado no Now
    Login                                    qa.test.user@westwing.com.br  1234@westwingbr    

Quando clicar para adicionar itens na wishlist
    Click to Add Items                       1    1    1

Então deve abrir uma pop-up para inserção
    Wait Until Element Is Visible           ${SELECTWISHLIST}              15
    Element Text Should Be                  ${SELECTWISHLIST}              SELECIONAR WISHLIST
    Click Element                           ${CLOSEADDWISHLIST}

E devo conseguir inserir itens diversos na minha lista carregando os campos corretamente
    Add products to wishlist                ${PRODUCTNAME}\[1]             ${WISHLISTICONINACTIVE}\[1]
    Set Global Variable                     ${firstProductDescription}     ${productDescription}
    Add products to wishlist                ${PRODUCTNAME}\[2]             ${WISHLISTICONINACTIVE}\[2]
    Set Global Variable                     ${secondProductDescription}    ${productDescription}
    Add products to wishlist                ${PRODUCTNAME}\[3]             ${WISHLISTICONINACTIVE}\[3]
    Set Global Variable                     ${thirdProductDescription}     ${productDescription}
    Click and Scroll Item                   ${WISHLISTBUTTON}
    Wait Until Page Contains                ${firstProductDescription}     15    
    Wait Until Page Contains                ${secondProductDescription}    15
    Wait Until Page Contains                ${thirdProductDescription}     15
    FOR     ${index}    IN RANGE            3
        Sleep                               2                           
        Set Local Variable                  ${index}                       ${index}+1               
        Page Should Contain Image           ${IMAGEPRODUCT}\[${index}]
        Page Should Contain Element         ${PRODUCTPRICE}\[${index}] 
        Page Should Contain Element         ${PRODUCTSIZE}\[${index}]
    END   
    Remove All Custom Wishlist

Quando clicar para adicionar itens na wishlist através da tela detalhes do produto
    Wait Until Element Is Visible           ${CATEGORY}\[1]                15
    Click Element                           ${CATEGORY}\[1] 
    Set Local Variable                      ${index}                       15
    Click and Scroll Item                   ${PRODUCTNAME}\[${index}]
    Click and Scroll Item                   ${ADDWISHLISTBUTTON}

Então deve abrir uma pop-up para inserção conseguindo inserir itens na lista
    Wait Until Element Is Visible           ${SELECTWISHLIST}             15
    Element Text Should Be                  ${SELECTWISHLIST}             SELECIONAR WISHLIST
    Click Element                           ${ADDTOWISHLISTBUTTON}

Dado que sou um usuário logado no Now querendo adicionar itens na wishlist
    Login                                   qa.test.user@westwing.com.br  1234@westwingbr

Quando clicar para adicionar itens na wishlist criando uma nova pela tela de produtos
    Wait Until Element Is Visible           ${CATEGORY}\[2]               15
    Click Element                           ${CATEGORY}\[2]
    Scroll Item                             ${PRODUCTNAME}\[1]
    ${getTextProductDescription}            Get Text                      ${PRODUCTNAME}\[1]
    Set Suite Variable                      ${textProductDescription}     ${getTextProductDescription} 
    Click and Scroll Item                   ${PRODUCTNAME}\[1]
    Click and Scroll Item                   ${ADDWISHLISTBUTTON}

Então deve abrir uma pop-up para inserção conseguindo criar outras wishlists
    Wait Until Element Is Visible           ${SELECTWISHLIST}             15
    Element Text Should Be                  ${SELECTWISHLIST}             SELECIONAR WISHLIST
    ${randomWord}                           FakerLibrary.city
    Set Global Variable                     ${firstNameWishlist}          ${randomWord}
    Create New Wishlist                     ${NEWWISHLIST}                ${NEWWISHLISTNAME}    ${firstNameWishlist}     ${ADDTOWISHLISTBUTTON}    
    Sleep                                   2
    Click and Scroll Item                   ${WISHLISTBUTTON}
    Click and Scroll Item                   ${NEWCUSTOMWISHLIST}
    Sleep                                   2
    Page Should Contain                     ${textProductDescription}
    Remove All Custom Wishlist

Quando clicar para criar uma wishlist sem ser a padrão pela tela de Wishlist
    Click and Scroll Item                   ${WISHLISTBUTTON}
    Click and Scroll Item                   ${ADDLISTBUTTON}

Então deve abrir uma pop-up para criação de Wishlists
    ${randomWord}                           FakerLibrary.city
    Set Global Variable                     ${secondNameWishlist}        ${randomWord}
    Create New Wishlist                     ${INPUTADDLISTBUTTONNAME}    ${INPUTADDLISTBUTTONNAME}    ${secondNameWishlist}   ${ADDBUTTON}
    Remove All Custom Wishlist

Dado que sou um usuário deslogado no Now
    Page Should Contain                     Cadastre-se

Quando clicar para adicionar itens na wishlist na tela de produtos
    Click to Add Items                      3    1    1

Então deve ser aberta a pop-up de login conseguindo me logar
    Page Should Contain                     Novo no Westwing?
    Click Element                           ${COOKIEPOLICYOVERLAY}
    Click and Scroll Item                   ${LOGINNOW}
    Login Wishlist                          qa.test.user@westwing.com.br  1234@westwingbr 

Quando clicar para adicionar itens na wishlist pela tela detalhes do produto
    Wait Until Element Is Visible           ${CATEGORY}\[4]               15
    Click Element                           ${CATEGORY}\[1] 
    Set Local Variable                      ${index}                      11
    Click and Scroll Item                   ${PRODUCTNAME}\[${index}]
    Click and Scroll Item                   ${ADDWISHLISTBUTTON}

Quando acessar a página de Wishlist
    Click and Scroll Item                   ${WISHLISTBUTTON}
    Wait Until Element Is Visible           ${STANDARWISHLIST}            15
    ${countCustomWishlist}    Get Element Count                           ${LISTNAME}
    ${totalCustomWishlist}    Convert To Integer                          ${countCustomWishlist}
    IF  ${TotalCustomWishlist} == 1
        Click and Scroll Item               ${ADDLISTBUTTON}
        ${randomWord}                       FakerLibrary.Color Name
        Set Global Variable                 ${secondNameWishlist}         ${randomWord}
        Create New Wishlist                 ${INPUTADDLISTBUTTONNAME}     ${INPUTADDLISTBUTTONNAME}    ${secondNameWishlist}    ${ADDBUTTON}
    END

Então devo conseguir trocar um item de uma wishlist para outra
    Wait Until Element Is Visible           ${STANDARWISHLIST}            15
    Click and Scroll Item                   ${STANDARWISHLIST}
    Scroll Item                             ${NEWCUSTOMWISHLIST}
    Wait Until Element Is Visible           ${PRODUCTNAMEWishlist}        15
    ${getProductDescriptionWishlist}        Get Text                      ${PRODUCTNAMEWishlist}    
    Click and Scroll Item                   ${CHANGEWISHLIST}
    Click and Scroll Item                   ${MYWISHLIST}
    Click and Scroll Item                   ${ADDTOWISHLISTBUTTON}
    Mouse Up                                ${WISHLISTBUTTON}
    Wait Until Element Is Visible           ${NEWCUSTOMWISHLIST}
    Click and Scroll Item                   ${NEWCUSTOMWISHLIST}
    Wait Until Element Is Visible           ${PRODUCTNAMEWishlist}         15
    Page Should Contain                     ${getProductDescriptionWishlist} 

Então devo conseguir trocar o nome da wishlist personalizada
    Click and Scroll Item                   ${NEWCUSTOMWISHLIST}
    Click and Scroll Item                   ${EDITWISHLIST}
    Click and Scroll Item                   ${INPUTLISTNAME}
    Clear Element Text                      ${INPUTLISTNAME}
    ${randomWord}                           FakerLibrary.Country                                             
    Set Global Variable                     ${firstNameWishlist}          ${randomWord}
    Input Text                              ${INPUTLISTNAME}              ${firstNameWishlist} 
    Click and Scroll Item                   ${RENAMELIST}
    Wait Until Element Is Visible           ${WISHLISTBUTTON}
    Scroll Item                             ${WISHLISTBUTTON}
    Wait Until Element Is Visible           ${LISTNAME}\[contains(.,'${firstNameWishlist}')]    15
    Element Text Should Be                  ${LISTNAME}\[contains(.,'${firstNameWishlist}')]    ${firstNameWishlist}

Quando clicar para remover as wishlist personalizadas
    Click and Scroll Item                   ${WISHLISTBUTTON}
    Wait Until Element Is Visible           ${STANDARWISHLIST}            15
    ${countCustomWishlist}    Get Element Count                           ${LISTNAME}
    ${totalCustomWishlist}    Convert To Integer                          ${countCustomWishlist}
    IF  ${totalCustomWishlist} == 1
        Click and Scroll Item               ${ADDLISTBUTTON}
        ${randomWord}                       FakerLibrary.Color Name
        Set Global Variable                 ${secondNameWishlist}         ${randomWord}
        Create New Wishlist                 ${INPUTADDLISTBUTTONNAME}     ${INPUTADDLISTBUTTONNAME}    ${secondNameWishlist}    ${ADDBUTTON}
    END
    Sleep                                   2
    Remove All Custom Wishlist

Então devo conseguir excluir com sucesso
    Wait Until Page Does Not Contain        ${NEWCUSTOMWISHLIST}          15
    Scroll Element Into View                ${STANDARWISHLIST}
    Page Should Not Contain Element         ${LISTNAME}\[2] 
    Page Should Not Contain Element         ${LISTNAME}\[3]   
        

Quando clicar para remover os itens da wishlist
    Remove All Wishlist Items    

Então devo conseguir ver a mensagem "Esta lista está atualmente vazia"
    Wait Until Element Is Visible           ${WISHLISTNOPRODUCTSINFO}     15
    Element Should Contain                  ${WISHLISTNOPRODUCTSINFO}     Esta lista está atualmente vazia.

E adicionar itens na wishlist
    Click to Add Items                      1    1    1
    Wait Until Element Is Visible           ${SELECTWISHLIST}             15
    Element Text Should Be                  ${SELECTWISHLIST}             SELECIONAR WISHLIST
    Click Element                           ${CLOSEADDWISHLIST}
    Add products to wishlist                ${PRODUCTNAME}\[1]            ${WISHLISTICONINACTIVE}\[1]
    Scroll Element Into View                ${WISHLISTBUTTON}
    Sleep                                   2    
    Click Element                           ${WISHLISTBUTTON}
    




Click to Add Items
    [Arguments]  ${indexCategory}           ${indexProductName}    ${indexWishlistIconInactive} 
    Wait Until Element Is Visible           ${CATEGORY}\[${indexCategory}]                             15
    Click Element                           ${CATEGORY}\[${indexCategory}]
    Scroll Item                             ${PRODUCTNAME}\[${indexProductName}]
    Mouse Up                                ${PRODUCTNAME}\[${indexProductName}]
    Mouse Up                                ${WISHLISTICONINACTIVE}\[${indexWishlistIconInactive}]
    Click Element                           ${WISHLISTICONINACTIVE}\[${indexWishlistIconInactive}]
    ${iconactive}    Run Keyword And Return Status  Wait Until Element Is Visible    ${SELECTWISHLIST}    15
    Run Keyword If    ${iconactive} == False     Double Click Element    ${WISHLISTICONINACTIVE}\[${indexWishlistIconInactive}]   

Add Products to Wishlist
    [Arguments]  ${PRODUCTNAME}             ${wishlistIcon}
    Scroll Item                             ${PRODUCTNAME}
    Mouse Up                                ${PRODUCTNAME}
    ${getProductDescription}                Get Text                   ${PRODUCTNAME}              
    Set Global Variable                     ${productDescription}      ${getProductDescription}    
    Mouse Up                                ${wishlistIcon}
    Sleep                                   2                          #Aguardando tela carregar os elementos
    Click Element                           ${wishlistIcon}
    ${iconactive}    Run Keyword And Return Status    Wait Until Element Is Visible    ${SELECTWISHLIST}    5
    Run Keyword If   ${iconactive} == False    Double Click Element    ${wishlistIcon}
    Wait Until Element Is Visible           ${ADDTOWISHLISTBUTTON}     15                         
    Click Element                           ${ADDTOWISHLISTBUTTON}

Create New Wishlist
    [Arguments]  ${firstButtonClick}        ${inputText}               ${wishlistName}    ${secondButtonClick} 
    Click Element                           ${firstButtonClick}
    Click Element                           ${inputText}
    Input Text                              ${inputText}               ${wishlistName}    
    Sleep                                   2
    Click and Scroll Item                   ${secondButtonClick}

Login Wishlist
    [Arguments]  ${identifier}              ${password}      
    Wait Until Element Is Visible           ${IDENTIFIERTEXTFIELDWISHLIST}    
    Input Text                              ${IDENTIFIERTEXTFIELDWISHLIST}    ${identifier}
    Input Text                              ${PASSWORDTEXTFIELDWISHLIST}      ${password} 
    Click Element                           ${BUTTONLOGINWISHLIST}

Remove All Wishlist Items
    Wait Until Element Is Visible           ${WISHLISTBUTTON}           15
    ${quantityItemsText}                    Get Element Count           ${BUTTONDELETEFROMWISHLIST}
    ${quantityItems}                        Convert To Integer          ${quantityItemsText} 
    FOR   ${index}   IN RANGE               ${quantityItems}
        IF  ${quantityItems} != 0
            Sleep                           2                            
            Click Element                   ${BUTTONDELETEFROMWISHLIST}
            Wait Until Page Contains        O Produto foi removido da lista "Minha wishlist"    15
        END
    END

Remove All Custom Wishlist
    ${countCustomWishlist}    Get Element Count    ${LISTNAME}
    ${totalCustomWishlist}    Convert To Integer   ${countCustomWishlist}
    FOR    ${index}    IN RANGE    ${totalCustomWishlist}-1
        IF  ${totalCustomWishlist} != 0
            Wait Until Element Is Visible   ${NEWCUSTOMWISHLIST}        15
            Scroll Element Into View        ${NEWCUSTOMWISHLIST}
            Click and Scroll Item           ${NEWCUSTOMWISHLIST}
            Click and Scroll Item           ${EDITWISHLIST}
            Wait Until Element Is Visible   ${DELETELIST}               15    
            Click and Scroll Item           ${DELETELIST}
            Wait Until Element Is Visible   ${CONFIRMBUTTON}            15
            Click and Scroll Item           ${CONFIRMBUTTON}
        END
    END