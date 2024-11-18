Feature: Casos de prueba metodo GET
  Background:
    * configure ssl = true
    Given url baseURLPetStore

  Scenario Outline: Encontrar mascotas por su status available
    * path '/pet/findByStatus'
    * param status = "<status>"

    When method get
    Then status 200
    * print response
    * match each response contains { "status": "<status>"}
    * match each response[0] ==
    """
        '##(mainSchema)'
    """
  Examples:
    | status    |  |
    | available |  |
    | pending   |  |
    | sold      |  |
