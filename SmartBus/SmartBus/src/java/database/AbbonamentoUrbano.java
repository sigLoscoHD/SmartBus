/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

/**
 *
 * @author Matteo
 */
public class AbbonamentoUrbano {
    public Float prezzo;
   public String nome_compagnia;
   public String nome_citta;
   
   public AbbonamentoUrbano(Float prezzo, String nome_compagnia, String nome_citta){
       this.prezzo=prezzo;
       this.nome_compagnia=nome_compagnia;
       this.nome_citta=nome_citta;
}
}