*** Settings ***
Resource    ../../../shared/resources/common.resource
Resource    ../../Login/resources/login.resource
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource

Variables    ../../../shared/locators/login_locators.py
Variables    ../../../shared/locators/account_information.py


Library    SeleniumLibrary
Library    FakerLibrary         locale=pt_BR


Documentation
...    Este recurso é feito exclusivamente para os testes de funcionalidade de informações da conta

***Keywords***
Dado que eu esteja logado no westwing now
    Element Text Should Be                      ${BUTTONREGISTER}                 Cadastre-se
    Login                                       qa.test.user@westwing.com.br      1234@westwingbr

Dado que eu esteja logado no westwing now padrao stage
    Element Text Should Be                      ${BUTTONREGISTER}                 Cadastre-se
    Login                                       qa.test.user@westwing.com.br      123456

Quando acessar informações da conta
    Wait Until Element Is Visible               ${BUTTONINFOACOUNT}               15    
    Click and Scroll Item                       ${BUTTONINFOACOUNT}
    Wait Until Element Is Visible               ${ACOUNTINFO}                     15 
    Click Element                               ${ACOUNTINFO}
    Should Contain                              ${PATHLOCATORINFOCONTA}           Informações da conta

Então irei ver as informações da conta
    Should Contain                              ${PATHLOCATORINFOCONTA}           Informações da conta
    Capture Page Screenshot

Então altero a senha com sucesso padrao stage
    Wait Until Element Is Visible               ${BUTTONPASSWORD}                 15
    Click Element                               ${BUTTONPASSWORD}
    Sleep                                       2
    Input Text                                  ${CONFIRMPASSWORDPATH}            1234@westwingbr
    Input Text                                  ${NEWPASSWORDPATH}                123456
    Input Text                                  ${CONFIRMNEWPASSWORDPATH}         123456
    Click Element                               ${BUTTONCONFIRMPASSWORDCHANGE}   

Então altero a senha com sucesso padrao qa user
    Wait Until Element Is Visible               ${BUTTONPASSWORD}                 15
    Click Element                               ${BUTTONPASSWORD}
    Sleep                                       2
    Input Text                                  ${CONFIRMPASSWORDPATH}            123456
    Input Text                                  ${NEWPASSWORDPATH}                1234@westwingbr
    Input Text                                  ${CONFIRMNEWPASSWORDPATH}         1234@westwingbr
    Click Element                               ${BUTTONCONFIRMPASSWORDCHANGE}
    
Então salvo com a mesma senha
    Wait Until Element Is Visible               ${BUTTONPASSWORD}                 15
    Click Element                               ${BUTTONPASSWORD}
    Sleep                                       2
    Input Text                                  ${CONFIRMPASSWORDPATH}            1234@westwingbr
    Input Text                                  ${NEWPASSWORDPATH}                1234@westwingbr
    Input Text                                  ${CONFIRMNEWPASSWORDPATH}         1234@westwingbr
    Click Element                               ${BUTTONCONFIRMPASSWORDCHANGE}
    Wait Until Element Is Visible               A nova senha não pode ser igual a antiga    15
    

Então clico em salvar a senha sem preencher os dados
    Wait Until Element Is Visible               ${BUTTONPASSWORD}                 15
    Click Element                               ${BUTTONPASSWORD}
    Sleep                                       2
    Click Element                               ${BUTTONCONFIRMPASSWORDCHANGE}
    Wait Until Element Is Visible               ${PATHMSGPASSWORDERRORATUAL}
    Wait Until Element Is Visible               ${PATHMSGPASSWORDERRORNOVA}
    Wait Until Element Is Visible               ${PATHMSGPASSWORDERRORCONFIRME}  

Então deixo a senha vazia na atual
    Wait Until Element Is Visible               ${BUTTONPASSWORD}                 15
    Click Element                               ${BUTTONPASSWORD}
    Sleep                                       2
    Input Text                                  ${NEWPASSWORDPATH}                1234@westwingbr
    Input Text                                  ${CONFIRMNEWPASSWORDPATH}         1234@westwingbr
    Click Element                               ${BUTTONCONFIRMPASSWORDCHANGE}
    Wait Until Element Is Visible               ${PATHMSGPASSWORDERRORATUAL}

Então deixo a senha vazia na nova
    Wait Until Element Is Visible               ${BUTTONPASSWORD}                 15
    Click Element                               ${BUTTONPASSWORD}
    Sleep                                       2
    Input Text                                  ${CONFIRMPASSWORDPATH}            1234@westwingbr
    Input Text                                  ${NEWPASSWORDPATH}                1234@westwingbr
    Click Element                               ${BUTTONCONFIRMPASSWORDCHANGE}
    Wait Until Element Is Visible               ${MSGSENHASNAOIGUAIS}

Então deixo a senha vazia na confirmação
    Wait Until Element Is Visible               ${BUTTONPASSWORD}                 15
    Click Element                               ${BUTTONPASSWORD}
    Sleep                                       2
    Input Text                                  ${CONFIRMPASSWORDPATH}            1234@westwingbr
    Input Text                                  ${CONFIRMNEWPASSWORDPATH}         1234@westwingbr
    Click Element                               ${BUTTONCONFIRMPASSWORDCHANGE}
    Wait Until Element Is Visible               ${PATHMSGPASSWORDERRORNOVA}

