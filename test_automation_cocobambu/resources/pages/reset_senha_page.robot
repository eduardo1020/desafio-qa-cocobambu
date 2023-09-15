*** Settings ***
Resource    ../main.robot

*** Variables ***
&{reset_senha}
...    Button_Resetar_Senha=//span[contains(text(), 'Resetar senha')]
...    Input_Email_Para_Recuperar_Senha=//div[@class="alert-wrapper ion-overlay-wrapper sc-ion-alert-md"]//input
...    Button_Recuperar=//span[contains(text(), "Recuperar")]
...    Input_Login_Outlook=//*[@id="i0116"]
...    Button_Proximo=//*[@id="idSIButton9"]
...    Input_Senha_Outlook=//*[@id="i0118"]
...    Button_Entrar_Outlook=//*[@id="idSIButton9"]
...    Email_Continuar_Conectado=//div[@id="displayName"]
...    Button_Continuar_Conectado=//*[@id="idBtn_Back"]
...    Elemento_Caixa_de_Entrada=//span[contains(text(), "Caixa de Entrada")]
...    Email_Redefinição_Senha=//span[contains(text(), "noreply@cocobambu.com")]
...    Elemento_Email_Redefinir_Senha=//*[@id="UniqueMessageBody"]/div/div/div/div/div/div/div[1]/p[2]
...    Button_Redefinir_Senha_Email=//*[@id="UniqueMessageBody"]/div/div/div/div/div/div/a
...    Elemento_Pagina_Redefinição_Senha=//div[@class="container"]//img[@class="logo"]
...    Input_Nova_Senha=//div[@class="input-div"]//input[@name="new_password1"]
...    Input_Confirmar_Nova_Senha=//div[@class="input-div"]//input[@name="new_password2"]
...    Button_Alterar_Minha_Senha=//button[contains(text(), "ALTERAR MINHA SENHA")]
...    Input_Email=//input[@placeholder="E-mail"]
...    Input_Senha=//input[@placeholder="Senha"]

*** Keywords ***
Quando eu clicar na opção Reset de senha
    Click Element    ${reset_senha.Button_Resetar_Senha}
E Inserir um email válido e cadastrado
    Wait Until Element Is Visible    ${reset_senha.Input_Email_Para_Recuperar_Senha}
    Input Text    ${reset_senha.Input_Email_Para_Recuperar_Senha}    ${dados_validos_login.Email}
    Sleep    3
    Click Element    ${reset_senha.Button_Recuperar}
    Sleep    3

E ir até o email cadastrado e redefinir a senha
    Open Browser        ${general.URL_INBOX}    ${general.Browser}    alias=second    
    Switch Browser    second
    Maximize Browser Window
    Input Text    ${login.Input_Login_Outlook}    ${dados_validos_login.Email}
    Wait Until Element Is Visible    ${reset_senha.Button_Proximo}
    Click Element    ${login.Button_Proximo}
    Wait Until Element Is Visible    ${reset_senha.Input_Senha_Outlook}
    Input Text    ${login.Input_Senha_Outlook}    ${dados_validos_login.Senha}
    Wait Until Element Is Visible    ${reset_senha.Button_Entrar_Outlook}    10
    Click Element    ${login.Button_Entrar_Outlook}
    Wait Until Element Is Visible    ${reset_senha.Button_Continuar_Conectado}
    Click Element    ${login.Button_Continuar_Conectado}
    Wait Until Element Is Visible    ${reset_senha.Elemento_Caixa_de_Entrada}    10
    Click Element    ${reset_senha.Email_Redefinição_Senha}
    Wait Until Element Is Visible    ${reset_senha.Elemento_Email_Redefinir_Senha}    10
    Click Element    ${reset_senha.Button_Redefinir_Senha_Email}
    Wait Until Element Is Visible    ${reset_senha.Input_Nova_Senha}    10
    Input Text    ${reset_senha.Input_Nova_Senha}    ${Redefinição_Senha.nova_senha}
    Input Text    ${reset_senha.Input_Confirmar_Nova_Senha}    ${Redefinição_Senha.confirmar_nova_senha}
    Click Element    ${reset_senha.Button_Alterar_Minha_Senha}

Então faço login com a nova senha
    Open Browser        ${general.URL_COCOBAMBU}    ${general.Browser}    alias=third    
    Switch Browser    third
    Maximize Browser Window
    Input Text    ${login.Input_Email}    ${Redefinição_Senha.Email}
    Input Password    ${login.Input_Senha}    ${Redefinição_Senha.nova_senha}
    
