/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import javax.servlet.ServletContext;

/**
 *
 * @author Matteo,Simone
 */

public class DBQuery {
    public static Utente DB_Login(String user, String pass, ServletContext cont)
	{
            Utente ut = null;

            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://" + cont.getInitParameter("ip") + "/" + cont.getInitParameter("database") + "?" +
                "user=" + cont.getInitParameter("user") + "&password=" + cont.getInitParameter("dbpassword"));


                PreparedStatement pstmt = con.prepareStatement(" SELECT * " + 
                                                               " FROM utente " + 
                                                               " WHERE email LIKE ? " +
                                                               " AND password LIKE ? AND Cancellato=0;");
                pstmt.setString(1, user);
                pstmt.setString(2, pass);

                ResultSet rs = pstmt.executeQuery();

                while (rs.next()){
                        int id=rs.getInt("ID");
                        String nome =  rs.getString("Nome");	
                        String cognome =  rs.getString("Cognome");	
                        String email = rs.getString("Email");	
                        String sesso= rs.getString("Sesso");
                        String datanascita= rs.getString("Data_nascita");
                        String ruolo= rs.getString("Ruolo");
                        String luogonascita= rs.getString("Luogo_nascita");
                        String residenza= rs.getString("Residenza");
                        String password=rs.getString("Password");

                        ut= new Utente(id, email, nome, cognome, sesso, datanascita, ruolo, luogonascita, residenza, password);			
                }

