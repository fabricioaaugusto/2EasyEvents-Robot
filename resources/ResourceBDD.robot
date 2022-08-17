*** Settings ***
Library     SeleniumLibrary

*** Variable ***
${BROWSER}              chrome
${URL}                  https://robotizandotestes.blogspot.com.br/
${URL1}                 https://easyevents-v2.herokuapp.com/
${URLGC}                https://gamersclub.com.br/
${CABEÇALHO}            id=Header1
${CABEÇALHO1}           xpath=./html/body/nav/div/button


${CAMPO_MENU}           xpath=./html/body/nav/div/button
${CAMPO_CONTATO}        xpath=./html/body/nav/div/div/ul[1]/li[3]/a
${CAMPO_NAME}           id=id_nome
${CAMPO_EMAIL}          id=id_email
${CAMPO_ASSUNTO}        id=id_assunto
${CAMPO_MENSAGEM}       id=id_mensagem
${ENVIAR_FORMULARIO}    xpath=./html/body/section[3]/div[2]/div/div/form/div/div/button


${BOTAO_LUPA}           css=.search-expand.touch-icon-button
${CAMPO_PESQUISAR}      css=.search-input>input
${BOTAO_PESQUISAR}      css=.search-action.flat-button
${LINK_POST}            xpath=.//*[@id='Blog1']/div[1]/article/div/div/h3/a
${TITULO}               xpath=.//*[@id='Blog1']/div/article/div[1]/div/h3

*** Keywords ***
#### DADO
Que esteja na tela HOME do blog robotizando testes
    Open Browser    ${URL}  ${BROWSER}
    Wait Until Element Is Visible   ${CABEÇALHO}
    Title Should Be     Robotizando Testes

Que esteja na tela de resultado da pesquisa pela postagem "${TITULO_POSTAGEM}"
    Page Should Contain     ${TITULO_POSTAGEM}

Que esteja na tela Home site 2EasyEvents
    Open Browser   ${URL1}  ${BROWSER}
    Wait Until Element Is Visible   ${CABEÇALHO1}

Que esteja na tela Home site GamersClub
    Open Browser   ${URLGC}  ${BROWSER}

#### QUANDO
Pesquisar pela palavra "${BUSCA}"
    Click Element   ${BOTAO_LUPA}
    Input Text      ${CAMPO_PESQUISAR}    ${BUSCA}
    Sleep  2s
    Click Element   ${BOTAO_PESQUISAR}
    Wait Until Element Is Visible   ${LINK_POST}

Clico no menu Contato para enviar uma mensagem
    Click Element   ${CAMPO_MENU}
    Click Element   ${CAMPO_CONTATO}

Clicar no link da postagem
    Click Element    ${LINK_POST}
    Sleep   2s

#### ENTÃO
A postagem "${TITULO_POSTAGEM}" deve ser listada no resultado da pesquisa
    Page Should Contain     ${TITULO_POSTAGEM}

A tela da postagem "${TITULO_POSTAGEM}" deve ser mostrada
    Wait Until Element Is Visible  ${TITULO}
    Title Should Be  ${TITULO_POSTAGEM}
    Sleep   2s

Eu digito um nome "${NOME_VALIDO}" valido
    Input Text    ${CAMPO_NAME}    ${NOME_VALIDO}
#### E
Digito um email "${EMAIL_VALIDO}" valido
    Input Text    ${CAMPO_EMAIL}    ${EMAIL_VALIDO}
    Sleep   1s
Digito um assunto "${ASSUNTO_VALIDO}" valido
    Input Text    ${CAMPO_ASSUNTO}  ${ASSUNTO_VALIDO}
    Sleep   1s
Digito uma mensagem "${MENSAGEM_VALIDO}" valido
    Input Text    ${CAMPO_MENSAGEM}  ${MENSAGEM_VALIDO}
    Sleep   2s
clico em enviar o formulario
    Click Element    ${ENVIAR_FORMULARIO}
#### TEARDOWN
Fechar Navegador
    Close Browser
