from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.keys import Keys
import pandas as pd
import openpyxl


@library
class CustomLibrary:
    def __int__(self):
        self.sellib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def send_enter_Keys(self,locator):
        body=self.sellib.get_webelement(locator)
        body.send_keys(Keys.ENTER)

    @keyword
    def fetch_value_from_inputSheet(self):
        FromCity=""
        ToCity=""
        Travellers=""
        path=r"C:\Users\HP\PycharmProjects\PwcProject\InputData\InputSheet.xlsx"
        dflist=pd.read_excel(path, engine=openpyxl, dtype=object)
        out_frame=pd.DataFrame(dflist)

        return FromCity,ToCity, Travellers


