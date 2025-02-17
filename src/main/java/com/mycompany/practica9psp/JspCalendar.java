package com.mycompany.practica9psp;

import java.util.Calendar;
import java.util.Date;

public class JspCalendar {
    private Date fechaNacimiento;
    private int edad;
    private String signoZodiacal;

    public JspCalendar() {
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
        calcularEdad();
        calcularSignoZodiacal();
    }

    public void calcularEdad() {
        Calendar birthDate = Calendar.getInstance();
        birthDate.setTime(fechaNacimiento);
        
        Calendar today = Calendar.getInstance();
        int edad = today.get(Calendar.YEAR) - birthDate.get(Calendar.YEAR);

        if (today.get(Calendar.MONTH) < birthDate.get(Calendar.MONTH) || 
            (today.get(Calendar.MONTH) == birthDate.get(Calendar.MONTH) && today.get(Calendar.DAY_OF_MONTH) < birthDate.get(Calendar.DAY_OF_MONTH))) {
            edad--;
        }
        
        this.edad = edad;
    }

    public void calcularSignoZodiacal() {
        Calendar birthDate = Calendar.getInstance();
        birthDate.setTime(fechaNacimiento);
        int mes = birthDate.get(Calendar.MONTH) + 1;
        int dia = birthDate.get(Calendar.DAY_OF_MONTH);
        
        if ((mes == 3 && dia >= 21) || (mes == 4 && dia <= 19)) {
            signoZodiacal = "Aries";
        } else if ((mes == 4 && dia >= 20) || (mes == 5 && dia <= 20)) {
            signoZodiacal = "Tauro";
        } else if ((mes == 5 && dia >= 21) || (mes == 6 && dia <= 20)) {
            signoZodiacal = "Géminis";
        } else if ((mes == 6 && dia >= 21) || (mes == 7 && dia <= 22)) {
            signoZodiacal = "Cáncer";
        } else if ((mes == 7 && dia >= 23) || (mes == 8 && dia <= 22)) {
            signoZodiacal = "Leo";
        } else if ((mes == 8 && dia >= 23) || (mes == 9 && dia <= 22)) {
            signoZodiacal = "Virgo";
        } else if ((mes == 9 && dia >= 23) || (mes == 10 && dia <= 22)) {
            signoZodiacal = "Libra";
        } else if ((mes == 10 && dia >= 23) || (mes == 11 && dia <= 21)) {
            signoZodiacal = "Escorpio";
        } else if ((mes == 11 && dia >= 22) || (mes == 12 && dia <= 21)) {
            signoZodiacal = "Sagitario";
        } else if ((mes == 12 && dia >= 22) || (mes == 1 && dia <= 19)) {
            signoZodiacal = "Capricornio";
        } else if ((mes == 1 && dia >= 20) || (mes == 2 && dia <= 18)) {
            signoZodiacal = "Acuario";
        } else if ((mes == 2 && dia >= 19) || (mes == 3 && dia <= 20)) {
            signoZodiacal = "Piscis";
        }
    }

    public int getEdad() {
        return edad;
    }

    public String getSignoZodiacal() {
        return signoZodiacal;
    }
}
