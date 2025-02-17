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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getContinente() {
        return continente;
    }

    public void setContinente(String continente) {
        this.continente = continente;
    }

    public int getPoblacion() {
        return poblacion;
    }

    public void setPoblacion(int poblacion) {
        this.poblacion = poblacion;
    }

    public String getBandera() {
        return bandera;
    }

    public void setBandera(String bandera) {
        this.bandera = bandera;
    }

    public Calendar getFecha_independencia() {
        return fecha_independencia;
    }

    public void setFecha_independencia(Calendar fecha_independencia) {
        this.fecha_independencia = fecha_independencia;
    }
    
    
}
