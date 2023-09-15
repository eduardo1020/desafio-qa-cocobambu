*** Settings ***
Resource    ../main.robot

*** Keywords ***
#Setup cadastro
Acessar o site e cadastrar
    Dado que eu acesse a página de login do coco bambu app
    E Clique no botão cadastrar

#Setup Login
Acessar o site
    Dado que eu acesse a página de login do coco bambu app