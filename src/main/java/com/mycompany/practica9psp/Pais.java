package com.mycompany.practica9psp;

import java.util.*;

public class Pais {
    private int id;
    private String nombre;
    private String continente;
    private int poblacion;
    private String bandera;
    private Calendar fecha_independencia;

    public Pais(int id, String nombre, String continente, int poblacion, String bandera, Calendar fecha_independencia) {
        this.id = id;
        this.nombre = nombre;
        this.continente = continente;
        this.poblacion = poblacion;
        this.bandera = bandera;
        this.fecha_independencia = fecha_independencia;
    }
}
