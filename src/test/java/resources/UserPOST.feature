Feature: Casos de prueba de metodo GET

  Background:
    * configure ssl = true
    Given url baseURLReqRes


  Scenario: crear un usuario
    * path '/api/users'
    * request {"name": "Eulices","job": "Student"}
    When method post
    Then status 201
    * print response
    * def responseApi = response
    * def nombre = responseApi.name
    * print 'El nombre obtenido es: ' + nombre
    * match nombre == 'Eulices'

  Scenario Outline: crear 3 usuarios : <id> <name> es <job>
    * path '/api/users'
    * request {"name": "#(name)","job":"#(job)"}
    * method post
    Then status 201
    * print response
    Examples:
      | name   | job       |
      | Jose   | tester    |
      | Marlon | developer |
      | Ismael | Ux        |

  Scenario Outline: crear usuarios desde un archivo Json
    * configure ssl = true
    Given url baseURLReqRes
    * path '/api/users'
    * request {"name": "<name>","job":"<job>"}
    * method post
    Then status 201
    * print response
    Examples:
      | read('classpath:examples/data/req/UsuarioDataDrivenConJson.json') |

    Scenario: crear un usuario con request body desde Json
      * configure ssl = true
      Given url baseURLReqRes
      * path '/api/users'
        * def bodyRequest = 'read(classpath:examples/data/req/UsuarioNuevo.json'
      * request bodyRequest
      * method post
      Then status 201
      * print response

  Scenario: crear un usuario desde una función de una clase Java
    * def utilGeneraNombres = Java.type('examples.util.Util')
    * def nameRandom = utilGeneraNombres.obtenerNombresRandom()
    * print 'El nombre random es: '+ 'nameRandom'
    * path '/api/users'
    * request {"name": "#(nameRandom)","job":"SWAT"}
    * method post
    Then status 201
    * print response

