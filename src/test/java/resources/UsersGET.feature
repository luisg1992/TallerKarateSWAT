Feature: Casos de prueba de metodo GET

  Background:
    * configure ssl = true
    Given url baseURLReqRes


  Scenario: Listar usuario por pagina 1
    * path '/api/users'
    * param page = 1
    When method get
    Then status 200
    * print response
    * match response.data[0].first_name == 'George'


  Scenario: Listar usuario por pagina 2
    * path '/api/users'
    * param page = 2
    When method get
    Then status 200
    * print response
    * match response.data[0].first_name == 'George'