*** Settings ***
Resource    ../../resources/main.robot
Test Setup  Acessar o site
*** Test Cases ***
CT 0001 – Login com credenciais válidas
    Quando inserir o email e a Senha válidos
    Então deve ser feito o login com sucesso

CT 0002 – Login com email inválido e senha válida
    Quando inserir um email inválido e uma senha válida
    Então deve exibir a mensagem "usuario ou senha inválido"

CT 0003 – Login com email válido e senha inválida
    Quando inserir um email válido e uma senha inválida
    Então deve exibir a mensagem "usuario ou senha inválido"

CT 0004 – Inserir código de verificação válido para Login
    Quando inserir o email e a Senha válidos
    Então deve ser feito o login com sucesso
    E ser redirecionado para a página de verificação
    E deve verificar código de verificação enviado para o email cadastrado
    # E deve voltar para a página de verificação e inserir o código


