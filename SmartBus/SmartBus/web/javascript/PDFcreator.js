/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function generaBiglietto(){
 var doc = new jsPDF();
doc.text(20, 20, 'Biglietto');
doc.text(20, 30, 'Compagnia: ');
doc.text(20, 40, 'Città: ');
doc.text(20, 50, 'Tratta: ');
doc.text(20, 60, 'Acquistato da nome_utente cognome_utente ');
// Output as Data URI
doc.output('datauri');
}

function generaAbbonamento(){
 var doc = new jsPDF();
doc.text(20, 20, 'Abbonamento');
doc.text(20, 30, 'Nome : ');
doc.text(20, 40, 'Cognome :');
doc.text(20, 50, 'Data di nascita :');
doc.text(20, 60, 'Luogo di nascita :');
doc.text(20, 70, 'Compagnia: ');
doc.text(20, 80, 'Valido per la tratta nome_tratta ');


// Output as Data URI
doc.output('datauri');
}

