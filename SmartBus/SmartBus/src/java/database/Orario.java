package database;

import java.sql.Time;

public class Orario {
    
    public int id_orario;
    public int fermata;
    public Time orario;
    public int corsa;
    public int ar;
    public int tratta;

    public Orario(int id_orario, int fermata, Time orario, int corsa, int ar, int tratta) {
        this.id_orario = id_orario;
        this.fermata = fermata;
        this.orario = orario;
        this.corsa = corsa;
        this.ar = ar;
        this.tratta = tratta;
    }

    public int getId_orario() {
        return id_orario;
    }

    public void setId_orario(int id_orario) {
        this.id_orario = id_orario;
    }

    public int getFermata() {
        return fermata;
    }

    public void setFermata(int fermata) {
        this.fermata = fermata;
    }

    public Time getOrario() {
        return orario;
    }

    public void setOrario(Time orario) {
        this.orario = orario;
    }

    public int getCorsa() {
        return corsa;
    }

    public void setCorsa(int corsa) {
        this.corsa = corsa;
    }

    public int getAr() {
        return ar;
    }

    public void setAr(int ar) {
        this.ar = ar;
    }

    public int getTratta() {
        return tratta;
    }

    public void setTratta(int tratta) {
        this.tratta = tratta;
    }
}
