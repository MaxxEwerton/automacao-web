***Settings***
Resource    ../resources/product_calc_cep.resource
Resource    ../../../../shared/resources/setup.resource
Resource    ../../../../shared/resources/teardown.resource
Resource    ../../../Register/resources/register.resource
Variables    ../../../../shared/locators/product_calc_cep.py
Library    SeleniumLibrary

***Keywords***

DADO que eu esteja na pagina de produto
    Wait Until Element Is Visible        ${FIRTS_CATEGORIE_PRODUCT}
    Click Element                        ${FIRTS_CATEGORIE_PRODUCT}
    Wait Until Element Is Visible        ${TITLE_CAMPAING_PAGE}
    Scroll Element Into View             ${FIRST_PRODUCT_NAME}
    Click Element                        ${FIRST_PRODUCT_VALUE}
    Wait Until Element Is Visible        ${INSIDE_NAME_PRODUCT}

QUANDO calcular um CEP invalido
    Wait Until Element Is Visible        ${LINK_CALC_SHIPPING} 
    Click Element                        ${LINK_CALC_SHIPPING} 
    Wait Until Element Is Visible        ${TITLE_MODAL_CALC_CEP}
    Input Text                           ${INPUT_CALC_CEP}                    87128371
    Click Element                        ${BUTTON_CALC_CEP}    

ENTÃO o sistema deve exibir mensagem de erro
    Wait Until Page Contains             CEP inválido.

QUANDO calcular um CEP que preencha a rua do endereço 
    Wait Until Element Is Visible        ${LINK_CALC_SHIPPING} 
    Click Element                        ${LINK_CALC_SHIPPING} 
    Wait Until Element Is Visible        ${TITLE_MODAL_CALC_CEP}
    Input Text                           ${INPUT_CALC_CEP}                    13212000
    Click Element                        ${BUTTON_CALC_CEP}    

ENTÃO o sistema deve aplicar o CEP e apresentar a estimativa
    Wait Until Element Is Visible        ${MENSAGE_CEP_CONSULT}
    Element Should Contain               ${MENSAGE_CEP_CONSULT}               -  será entregue no dia 

QUANDO calcular um CEP sem rua
    Wait Until Element Is Visible        ${LINK_CALC_SHIPPING} 
    Click Element                        ${LINK_CALC_SHIPPING} 
    Wait Until Element Is Visible        ${TITLE_MODAL_CALC_CEP}
    Input Text                           ${INPUT_CALC_CEP}                    97800000
    Click Element                        ${BUTTON_CALC_CEP}    

ENTÃO o sistema deve aplicar o CEP e apresentar a estimativa sem rua
    Wait Until Element Is Visible        ${MENSAGE_CEP_CONSULT}
    Element Should Contain               ${MENSAGE_CEP_CONSULT}               -  será entregue no dia

QUANDO calcular um o CEP sem preencher o CEP
    Wait Until Element Is Visible        ${LINK_CALC_SHIPPING} 
    Click Element                        ${LINK_CALC_SHIPPING} 
    Wait Until Element Is Visible        ${TITLE_MODAL_CALC_CEP}
    Click Element                        ${BUTTON_CALC_CEP} 

ENTÃO o sistema deve exibir mensagem de erro solicitando o CEP
    Wait Until Page Contains             CEP é um campo obrigatório.

DADO que eu esteja na pagina de produto NDD
    DADO que eu esteja na pagina de produto 

QUANDO calcular um o CEP elegível a NDD
    Wait Until Element Is Visible        ${LINK_CALC_SHIPPING} 
    Click Element                        ${LINK_CALC_SHIPPING} 
    Wait Until Element Is Visible        ${TITLE_MODAL_CALC_CEP}
    Input Text                           ${INPUT_CALC_CEP}                    13212000
    Click Element                        ${BUTTON_CALC_CEP}

ENTÃO o sistema deve calcular o CEP e exibir o ícone do NDD
    Wait Until Element Is Visible        ${MENSAGE_CEP_CONSULT}
    Element Should Contain               ${MENSAGE_CEP_CONSULT}               -  será entregue no dia
    Click Element                        ${CLOSE_MODAL_BUTTON}
    Element Should Be Visible            ${NDD_ICON_CAR}

QUANDO calcular um o CEP não elegível a NDD
    Wait Until Element Is Visible        ${LINK_CALC_SHIPPING} 
    Click Element                        ${LINK_CALC_SHIPPING} 
    Wait Until Element Is Visible        ${TITLE_MODAL_CALC_CEP}
    Input Text                           ${INPUT_CALC_CEP}                    05791150
    Click Element                        ${BUTTON_CALC_CEP}
    
ENTÃO o sistema deve calcular o CEP e exibir o icone do NDD
    Wait Until Element Is Visible        ${MENSAGE_CEP_CONSULT}
    Element Should Contain               ${MENSAGE_CEP_CONSULT}               -  será entregue no dia
    Click Element                        ${CLOSE_MODAL_BUTTON}
    Element Should Not Be Visible        ${NDD_ICON_CAR}

DADO que eu esteja logado com um novo usuario
    Dado que estou acessando o site do NOW sem cadastro e clico em "Cadastre-se"
    Quando preencho todos os campos obrigatórios corretamente
    E clicar em Cadastre-se gratuitamente
    Então visualizarei meu nome na tela

QUANDO eu acessar a tela de um produto
    DADO que eu esteja na pagina de produto

E calcular um CEP valido
    QUANDO calcular um CEP que preencha a rua do endereço 
