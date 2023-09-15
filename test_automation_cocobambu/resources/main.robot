*** Settings ***
Library    SeleniumLibrary


### data ###
Resource    data/general.robot
Resource    data/cadastro.robot
Resource    data/login.robot
Resource    data/reset_senha.robot

### shared ###
Resource    ./shared/setup_teardown.robot

### pages ###
Resource    pages/cadastro_page.robot
Resource    pages/login_page.robot
Resource    pages/reset_senha_page.robot