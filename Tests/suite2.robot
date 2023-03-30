*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/HomePage.robot
Test Setup    open browser and maximize window
Test Teardown    close all browsers



*** Test Cases ***
TC_001 Book flight tickets on Makemytrip Application
    Enter Value in from Field
    Enter Value in To Filed
    Choose on Travellers
    Click on Search button
    handle alert    ACCEPT
    Choose Third options from below flights
    verify completion status

TC_002 Book flight tickets on Makemytrip Application
    Enter Value in from Field
    Enter Value in To Filed
    Choose on Travellers
    Click on Search button
    handle alert    ACCEPT
    Choose Third options from below flights
    verify completion status



