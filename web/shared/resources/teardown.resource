***Settings***
Library    SeleniumLibrary
Library    ../libs/UtilsLib.py
Library    DebugLibrary

Variables    ../locators/cart_locators.py

Resource    ../../tests/Wishlist/resources/wishlist.resource

#Variables    ../../config.py

***Keywords***
Close website
    ${datacurrent}             Get Current Date
    Capture Page Screenshot    ${datacurrent}-test-evidence-.png
    Delete All Cookies
    Close window

Close website and clear cart
    Click Element                        ${home_button_cart}
    Wait Until Element IS Visible        ${validate_cart}
    ${check_element}=  Run Keyword and Return Status   Wait Until Page Contains Element    ${clear_cart}
    ${itenscart}    Get Element Count    ${clear_cart}
    ${itenscart}    Convert To Integer   ${itenscart}    
    FOR    ${index}    IN RANGE          ${itenscart}    
        IF      ${itenscart} != 0
        Click Element                    ${clear_cart}
        Wait Until Element Is Visible    ${pop_up_clear_cart}
        Click Element                    ${button_confirm_remove_from_cart}
        Wait Until Element Is Visible    ${remove_from_cart_msg}
        Wait Until Element Is Visible    ${validate_cart}
        END
    END
    Wait Until Element Is Visible        ${validate_cart_empty}    10
    ${datacurrent}             Get Current Date
    Capture Page Screenshot              ${datacurrent}-test-evidence-.png
    Delete All Cookies
    Close window

Close and Clear Wishlist
    Scroll Element Into View         ${WISHLISTBUTTON}
    Sleep    5
    Click Element                    ${WISHLISTBUTTON}   
    Sleep    5
    Remove All Wishlist Items
    Remove All Custom Wishlist
    Delete All Cookies
    Close window