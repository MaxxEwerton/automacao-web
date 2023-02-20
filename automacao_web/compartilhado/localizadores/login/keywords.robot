Documentation
... Suíte com palavras chave de login do sistema

*** Settings ***
Library    SeleniumLibrary
Library    String
Library    FakerLibrary       locale=en_US

*** Keywords ***
# Algumas keywords ja prontas basta preencher as variaveis e executar os casos de teste
Dado que esteja na tela de cadastro
    Go To    ${home_inicio}

Quando inserir dados validos
    ${numbers}                       FakerLibrary.Random Number
    ${name}                          FakerLibrary.Name
    ${phone}                         FakerLibrary.Phone Number
    ${email}                         FakerLibrary.Email
    ${address}                       FakerLibrary.Address
    Input Text                       ${firstName}                  ${name}
    Input Text                       ${lastName}                   ${name}
    Input Text                       ${addressTextfield}           ${address}
    Input Text                       ${emailTextfield}             ${email}
    Input Text                       ${phoneTextfield}             ${phone}
    Click Element                    ${sexoMasculino}
    Click Element                    ${movies}
    Click Element                    ${modalLinguagens}
    Wait Until Element Is Visible    ${portugues}                  
    Click Element                    ${portugues}
    Click Element                    ${phoneTextfield}
    Click Element                    ${skills}
    Click Element                    ${android}
    Click Element                    ${country}
    Click Element                    ${australia}
    Click Element                    ${year}
    Click Element                    ${birthYear}
    Click Element                    ${month}
    Click Element                    ${yearMonth}

Então o usúario será cadastrado com sucesso
    ${password}      FakerLibrary.Random Number
    Click Element    ${day}
    Click Element    ${monthDay}
    Input Text       ${passwordTextfield}          ${password}
    Input Text       ${confirmPassword}            ${password}

Quando inserir dados validos e desistir do cadastro
    ${password}                      FakerLibrary.Random Number
    ${numbers}                       FakerLibrary.Random Number
    ${name}                          FakerLibrary.Name
    ${phone}                         FakerLibrary.Phone Number
    ${email}                         FakerLibrary.Email
    ${address}                       FakerLibrary.Address
    Input Text                       ${firstName}                  ${name}
    Input Text                       ${lastName}                   ${name}
    Input Text                       ${addressTextfield}           ${address}
    Input Text                       ${emailTextfield}             ${email}
    Input Text                       ${phoneTextfield}             ${phone}
    Click Element                    ${sexoMasculino}
    Click Element                    ${movies}
    Click Element                    ${modalLinguagens}
    Wait Until Element Is Visible    ${portugues}                  
    Click Element                    ${portugues}
    Click Element                    ${phoneTextfield}
    Click Element                    ${skills}
    Click Element                    ${android}
    Click Element                    ${country}
    Click Element                    ${australia}
    Click Element                    ${year}
    Click Element                    ${birthYear}
    Click Element                    ${month}
    Click Element                    ${yearMonth}
    Click Element                    ${day}
    Click Element                    ${monthDay}
    Input Text                       ${passwordTextfield}          ${password}
    Input Text                       ${confirmPassword}            ${password}

Então Clico em refresh
    Click Element    ${refresh}

Quando inserir dados invalidos
    ${numbers}       FakerLibrary.Random Number
    ${name}          FakerLibrary.Name
    ${phone}         FakerLibrary.Phone Number
    ${email}         FakerLibrary.Email
    ${password}      FakerLibrary.Random Number
    ${address}       FakerLibrary.Address
    Input Text       ${lastName}                   ${name}
    Input Text       ${addressTextfield}           ${address}
    Input Text       ${emailTextfield}             ${email}
    Input Text       ${phoneTextfield}             ${phone}
    Click Element    ${sexoMasculino}
    Click Element    ${movies}
    Click Element    ${modalLinguagens}
    Click Element    ${portugues}
    Click Element    ${phoneTextfield}
    Click Element    ${skills}
    Click Element    ${android}
    Click Element    ${country}
    Click Element    ${australia}
    Click Element    ${year}
    Click Element    ${birthYear}
    Click Element    ${month}
    Click Element    ${yearMonth}
    Click Element    ${day}
    Click Element    ${monthDay}
    Input Text       ${passwordTextfield}          ${password}
    Input Text       ${confirmPassword}            ${password}
    Click Element    ${submit}

Então recebo a mensagem de dado invalido
    Sleep    1
    # Wait Until Page Contains            Preencha este campo.
