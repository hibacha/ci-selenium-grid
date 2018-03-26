*** Settings ***
Library            OperatingSystem
Library     Selenium2Library
*** Test Cases ***
Test 1
    Start Google Chrome Remote




*** Keywords ***
Start Google Chrome Remote
    [Documentation]   Starts Google Chrome browser on Selenium Server Standalone.
    ${options}=   Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()  sys
    Call Method   ${options}  add_argument  --user-agent\=de     # NOTE: important to escape equal sign '\='
    ${options}=   Call Method   ${options}  to_capabilities
    Log  ${options}
    Create WebDriver  Remote  command_executor=http://127.0.0.1:4444/wd/hub  desired_capabilities=${options}
    # NOTE: replace 'hostname' with hastname or IP of your remote machine running the Selenium Server
    Go To                        https://browscap.org/ua-lookup
    Sleep  10s
    Close All Browsers