Então digito senha atual invalida
    Wait Until Element Is Visible               ${BUTTONPASSWORD}                 15
    Click Element                               ${BUTTONPASSWORD}
    Sleep                                       2
    Input Text                                  ${CONFIRMPASSWORDPATH}            $12345877
    Input Text                                  ${NEWPASSWORDPATH}                1234@westwingbr
    Input Text                                  ${CONFIRMNEWPASSWORDPATH}         1234@westwingbr
    Click Element                               ${BUTTONCONFIRMPASSWORDCHANGE}
    Wait Until Element Is Visible               ${WRONGPASSWORDMSG}

Então digito senhas diferentes
    Wait Until Element Is Visible               ${BUTTONPASSWORD}
    Click Element                               ${BUTTONPASSWORD}
    Sleep                                       2
    Input Text                                  ${CONFIRMPASSWORDPATH}            1234@westwingbr
    Input Text                                  ${NEWPASSWORDPATH}                1234@westwingbr
    Input Text                                  ${CONFIRMNEWPASSWORDPATH}         $12345877
    Click Element                               ${BUTTONCONFIRMPASSWORDCHANGE}
    Wait Until Element Is Visible               ${MSGSENHASNAOIGUAIS}

Então digito mais de 50 caracteres
    Wait Until Element Is Visible               ${BUTTONPASSWORD}                 15
    Click Element                               ${BUTTONPASSWORD}
    Sleep                                       2
    Input Text                                  ${CONFIRMPASSWORDPATH}            1234@westwingbr
    ${bigPassword}    FakerLibrary.Random Number     digits=55
    Input Text                                  ${NEWPASSWORDPATH}                ${bigPassword}
    Input Text                                  ${CONFIRMNEWPASSWORDPATH}         ${bigPassword}
    Click Element                               ${BUTTONCONFIRMPASSWORDCHANGE}
    Wait Until Element Is Visible               ${MORETHAN50CARACTERESMSG}
    
Então digito menos de 06 caracteres
    Wait Until Element Is Visible               ${BUTTONPASSWORD}                 15
    Click Element                               ${BUTTONPASSWORD}
    Sleep                                       2
    Input Text                                  ${CONFIRMPASSWORDPATH}            1234@westwingbr
    ${littlePassword}  FakerLibrary.Random Number     digits=3
    Input Text                                  ${NEWPASSWORDPATH}                ${littlePassword}
    Input Text                                  ${CONFIRMNEWPASSWORDPATH}         ${littlePassword}
    Click Element                               ${BUTTONCONFIRMPASSWORDCHANGE}
    Wait Until Element Is Visible               ${LESSTHAN06CARACTERESMSG}

Então altero nome com sucesso
    ${name}         FakerLibrary.Name
    Wait Until Element Is Visible               ${PATHNAME}                       15
    Input Text                                  ${PATHNAME}                       ${name}
    Clicar em salvar e validar que esta salvo

Então altero sobrenome com sucesso
    ${lastname}    FakerLibrary.Name
    Input Text                                  ${LASTNAMEPATH}                   ${lastName}
    Wait Until Element Is Visible               ${LASTNAMEPATH}                   15
    Clicar em salvar e validar que esta salvo

Então irei alterar a saudação como sr
    Wait Until Element Is Visible               ${SAUDACAOSR}                     15    
    Click Element                               ${SAUDACAOSR}
    Clicar em salvar e validar que esta salvo
   

Então irei alterar a saudação como sra
    Wait Until Element Is Visible               ${SAUDACAOSRA}                    15
    Click Element                               ${SAUDACAOSRA}
    Clicar em salvar e validar que esta salvo

Clicar em salvar e validar que esta salvo
    Click Element                               ${BUTTONSALVAR}
    Wait Until Element Is Visible               ${MSGSUCCESSPATH}

Então deixo o nome vazio
    Wait Until Element Is Visible               ${PATHNAME}                       15     
    Input Text                                  ${PATHNAME}                       ${EMPTY}
    Clicar em salvar e validar erro

Então deixo o sobrenome vazio
    Wait Until Element Is Visible               ${LASTNAMEPATH}                   15    
    Input Text                                  ${LASTNAMEPATH}                   ${EMPTY}
    Clicar em salvar e validar erro

Então deixo o nome com caracteres especiais
    Wait Until Element Is Visible               ${PATHNAME}                       15
    Input Text                                  ${PATHNAME}                       !@#$%#@1!
    Clicar em salvar e validar erro

Então deixo o sobrenome com caracteres especiais
    Wait Until Element Is Visible               ${LASTNAMEPATH}                   15 
    Input Text                                  ${LASTNAMEPATH}                   !@#$%#@1!     
    Clicar em salvar e validar erro

Então deixo o nome com numeros
    ${numbers}         FakerLibrary.Random Number
    Wait Until Element Is Visible               ${PATHNAME}                       15
    Input Text                                  ${PATHNAME}                       ${numbers}
    Clicar em salvar e validar erro

Então deixo o sobrenome com numeros
    ${numbers}         FakerLibrary.Random Number
    Wait Until Element Is Visible               ${LASTNAMEPATH}                   15
    Input Text                                  ${LASTNAMEPATH}                   ${numbers}
    Clicar em salvar e validar erro

Então deixo o nome com espaços
    Wait Until Element Is Visible               ${LASTNAMEPATH}                   15
    Input Text                                  ${LASTNAMEPATH}                   ${spaces}  
    Clicar em salvar e validar erro

Então deixo o sobrenome com espaços
    Wait Until Element Is Visible               ${PATHNAME}                       15
    Input Text                                  ${PATHNAME}                       ${spaces}  
    Clicar em salvar e validar erro

Clicar em salvar e validar erro
    Click Element                               ${BUTTONSALVAR}
    Wait Until Element Is Visible               ${MSGERROR_PATH}                  15