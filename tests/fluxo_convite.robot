*** Settings ***
Resource    ../resources/keywords.robot
Test Teardown    Close Browser

*** Test Cases ***
Cenario: Criar convite completo com Login e Upload
    [Setup]    Abrir o site da FestaLab
    
    # Etapas de Criação
    Clicar e Aguardar    ${BTN_CRIAR}
    Clicar e Aguardar    ${BTN_USE_ARTE}
    Clicar e Aguardar    ${BTN_PERSONALIZAR}
    Clicar e Aguardar    ${OPT_OCASIOES}
    
    # Dados do Evento
    Preencher e Confirmar    ${INPUT_NOME}    Churras da Fefe
    
    # Agendamento
    Clicar e Aguardar    ${CAMPO_DATA}
    Clicar e Aguardar    ${DIA_10}
    Click Element        ${BTN_OK_VISIVEL}
    Clicar e Aguardar    ${BTN_OK_VISIVEL}
    
    # Localização
    Clicar e Aguardar    ${BTN_SIM}
    Preencher e Confirmar    ${INPUT_CEP}    09030-550
    Wait Until Element Is Visible    ${BTN_OK_VISIVEL}
    Click Element                    ${BTN_OK_VISIVEL}
    
    # Descrição do Local
    Clicar e Aguardar    ${BTN_OUTRO}
    Preencher e Confirmar    ${INPUT_OUTRO_LOCAL}    casa da sogra
    
    # Autenticação e Arte
    Realizar Login       hidir20311@keecs.com    teste@123
    Realizar Upload da Foto    imagem_testeJPEG.jpeg
    
    # Validação Final (Sem Sleep, aguardando o carregamento real)
    Aguardar e Validar Convite Pronto