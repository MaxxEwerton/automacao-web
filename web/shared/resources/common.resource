***Settings***
Library    SeleniumLibrary


***Keywords***
Click and Scroll Item
    [Arguments]                      ${identifier}
    Wait Until Element Is Visible    ${identifier}                                  30
    ${position}                      Get Vertical Position                          ${identifier}
    Execute Javascript               window.scrollTo(0, window.scrollY + ${position})
    Click Element                    ${identifier}                                  

Scroll Item
    [Arguments]                      ${identifier}
    Wait Until Element Is Visible    ${identifier}                     30
    ${position}                      Get Vertical Position             ${identifier}
    Execute Javascript               window.scrollTo(${position},0)    


Close Modal Braze
    ${modalIsOpen}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//button[@class='ab-close-button']    30
    IF    ${modalIsOpen}
        Click Element    //button[@class='ab-close-button']
        Wait Until Element Is Not Visible    xpath=//*[@class='ab-page-blocker']    20
    END
