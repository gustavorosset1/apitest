*** Settings ***
Library         RequestsLibrary

*** Variables ***
${base_url}         https://automationexercise.com/api/productsList
${url}              https://automationexercise.com/api/brandsList
${search_url}        https://automationexercise.com/api/searchProduct
${search_term}      {"search_product": "tshirt"}    #isso é um json

*** Test Cases ***
Get All Products List
    [Documentation]    Faz uma solicitação GET para a API e verifica a resposta.
    Create Session                      api_session       ${base_url}
    ${response}=    GET On Session      api_session       ${base_url}        # A parte após a URL (não precisa ser uma rota completa)
    Should Be Equal As Numbers                            ${response.status_code}    200
    Log    ${response.json()}

Post All Products List
    [Documentation]    Faz uma solicitação POST para a API e verifica a resposta.
    Create Session                     api_session        ${base_url}
    ${response}=    post on session    api_session        ${base_url}
    should not be equal                                   ${response.status_code}    200
    log to console                                        ${response.json()}

Get All Brands List
    [Documentation]    Faz uma solicitação GET para a API e verifica a resposta.
    Create Session                    api_session         ${url}
    ${response}=    GET On Session    api_session         ${url}
    Should Be Equal As Numbers                            ${response.status_code}    200
    Log                                                   ${response.json()}

PUT All Brands List
    [Documentation]    Faz uma solicitação PUT para a API e verifica a resposta.
    Create Session                    api_session         ${url}
    ${response}=    put on session    api_session         ${url}
    should not be equal                                   ${response.status_code}    200
    log to console                                        ${response.json()}

POST To Search Product
    [Documentation]    Faz uma solicitação POST para a API e verifica a resposta.
    Create Session                      api_session       ${search_url}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${body}=       Create Dictionary    search_product=${search_term}
    ${response}=    post on session     api_session       ${search_url}      headers=${headers}          json=${body}
    should be equal as numbers                            ${response.status_code}    200
    log                                                   ${response.json()}


