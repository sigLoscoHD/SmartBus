package database;

public class Compagnia {

    public int id;
    public String nome;
    public int id_citta;

    public Compagnia(int id, String nome,int id_citta) {
        this.id = id;
        this.nome = nome;
        this.id_citta=id_citta;
    }

    public int getId_citta() {
        return id_citta;
    }

    public void setId_citta(int id_citta) {
        this.id_citta = id_citta;
    }
   
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
}
