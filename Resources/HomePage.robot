*** Settings ***
Documentation    All the keywords for flightBooking Home Page
Library    SeleniumLibrary
Library    ../CustomLibrary/CustomLibrary.py



*** Variables ***
${Browser}             Chrome
${Url}                 https://www.makemytrip.com/flights/
${logo}                xpath://a[@class="mmtLogo makeFlex"]
${FromCity}            id:fromCity
${ToCity}              id:toCity
${FromCitySearch}      xpath://input[@placeholder='From']
${ToCitySearch}        xpath://input[@placeholder='To']
#${pageDownCity}    xpath://p[@class='font14 appendBottom5 blackText']

${pageDownCity}    xpath://li[@id='react-autowhatever-1-section-0-item-0']//div[@class='calc60']
${travellers}       xpath://span[@class='lbl_input latoBold appendBottom5']
${TravellerNo}      2
${ApplyButton}     xpath://button[normalize-space()='APPLY']
${SearchButton}    xpath://p[@data-cy='submit']/a
${flightoption}    3


*** Keywords ***
open browser and maximize window
    open browser    ${Url}    ${Browser}
    maximize browser window
    wait until element is visible   ${logo}
    page_should_contain_element    ${logo}

Verify Field and Enter Value
    [Arguments]    ${locator}     ${Value}
    wait until element is visible    ${locator}
    input text    ${locator}     ${Value}
Verify Button and Click
    [Arguments]    ${locator}
    wait until element is visible    ${locator}
    click button    ${locator}

Enter Value in from Field
    wait until element is visible     ${FromCity}
    click element    ${FromCity}
    Verify Field and Enter Value      ${FromCitySearch}   Kolkata
    wait until element is visible    ${pageDownCity}
    mouse down    ${pageDownCity}
    send enter Keys    ${pageDownCity}


Enter Value in To Filed
    wait until element is visible     ${ToCity}
    click element    ${ToCity}

    click element    ${ToCity}
    Verify Field and Enter Value      ${ToCitySearch}    Pune
    wait until element is visible    ${pageDownCity}
    mouse over    ${pageDownCity}


Choose on Travellers
    wait until element is visible    ${travellers}
    click element     ${travellers}
    click element    //div[@class='travellers gbTravellers']/div[@class='appendBottom20']/ul[@class='guestCounter font12 darkText gbCounter']/li[${TravellerNo}]
    click button    ${ApplyButton}
Click on Search button
    wait until element is visible     ${SearchButton}
    double click element       ${SearchButton}

Choose Third options from below flights
    wait until element is visible    (//span[@class='appendRight8'][normalize-space()='View Prices'])[${flightoption}]
    click element    (//span[@class='appendRight8'][normalize-space()='View Prices'])[${flightoption}]
    wait until element is visible    (//div[@class='viewFareBtnCol '])[1]
    click element    (//div[@class='viewFareBtnCol '])[1]

verify completion status
    switch window    NEW
    element text should be    xpath://h2[@class='fontSize20 blackFont whiteText headerTitle']     Complete your booking


close all browsers
    close browser



















