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
															" WHERE email LIKE ? "
															+ " AND password LIKE ? AND Cancellato=0;");
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
	
	public static int registrazione(String nome, String cognome, String email, String password, String datanascita, String sesso, ServletContext cont){
		int i=0;
		try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://" + cont.getInitParameter("ip") + "/" + cont.getInitParameter("database") + "?" +
                    "user=" + cont.getInitParameter("user") + "&password=" + cont.getInitParameter("dbpassword"));


                    PreparedStatement pstmt = con.prepareStatement(" INSERT INTO `utente` "
                                    + " (`Nome`, `Cognome`, `Email`, `Password`, `Datanascita`, `Ruolo`, `Cancellato`, `Sesso`) "
                                    + " VALUES (?, ?, ?, ?, ?, 'user', 0, ?); ");


                    pstmt.setString(1, nome);
                    pstmt.setString(2, cognome);
                    pstmt.setString(3, email);
                    pstmt.setString(4, password);
                    pstmt.setString(5, datanascita);
                    pstmt.setString(6, sesso);

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
}
