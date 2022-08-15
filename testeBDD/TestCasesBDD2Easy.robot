*** Settings ***
Resource         ../resources/ResourceBDD.robot
Resource         ../resources/BDDpt-br.robot
Suite Teardown   Fechar Navegador

*** Test Cases ***
#Cenário 01: Pesquisar postagem Season Premiere
#    Dado que esteja na tela HOME do blog robotizando testeBDD
#    Quando pesquisar pela palavra "introdução ao robot framework"
#    Então a postagem "Season Premiere: Introdução ao Robot Framework" deve ser listada no resultado da pesquisa

Cenário 01: Mandar um formulario no Site 2EasyEvents
    Dado que esteja na tela Home site 2EasyEvents
    Quando clico no menu contato para enviar uma mensagem
    Então eu digito um nome "Fabricio Oliveira" valido
    E digito um email "fabricioaaugusto@gmail.com" valido
    E digito um assunto "Teste" valido
    E digito uma mensagem "Testando o assunto do formulario" valido


#Cenário 02: Ler postagem Season Premiere
#    Dado que esteja na tela de resultado da pesquisa pela postagem "Season Premiere: Introdução ao Robot Framework"
#    Quando clicar no link da postagem
#    Então a tela da postagem "Season Premiere: Introdução ao Robot Framework" deve ser mostrada
