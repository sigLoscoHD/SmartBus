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
public class AbbonamentoExtra {
    public Float prezzo;
      public String nome_compagnia;
      public String nome_tratta;
   
   public AbbonamentoExtra(Float prezzo, String nome_compagnia, String nome_tratta){
       this.prezzo=prezzo;
       this.nome_compagnia=nome_compagnia;
       this.nome_tratta=nome_tratta;
   }
}
