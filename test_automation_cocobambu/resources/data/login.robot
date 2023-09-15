*** Settings ***
Resource    ../main.robot

*** Variables ***
&{dados_validos_login}
...    Email=eduardotestecocobambu@outlook.com
...    Senha=Teste1!@#

&{dados_invalidos_login}
...    Email_Invalido=eduardotestes@gmail
...    Senha_Invalida=Teste1!@