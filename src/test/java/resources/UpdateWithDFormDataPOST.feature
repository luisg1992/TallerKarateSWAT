Feature: Casos de prueba con el método POST
  Background:
    * configure ssl = true
    Given url baseURLPetStore
  Scenario Outline: Actualizamos mascota
    * path '/pet/<petId>'
    * header Content-Type = 'application/x-www-form-urlencoded'
    * form field name = 'Luis A.'
    * form field status = 'Available'
    When method post
    Then status 200
    * print response
    Examples:
      | petId |  |
      | 23     |  |
