***Settings***
Library    SeleniumLibrary
Library    ../libs/UtilsLib.py
#Variables    ../../config.py

Resource  common.resource

***Keywords***
Access website
    # ${chrome_options}=    Evaluate             sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # Call Method           ${chrome_options}    add_argument                                         --disable-extensions
    # Call Method           ${chrome_options}    add_argument                                         --disable-gpu
    # Call Method           ${chrome_options}    add_argument                                         --no-sandbox
    # Call Method           ${chrome_options}    add_argument                                         ${HEADLESS}
    # Call Method           ${chrome_options}    add_argument                                         --disable-dev-shm-usage
    # Call Method           ${chrome_options}    add_argument                                         --ignore-certificate-errors-spki-list
    # Call Method           ${chrome_options}    add_argument                                         --ignore-ssl-errors
    # Create Webdriver      Chrome               chrome_options=${chrome_options}
    # Go to                 ${BASE_URL}
    # Set Window Size       1920                 1080
    Open Browser      https://now.westwing.com.br/  Google Chrome
    Maximize Browser Window
    Close Modal Braze