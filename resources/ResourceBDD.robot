*** Settings ***
Library     SeleniumLibrary

*** Variable ***
${BROWSER}              chrome
${URL}                  https://robotizandotestes.blogspot.com.br/
${URL1}                 https://easyevents-v2.herokuapp.com/
${CABEÇALHO}            id=Header1
${CABEÇALHO1}           xpath=.//*[@id="mainNav"]/div/a
${CAMPO_MENU}           id=navbar-toggler
${CAMPO_CONTATO}        xpath=.//*[@id="navbarResponsive"]/ul[1]/li[3]/a
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

#### QUANDO
Pesquisar pela palavra "${BUSCA}"
    Click Element   ${BOTAO_LUPA}
    Input Text      ${CAMPO_PESQUISAR}    ${BUSCA}
    Sleep  2s
    Click Element   ${BOTAO_PESQUISAR}
    Wait Until Element Is Visible   ${LINK_POST}

Clico no menu Contato para enviar uma mensagem
    Wait Until Element Is Visible   ${CAMPO_CONTATO}
    Click Element   ${CAMPO_CONTATO}
    #Sleep  1s
    #Click Element   ${CAMPO_MENU}

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

#### E

#### TEARDOWN
#Fechar Navegador
#    Close Browser
