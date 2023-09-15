*** Settings ***
Resource    ../main.robot
Library    String

*** Variables ***
${codigo_de_verificação}
&{login}
...    Input_Email=//input[@placeholder="E-mail"]
...    Input_Senha=//input[@placeholder="Senha"]
...    Button_Entrar=//*[@id="content"]/app-login/div/div/div[2]/button
...    Mensagem_Codigo_enviado=//h1[contains(text(), "CÓDIGO ENVIADO")]
...    Mensagem_Erro_Login=//p[contains(text(), "E-mail ou senha inválidos.")]
...    Titulo_Codigo_Enviado=//h1[contains(text(), "CÓDIGO ENVIADO")]
...    Input_Login_Outlook=//*[@id="i0116"]
...    Button_Proximo=//*[@id="idSIButton9"]
...    Input_Senha_Outlook=//*[@id="i0118"]
...    Button_Entrar_Outlook=//*[@id="idSIButton9"]
...    Email_Continuar_Conectado=//div[@id="displayName"]
...    Button_Continuar_Conectado=//*[@id="idBtn_Back"]
...    Elemento_Caixa_de_Entrada=//span[contains(text(), "Caixa de Entrada")]
...    Email_Com_Codigo_de_Verificação=//span[contains(text(), "noreply@cocobambu.com")]
...    Codigo_de_Verificação=//*[@id="UniqueMessageBody"]/div/div/div/div/div/div[2]/div
...    Button_Fechar_Pagina_Verificação=//button[contains(text(), 'FECHAR')]
...    Button_Acessar_Pagina_Verificação=//*[@id="content"]/app-login/div/div/div[3]/button[1]
...    Elemento_Pagina_principal=//span[contains(text(), "Onde você quer receber seu pedido?")]

*** Keywords ***

Quando inserir o email e a Senha válidos
    Input Text    ${login.Input_Email}    ${dados_validos_login.Email}
    Input Password    ${login.Input_Senha}    ${dados_validos_login.Senha}

Então deve ser feito o login com sucesso
    Click Element    ${login.Button_Entrar}
    Wait Until Element Is Visible    ${login.Mensagem_Codigo_enviado}

Quando inserir um email válido e uma senha inválida
    Input Text    ${login.Input_Email}    ${dados_validos_login.Email}
    Input Password    ${login.Input_Senha}    ${dados_invalidos_login.Senha_Invalida}

Então deve exibir a mensagem "usuario ou senha inválido"
    Click Element    ${login.Button_Entrar}
    Wait Until Element Is Visible     ${login.Mensagem_Erro_Login}

Quando inserir um email inválido e uma senha válida
    Click Element    ${login.Input_Email}${dados_invalidos_login.Email_Invalido}

E ser redirecionado para a página de verificação
    Wait Until Element Is Visible    ${login.Mensagem_Codigo_enviado}

E deve verificar código de verificação enviado para o email cadastrado
    Open Browser        ${general.URL_INBOX}    ${general.Browser}    alias=second    
    Switch Browser    second
    Maximize Browser Window
    Input Text    ${login.Input_Login_Outlook}    ${dados_validos_login.Email}
    Wait Until Element Is Visible    ${login.Button_Proximo}
    Click Element    ${login.Button_Proximo}
    Wait Until Element Is Visible    ${login.Input_Senha_Outlook}
    Input Text    ${login.Input_Senha_Outlook}    ${dados_validos_login.Senha}
    Wait Until Element Is Visible    ${login.Button_Entrar_Outlook}
    Click Element    ${login.Button_Entrar_Outlook}
    Wait Until Element Is Visible    ${login.Button_Continuar_Conectado}
    Click Element    ${login.Button_Continuar_Conectado}
    Wait Until Element Is Visible    ${login.Elemento_Caixa_de_Entrada}
    Click Element    ${login.Email_Com_Codigo_de_Verificação}
    Wait Until Element Is Visible    ${login.Codigo_de_Verificação}    10
    ${codigo_de_verificação}    Get Text    ${login.Codigo_de_Verificação}
    Log    ${codigo_de_verificação}
    Split String    ${codigo_de_verificação}
    Log    ${codigo_de_verificação[0]}
    Switch Browser    first
    Click Element    ${login.Button_Fechar_Pagina_Verificação}
    Input Text    //input[@id="0"]    ${codigo_de_verificação[0]}
    Input Text    //input[@id="1"]    ${codigo_de_verificação[1]}
    Input Text    //input[@id="2"]    ${codigo_de_verificação[2]}
    Input Text    //input[@id="3"]    ${codigo_de_verificação[3]}
    Input Text    //input[@id="4"]    ${codigo_de_verificação[4]}
    # ${attribute_element}    Get Element Attribute    ${login.Button_Acessar_Pagina_Verificação}    class
    # Log    ${attribute_element}
    # Wait Until Element Is Visible     ${login.Button_Acessar_Pagina_Verificação}    10
    Click Element    ${login.Button_Acessar_Pagina_Verificação}
    # Wait Until Element Is Visible    ${login.Elemento_Pagina_principal}
    # Sleep    5
    

# E deve voltar para a página de verificação e inserir o código
#     # Set Test Variable    ${array_codigo_verificação}
#     # Switch Browser    first
#     # Click Element    ${login.Button_Fechar_Pagina_Verificação}
#     Log    ${codigo_de_verificação[0]}

