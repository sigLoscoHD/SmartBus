/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

/**
 *
 * @author B I G
 */
public class Utente {
    public int id;
    public String email = "";
    public String nome= "";
    public String cognome = "";
    public String sesso="";
    public String datanascita="";
    public String ruolo = "";
    public String luogonascita="";
    public String residenza="";
    public String password="";
	
    public Utente(int id, String email, String nome, String cognome,String sesso, String datanascita, String ruolo, String luogonascita, String residenza, String password)
    {	
            this.id=id;
            this.nome = nome;
            this.email = email;
            this.cognome = cognome;
            this.sesso = sesso;
            this.datanascita = datanascita;
            this.ruolo = ruolo;
            this.luogonascita=luogonascita;
            this.residenza=residenza;
            this.password=password;

    }
    public String getPassword() {
            return nome;
    }

    public void setPassword(String password) {
            this.password = password;
    }

    public String getEmail() {
            return email;
    }

    public void setEmail(String email) {
            this.email = email;
    }

    public String getNome() {
            return nome;
    }

    public void setNome(String nome) {
            this.nome = nome;
    }

    public String getCognome() {
            return cognome;
    }

    public void setCognome(String cognome) {
            this.cognome = cognome;
    }

    public String getSesso() {
            return sesso;
    }

    public void setSesso(String sesso) {
            this.sesso = sesso;
    }

    public String getDatanascita() {
            return datanascita;
    }

    public void setDatanascita(String datanascita) {
            this.datanascita = datanascita;
    }

    public String getRuolo() {
            return ruolo;
    }

    public void setRuolo(String ruolo) {
            this.ruolo = ruolo;
    }

    public String getLuogonascita() {
            return luogonascita;
    }

    public void setLuogonascita(String luogonascita) {
            this.luogonascita = luogonascita;
    }

    public String getResidenza() {
            return residenza;
    }

    public void setResidenza(String residenza) {
            this.residenza = residenza;
    }
}
