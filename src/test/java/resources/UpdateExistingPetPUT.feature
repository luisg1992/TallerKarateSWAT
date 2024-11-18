Feature: Casos de prueba metodo PUT
  Background:
    * configure ssl = true
    Given url baseURLPetStore

  Scenario: Actualizar mascota existente
    * path '/pet'
    * def bodyRequest = read('classpath:examples/data/req/MascotaActualizarJson.json')
    * request bodyRequest
    * def mainSchema =
      """
        {
          "id": #number,
          "category":
            {
              "id": #number,
              "name": #string
            },
          "name": #string,
          "photoUrls": #[] #string,
          "tags":
            [
              {
                "id": #number,
                "name": #string
              }
            ],
          "status": #string
        }
      """
    * method put
    Then status 200
    * print response
    * match response.name == bodyRequest.name
    * match response.status == bodyRequest.status
    * match response == mainSchema

