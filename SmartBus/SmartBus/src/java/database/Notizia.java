
package database;

public class Notizia {
    public int id;
    public String testo;
    public String data;
    public String ora;

    public Notizia(int id, String testo, String data, String ora) {
        this.id = id;
        this.testo = testo;
        this.data = data;
        this.ora = ora;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTesto() {
        return testo;
    }

    public void setTesto(String testo) {
        this.testo = testo;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getOra() {
        return ora;
    }

    public void setOra(String ora) {
        this.ora = ora;
    }
    
}
