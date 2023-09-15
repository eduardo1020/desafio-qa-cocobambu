*** Settings ***
Resource    ../../resources/main.robot
Test Setup  Acessar o site

*** Test Cases ***
CT 0001 – Solicitação de Redefinição de Senha Bem-Sucedida
    Quando eu clicar na opção Reset de senha
    E Inserir um email válido e cadastrado
    E ir até o email cadastrado e redefinir a senha
    Então faço login com a nova senha