                con.close();

            }
            catch (Exception e) {
                    System.out.println("Errore con DB o Query errata");
                    e.printStackTrace();
            }

            return ut;
    } // End DB_Login.

    public static Utente DB_Login_ByCookie(String user, ServletContext cont)
    {
        Utente ut = null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + cont.getInitParameter("ip") + "/" + cont.getInitParameter("database") + "?" +
            "user=" + cont.getInitParameter("user") + "&password=" + cont.getInitParameter("dbpassword"));

            PreparedStatement pstmt = con.prepareStatement(" SELECT * " + 
                                                           " FROM utente " + 
                                                           " WHERE email LIKE ? ");
            pstmt.setString(1, user);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){			
                int id=rs.getInt("ID");
                String nome =  rs.getString("Nome");	
                String cognome =  rs.getString("Cognome");	
                String email = rs.getString("Email");	
                String sesso= rs.getString("Sesso");
                String datanascita= rs.getString("Data_nascita");
                String ruolo= rs.getString("Ruolo");
                String luogonascita= rs.getString("Luogo_nascita");
                String residenza= rs.getString("Residenza");
                String password=rs.getString("Password");				

                ut= new Utente(id, email, nome, cognome, sesso, datanascita, ruolo, luogonascita, residenza, password);
            }
            con.close();			
        }
        catch (Exception e) {
                System.out.println("Errore con DB o Query errata");
                e.printStackTrace();
        }
        return ut;
         // End DB_Login_ByCookie.
    }
	
    public static int registrazione(String nome, String cognome, String email, String password, String sesso, ServletContext cont){
            int i=0;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://" + cont.getInitParameter("ip") + "/" + cont.getInitParameter("database") + "?" +
                "user=" + cont.getInitParameter("user") + "&password=" + cont.getInitParameter("dbpassword"));


                PreparedStatement pstmt = con.prepareStatement(" INSERT INTO `utente` "
                                + " (`Ruolo`, `Cancellato`, `Nome`, `Cognome`,`Email`, `Password`, `Sesso`) "
                                + " VALUES ('user', 0, ?, ?, ?, ?, ?); ");


                pstmt.setString(1, nome);
                pstmt.setString(2, cognome);
                pstmt.setString(3, email);
                pstmt.setString(4, password);
                pstmt.setString(5, sesso);

                i = pstmt.executeUpdate();

                con.close();	
            }

            catch (Exception e) 
            {
                    System.out.println("Errore con DB o Query errata");
                    e.printStackTrace();
            }

            return i;
    }// End registrazione

    public static String check_email(String email,ServletContext cont)
    {
            String mail="";

            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://" + cont.getInitParameter("ip") + "/" + cont.getInitParameter("database") + "?" +
                "user=" + cont.getInitParameter("user") + "&password=" + cont.getInitParameter("dbpassword"));


                PreparedStatement pstmt = con.prepareStatement(" SELECT Email " + 
                                                               " FROM utente " + 
                                                               " WHERE Email=? ");
                pstmt.setString(1, email);

                ResultSet rs = pstmt.executeQuery();

                while (rs.next()){
                         mail=rs.getString("Email");
                }

                con.close();

            }
            catch (Exception e) {
                    System.out.println("Errore con DB o Query errata");
                    e.printStackTrace();
            }
            return mail;
             // check_email
    }

    public static ArrayList <Citta> getCitta(ServletContext cont)
    {
        ArrayList <Citta> acitta=new ArrayList();

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + cont.getInitParameter("ip") + "/" + cont.getInitParameter("database") + "?" +
            "user=" + cont.getInitParameter("user") + "&password=" + cont.getInitParameter("dbpassword"));

            PreparedStatement pstmt = con.prepareStatement(" SELECT * " + 
                                                           " FROM citta ");


            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){			
                int id=rs.getInt("ID");
                String nome=rs.getString("Nome_citta");

                Citta c = new Citta(id, nome);

                acitta.add(c);
            }
            con.close();			
        }
        catch (Exception e) {
                System.out.println("Errore con DB o Query errata");
                e.printStackTrace();
        }
        return acitta;
         // End getCitta
    }


    public static ArrayList <Compagnia> getCompagnia(int citta,ServletContext cont)
    {
        ArrayList <Compagnia> acompagnia=new ArrayList();

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + cont.getInitParameter("ip") + "/" + cont.getInitParameter("database") + "?" +
            "user=" + cont.getInitParameter("user") + "&password=" + cont.getInitParameter("dbpassword"));

            PreparedStatement pstmt = con.prepareStatement(" SELECT distinct c.ID, c.Nome_compagnia, f.Citta as citta " + 
                                                           " FROM compagnia as c  " + 
                                                                " join tratta as t on c.ID=t.Compagnia " +
                                                                " join corsa as co on co.Tratta=t.ID " +
                                                                " join orario as o on o.Corsa=co.ID " +
                                                                " join fermata as f on f.ID=o.Fermata " +
                                                           " where citta like ? ");

            pstmt.setInt(1, citta);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){			
                int id=rs.getInt("ID");
                String nome_compagnia=rs.getString("Nome_compagnia");
                int id_citta=rs.getInt("citta");

                Compagnia c= new Compagnia(id, nome_compagnia, id_citta);
                acompagnia.add(c);
            }
            con.close();			
        }
        catch (Exception e) {
                System.out.println("Errore con DB o Query errata");
                e.printStackTrace();
        }
        return acompagnia;
         // End getCompagnia
    }

    public static int UPDATE_utente(String nome, String cognome, String datanascita, String residenza, String luogonascita, int id,ServletContext cont){
            int i=0;

            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://" + cont.getInitParameter("ip") + "/" + cont.getInitParameter("database") + "?" +
                "user=" + cont.getInitParameter("user") + "&password=" + cont.getInitParameter("dbpassword"));


                PreparedStatement pstmt = con.prepareStatement(" UPDATE `utente` SET `Nome`= ?, `Cognome`= ?,`Residenza`= ?, `Data_nascita`= ?, `Luogo_nascita`= ? WHERE `ID`= ? LIMIT 1;");


                pstmt.setString(1, nome);
                pstmt.setString(2, cognome);
                pstmt.setString(3, residenza);
                pstmt.setString(4, datanascita);
                pstmt.setString(5, luogonascita);
                pstmt.setInt(6, id);
                i = pstmt.executeUpdate();

                con.close();
    }

            catch (Exception e) 
            {
                    System.out.println("Errore con DB o Query errata");
                    e.printStackTrace();
            }

            return i;
    }// End UPDATE_utente

    public static ArrayList <Tratta> getTratta(int compagnia,String tipo,int citta,ServletContext cont)
    {
        ArrayList <Tratta> atratta=new ArrayList();

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + cont.getInitParameter("ip") + "/" + cont.getInitParameter("database") + "?" +
            "user=" + cont.getInitParameter("user") + "&password=" + cont.getInitParameter("dbpassword"));

            PreparedStatement pstmt = con.prepareStatement(" SELECT t.id, t.Nome_tratta, t.partenza, t.Arrivo " + 
                                                           " FROM tratta as t " + 
                                                                " join corsa as c on t.ID=c.Tratta " +
                                                                " join orario as o on o.Corsa=c.ID " +
                                                                " join fermata as f on f.ID=o.Fermata " +
                                                                " where citta like ? and compagnia like ? and tipo like ? "+
                                                                "group by Nome_tratta");
            pstmt.setInt(1, citta);
            pstmt.setInt(2, compagnia);
            pstmt.setString(3, tipo);


            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){			
                int id=rs.getInt("ID");
                String nome_tratta=rs.getString("Nome_tratta");
                int partenza=rs.getInt("Partenza");
                int arrivo=rs.getInt("Arrivo");

                Tratta t=new Tratta(id, nome_tratta, compagnia, tipo, partenza, arrivo);
                atratta.add(t);
            }
            con.close();			
        }
        catch (Exception e) {
                System.out.println("Errore con DB o Query errata");
                e.printStackTrace();
        }
        return atratta;
         // End getTratta
    }

    public static ArrayList <Fermata> getFermata(int tratta,ServletContext cont)
    {
        ArrayList <Fermata> afermata=new ArrayList();

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + cont.getInitParameter("ip") + "/" + cont.getInitParameter("database") + "?" +
            "user=" + cont.getInitParameter("user") + "&password=" + cont.getInitParameter("dbpassword"));

            PreparedStatement pstmt = con.prepareStatement(" select distinct orario, fermata ,f.Nome_fermata,f.citta" + 
                                                           " from tratta as t  " + 
                                                                " join corsa as c on c.Tratta= t.ID " +
                                                                " join orario as o on o.Corsa= c.id " +
                                                                " join fermata as f on f.ID=o.Fermata " +
                                                           " where tratta like ?"+
                                                           " group by f.Nome_fermata "+
                                                           " order by corsa, orario ");

            pstmt.setInt(1, tratta);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){
                Time orario=rs.getTime("orario");
                int id=rs.getInt("fermata");
                String nome_fermata=rs.getString("Nome_fermata");
                int id_citta=rs.getInt("citta");

                Fermata f = new Fermata(orario, id, nome_fermata, id_citta);

                afermata.add(f);
            }
            con.close();			
        }
        catch (Exception e) {
                System.out.println("Errore con DB o Query errata");
                e.printStackTrace();
        }
        return afermata;
         // End getFermata
    }

   public static ArrayList <Orario> getOrari(int tratta,ServletContext cont)
    {
        ArrayList <Orario> aorari = new ArrayList();

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + cont.getInitParameter("ip") + "/" + cont.getInitParameter("database") + "?" +
            "user=" + cont.getInitParameter("user") + "&password=" + cont.getInitParameter("dbpassword"));

            PreparedStatement pstmt = con.prepareStatement(" select o.ID as id_corsa, o.Fermata, o.Orario, o.Corsa, c.AR as ar , c.Tratta " + 
                                                           " from orario as o  " + 
                                                                " join corsa as c on o.Corsa=c.ID " +
                                                                " join tratta as t on c.Tratta=t.ID " +
                                                                " WHERE t.id like ? " +
                                                                " order by corsa, orario ");

            pstmt.setInt(1, tratta);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){
               int id = rs.getInt("id_corsa");
               int fermata=rs.getInt("Fermata");
               Time orario=rs.getTime("Orario");
               int corsa = rs.getInt("Corsa");
               int ar = rs.getInt("ar");

               Orario o = new Orario(id, fermata, orario, corsa, ar, tratta);

               aorari.add(o);
            }
            con.close();			
        }
        catch (Exception e) {
                System.out.println("Errore con DB o Query errata");
                e.printStackTrace();
        }
        return aorari;
         // End getFermata
    }
   
    public static int pubblicaNotizia(String testo, String data, String hour, ServletContext cont){
            int i=0;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://" + cont.getInitParameter("ip") + "/" + cont.getInitParameter("database") + "?" +
                "user=" + cont.getInitParameter("user") + "&password=" + cont.getInitParameter("dbpassword"));


                PreparedStatement pstmt = con.prepareStatement(" INSERT INTO `notizie` "
                                + " (`Notizia`, `Data`, `Orario`) "
                                + " VALUES (?,?,?); ");


                pstmt.setString(1, testo);
                pstmt.setString(2, data);
                pstmt.setString(3, hour);
                
                i = pstmt.executeUpdate();

                con.close();	
            }

            catch (Exception e) 
            {
                    System.out.println("Errore con DB o Query errata");
                    e.printStackTrace();
            }

            return i;
    }// End pubblicaNotifica
   
    public static ArrayList <Notizia> visualizzaNotizie(ServletContext cont)
    {
        ArrayList <Notizia> anotizia= new ArrayList ();
                
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + cont.getInitParameter("ip") + "/" + cont.getInitParameter("database") + "?" +
            "user=" + cont.getInitParameter("user") + "&password=" + cont.getInitParameter("dbpassword"));


            PreparedStatement pstmt = con.prepareStatement(" SELECT * " + 
                                                           " FROM notizie ORDER BY ID DESC");

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){
                int id=rs.getInt("ID");
                String notizia = rs.getString("Notizia");
                String data= rs.getString("Data");
                String orario=rs.getString("Orario");
                
                Notizia n = new Notizia(id, notizia, data, orario);
                anotizia.add(n);        			
            }

            con.close();

        }
        catch (Exception e) {
                System.out.println("Errore con DB o Query errata");
                e.printStackTrace();
        }

        return anotizia;
    } // End visualizzaNotifiche
    
    
    
    
    public static BigliettoUrbano getPrezzoUrbano(String citta, String compagnia, ServletContext cont)
    {
        BigliettoUrbano bu=null;

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + cont.getInitParameter("ip") + "/" + cont.getInitParameter("database") + "?" +
            "user=" + cont.getInitParameter("user") + "&password=" + cont.getInitParameter("dbpassword"));

            PreparedStatement pstmt = con.prepareStatement("SELECT Prezzo, Nome_citta, Nome_compagnia " + 
                                                           "FROM biglietto_urbano AS bu join compagnia as c on c.ID=bu.Compagnia join citta as ci on ci.ID=bu.Citta" + 
                                                                " WHERE ci.Nome_citta LIKE ? AND c.Nome_compagnia LIKE ?;");

            pstmt.setString(1, citta);
            pstmt.setString(2, compagnia);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){
                Float prezzo = rs.getFloat("Prezzo");
                bu=new BigliettoUrbano(prezzo, compagnia, citta);
            }
            con.close();			
        }
        catch (Exception e) {
                System.out.println("Errore con DB o Query errata");
                e.printStackTrace();
        }
        return bu;
         // End getPrezzoUrbano
    }
    
    
    public static BigliettoExtra getPrezzoExtra(String tratta, String compagnia, ServletContext cont)
    {
        BigliettoExtra be=null;

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + cont.getInitParameter("ip") + "/" + cont.getInitParameter("database") + "?" +
            "user=" + cont.getInitParameter("user") + "&password=" + cont.getInitParameter("dbpassword"));

            PreparedStatement pstmt = con.prepareStatement("SELECT Prezzo, Nome_tratta, Nome_compagnia" + 
                                                           " FROM biglietto_extra AS be join compagnia as c on c.ID=be.Compagnia join tratta as t on t.ID=be.Tratta" + 
                                                                " WHERE t.Nome_tratta LIKE ? AND c.Nome_compagnia LIKE ? ");

            pstmt.setString(1, tratta);
            pstmt.setString(2, compagnia);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){
                Float prezzo = rs.getFloat("Prezzo");
                be=new BigliettoExtra(prezzo, compagnia, tratta);
            }
            con.close();			
        }
        catch (Exception e) {
                System.out.println("Errore con DB o Query errata");
                e.printStackTrace();
        }
        return be;
         // End getBigliettoExtra
    }
    
    
    public static AbbonamentoUrbano getAbbonamentoUrbano(String citta, String compagnia, ServletContext cont)
    {
       AbbonamentoUrbano au=null;

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + cont.getInitParameter("ip") + "/" + cont.getInitParameter("database") + "?" +
            "user=" + cont.getInitParameter("user") + "&password=" + cont.getInitParameter("dbpassword"));

            PreparedStatement pstmt = con.prepareStatement("SELECT Prezzo, Nome_citta, Nome_compagnia " + 
                                                           "FROM abbonamento_urbano AS au join compagnia as c on c.ID=au.Compagnia join citta as ci on ci.ID=au.Citta" + 
                                                                " WHERE ci.Nome_citta LIKE ? AND c.Nome_compagnia LIKE ?;");

            pstmt.setString(1, citta);
            pstmt.setString(2, compagnia);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){
                Float prezzo = rs.getFloat("Prezzo");
                au= new AbbonamentoUrbano(prezzo, compagnia, citta);
            }
            con.close();			
        }
        catch (Exception e) {
                System.out.println("Errore con DB o Query errata");
                e.printStackTrace();
        }
        return au;
         // End AbbonamentoUrbano
    }
    
    
    public static AbbonamentoExtra getAbbonamentoExtra(String tratta, String compagnia, ServletContext cont)
    {
        AbbonamentoExtra ae=null;

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + cont.getInitParameter("ip") + "/" + cont.getInitParameter("database") + "?" +
            "user=" + cont.getInitParameter("user") + "&password=" + cont.getInitParameter("dbpassword"));

            PreparedStatement pstmt = con.prepareStatement("SELECT Prezzo, Nome_tratta, Nome_compagnia" + 
                                                           " FROM abbonamento_extra AS ae join compagnia as c on c.ID=ae.Compagnia join tratta as t on t.ID=ae.Tratta" + 
                                                                " WHERE t.Nome_tratta LIKE ? AND c.Nome_compagnia LIKE ? ");

            pstmt.setString(1, tratta);
            pstmt.setString(2, compagnia);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){
                Float prezzo = rs.getFloat("Prezzo");
                ae=new AbbonamentoExtra(prezzo, compagnia, tratta);
            }
            con.close();			
        }
        catch (Exception e) {
                System.out.println("Errore con DB o Query errata");
                e.printStackTrace();
        }
        return ae;
         // End getAbbonamentoExtra
    }
    
    
}

        
