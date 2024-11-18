package examples.util;

import com.github.javafaker.Faker;

public class Util {

    public static String obtenerNombresRandom(){
        Faker faker = new Faker();
        return faker.name().firstName();
    }

    public static void main(String[] args){
        System.out.println("El nombre aleatorio es: " + obtenerNombresRandom());
    }
}
