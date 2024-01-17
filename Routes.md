# MainExpressServer
## Home
Chiama 3 #get, con una `head( n )` su:
- ultime partite giocate $\rightarrow$ competition > partita selezionata
- clubs che hanno giocato recentemente $\rightarrow$ club selezionato
- giocatori apparsi recentemente ordinati per `market_value` $\rightarrow$ player selezionato
## Competitions
Chiama 3 #get :
1. **National**: le values della colonna `country_name` in `competitions`
2. **International**: le immagini corrispondenti alle values della colonna `competition_id` in `competitions` che hanno `local_competition_code == NA`
3. **England**: le immagini corrispondenti alle values della colonna `competition_id` in `competitions` che hanno `local_competition_code == GB1`
> [!danger]- Icone per competitions
> Bisogna caricare una immagine piccola per ogni `competition_id`.
### National
Quando si seleziona una card, fa una #get di tutte le competition con `country_name == <nazione>` e ne mette il `<competition_name>` nella testa delle "accordion menu".
Quando si apre una accordion_`<competition_name>`, si deve eseguire una seconda #get su `games` aventi `competition_id` appartenente alla `<competition_name>` selezionata
### International
Alla selezione fa una #get di $N$ `games` della `competition_id` corrispondente.
Premendo un bottone **`more results`** (o scorrendo la pagina #opzionale) dovrà eseguire una ulteriore #get (oppure una #post che indica l'ultima partita ottenuta) per I seguenti $N$ `games` 
### England
Alla selezione fa una #get di $N$ `games` con `competition_id` appartenente a "England".
Premendo un bottone **`more results`** (o scorrendo la pagina #opzionale) dovrà eseguire una ulteriore #get (oppure una #post che indica l'ultima partita ottenuta) per I seguenti $N$ `games` 
## Clubs

## Players

## Chat