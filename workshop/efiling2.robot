*** Settings ***
Library           SeleniumLibrary
Resource          ./pages/MainPage.resource
Resource          ./pages/AnnouncementPage.resource

*** Test Cases ***
Failure case :: ผู้ใช้งานทำการเข้าใช้งานระบบ efiling
    เข้ามายังระบบ efiling
    อ่านรายละเอียดการประกาศเกี่ยวกับเวลาเปิดปิดการให้บริการ ATM on Internet
    ทำการลงชื่อเข้าใช้งาน เพื่อยืนแบบ online ด้วย RD ID
    ผู้ใช้งานเจอ error message ชื่อผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง

*** Keywords ***
เข้ามายังระบบ efiling
    MainPage.Open Main Page

ทำการลงชื่อเข้าใช้งาน เพื่อยืนแบบ online ด้วย RD ID
    Click Element  xpath://*[@id="top"]/div/div[2]/button[1]

อ่านรายละเอียดการประกาศเกี่ยวกับเวลาเปิดปิดการให้บริการ ATM on Internet
    AnnouncementPage.Check opened page correctly
    AnnouncementPage.ดูรายละเอียดของช่วงเวลาทำการให้บริการ

    Switch to detail page
    Close the detail page and back to main page

Switch to detail page
    Wait Until Element Contains    xpath://div[6]/div[3]/div/h5    ATM on Internet

Close the detail page and back to main page
    Switch Window   MAIN
    Click Element   xpath://*[@id="announceModal"]/div/div/div[1]/button

