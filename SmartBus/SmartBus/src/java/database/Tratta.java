
package database;

public class Tratta {
    public int id;
    public String nomeTratta;
    public int compagnia;
    public String tipo;
    public int partenza;
    public int arrivo;

    public Tratta(int id, String nomeTratta, int compagnia, String tipo, int partenza, int arrivo) {
        this.id = id;
        this.nomeTratta = nomeTratta;
        this.compagnia = compagnia;
        this.tipo = tipo;
        this.partenza = partenza;
        this.arrivo = arrivo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomeTratta() {
        return nomeTratta;
    }

    public void setNomeTratta(String nomeTratta) {
        this.nomeTratta = nomeTratta;
    }

    public int getCompagnia() {
        return compagnia;
    }

    public void setCompagnia(int compagnia) {
        this.compagnia = compagnia;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getPartenza() {
        return partenza;
    }

    public void setPartenza(int partenza) {
        this.partenza = partenza;
    }

    public int getArrivo() {
        return arrivo;
    }

    public void setArrivo(int arrivo) {
        this.arrivo = arrivo;
    }
    
    
    
}
