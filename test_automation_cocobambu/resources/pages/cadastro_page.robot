*** Settings ***
Resource    ../main.robot

*** Variables ***
&{cadastro}
...    Button_FazerCadastro=//span[contains(string(), "Cadastre-se")]
...    Input_NomeCompleto=//input[@placeholder="Nome completo"]
...    Input_Email=//div[@class="content-container"]//input[@placeholder="E-mail"]
...    Input_Senha=//div[@class="content-container"]//input[@placeholder="Senha"]
...    Input_ConfirmarSenha=//div[@class="content-container"]//input[@placeholder="Confirmar senha"]
...    Select_Estado=//ion-select[@placeholder="Selecione seu Estado"]
...    Select_Estado_DF=//div[@class="action-sheet-group sc-ion-action-sheet-ios"]//button[1]
...    Select_AceitarTermosDeUso=//ion-checkbox[@class="ng-untouched ng-pristine ng-invalid ion-untouched ion-pristine ion-invalid md in-item interactive hydrated"]
...    Button_Cadastrar=//div[@class="content-container"]//button
...    Titulo_Politica_De_Privacidade=//b[contains(text(), "POLÍTICA DE PRIVACIDADE")]
...    Button_Aceitar_Politica_De_Privacidade=//button[contains(text(), "ACEITAR")]

*** Keywords ***
Dado que eu acesse a página de login do coco bambu app
    Open Browser    ${general.URL_COCOBAMBU}    ${general.Browser}    alias=first
    Maximize Browser Window

E Clique no botão cadastrar
    Click Element    ${cadastro.Button_FazerCadastro}

Quando Preencher todos os campos do formulario de Cadastro com dados válidos
    Wait Until Element Is Visible    ${cadastro.Input_Email}    
    Input Text    ${cadastro.Input_Email}    ${dados_validos.Email}
    Sleep    3
    Wait Until Element Is Visible    ${cadastro.Input_NomeCompleto}    10
    Input Text    ${cadastro.Input_NomeCompleto}    ${dados_validos.NomeCompleto}
    Sleep    3
    Wait Until Element Is Visible    ${cadastro.Input_Senha}    
    Input Text    ${cadastro.Input_Senha}    ${dados_validos.Senha}
    Sleep    3
    Wait Until Element Is Visible    ${cadastro.Input_ConfirmarSenha}   
    Input Text    ${cadastro.Input_ConfirmarSenha}   ${dados_validos.ConfirmarSenha}
    Sleep    3
    Wait Until Element Is Visible    ${cadastro.Select_Estado}
    Click Element    ${cadastro.Select_Estado}
    Sleep    3
    Wait Until Element Is Visible    ${cadastro.Select_Estado_DF}
    Click Element    ${cadastro.Select_Estado_DF}
    Sleep    3
    Wait Until Element Is Visible    ${cadastro.Select_AceitarTermosDeUso}
    Click Element    ${cadastro.Select_AceitarTermosDeUso}
    Sleep    3
    # Wait Until Element Is Visible    ${cadastro.Titulo_Politica_De_Privacidade}
    Click Element    ${cadastro.Button_Aceitar_Politica_De_Privacidade}
Então eu clico no botão cadastrar
    Click Element    ${cadastro.Button_Cadastrar}