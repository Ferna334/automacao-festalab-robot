*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}                  https://festalab.com.br/
${BROWSER}              chrome

# Seletores de Fluxo
${BTN_CRIAR}            id=create-invitation-cta
${BTN_USE_ARTE}         id=featured_use_your_art
${BTN_PERSONALIZAR}     id=customize-button
${OPT_OCASIOES}         xpath=//label[contains(., "Ocasiões especiais")]
${INPUT_NOME}           css:input[type="text"]
${CAMPO_DATA}           css:.calendar-input
${DIA_10}               xpath=//div[contains(@class, "calendar-body__day") and text()="10"]
${BTN_OK_VISIVEL}       xpath=(//button[contains(., "OK")])[last()]
${BTN_SIM}              xpath=//button[contains(., "Sim")]
${INPUT_CEP}            xpath=//input[@name="event[zipcode]"]
${BTN_OUTRO}            xpath=//button[contains(., "Outro")]
${INPUT_OUTRO_LOCAL}    xpath=//div[contains(@class, "active")]//input[@data-form-target="input"]

# Seletores de Login e Upload
${BTN_JA_TENHO_CONTA}   xpath=//a[contains(., "Já tenho conta")]
${INPUT_EMAIL}          id=session_email
${INPUT_SENHA}          id=session_password
${BTN_ENTRAR_MODAL}     id=session_form_submit
${INPUT_FILE}           xpath=//input[@type="file"]
${BTN_SALVAR_FOTO}      id=new_photo_form_submit

*** Keywords ***
Abrir o site da FestaLab
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    30 seconds
    # Define uma cadência visual para o robô não ser instantâneo
    Set Selenium Speed      0.6 seconds

Clicar e Aguardar
    [Arguments]    ${seletor}
    Wait Until Element Is Visible    ${seletor}
    Wait Until Element Is Enabled    ${seletor}
    Click Element                    ${seletor}

Preencher e Confirmar
    [Arguments]    ${seletor}    ${texto}
    Wait Until Element Is Visible    ${seletor}
    Input Text                       ${seletor}    ${texto}
    Click Element                    ${BTN_OK_VISIVEL}

Realizar Login
    [Arguments]    ${email}    ${senha}
    Clicar e Aguardar    ${BTN_JA_TENHO_CONTA}
    Wait Until Element Is Visible    ${INPUT_EMAIL}
    Input Text           ${INPUT_EMAIL}    ${email}
    Input Password       ${INPUT_SENHA}    ${senha}
    Click Button         ${BTN_ENTRAR_MODAL}

Realizar Upload da Foto
    [Arguments]    ${nome_imagem}
    ${IMAGEM_PATH}    Normalize Path    ${CURDIR}/../tests/images/${nome_imagem}
    File Should Exist    ${IMAGEM_PATH}
    Wait Until Page Contains Element    ${INPUT_FILE}
    Choose File                         ${INPUT_FILE}    ${IMAGEM_PATH}
    Clicar e Aguardar                   ${BTN_SALVAR_FOTO}

Aguardar e Validar Convite Pronto
    # Espera dinâmica: o robô segura a finalização até o texto aparecer
    Wait Until Page Contains            Churras da Fefe   60s
    Capture Page Screenshot             convite_finalizado.png
    Page Should Contain                 Churras da Fefe