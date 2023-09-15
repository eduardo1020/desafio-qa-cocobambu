*** Settings ***
Resource    ../../resources/main.robot
Test Setup  Acessar o site e cadastrar
*** Test Cases ***
CT 0001 - Cadastro válido
    Quando Preencher todos os campos do formulario de Cadastro com dados válidos
    Então eu clico no botão cadastrar