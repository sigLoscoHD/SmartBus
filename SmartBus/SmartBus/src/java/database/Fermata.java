package database;

import java.sql.Time;

public class Fermata {
    public Time orario;
    public int id;
    public String nome_fermata;
    public int citta;

    public Fermata(Time orario, int id, String nome_fermata, int citta) {
        this.orario=orario;
        this.id = id;
        this.nome_fermata = nome_fermata;
        this.citta = citta;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getnome_fermata() {
        return nome_fermata;
    }

    public void setnome_fermata(String nome_fermata) {
        this.nome_fermata = nome_fermata;
    }

    public int getCitta() {
        return citta;
    }

    public void setCitta(int citta) {
        this.citta = citta;
    }
}
