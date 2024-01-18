# Main Express Server
## Home
Calls 3 #get of a `head( N )` of:
- last games $\rightarrow$ competition > selected [single game page](<Routes#Single pages>)
- clubs that have played recently $\rightarrow$ selected [single club page](<Routes#Single pages>)
- players appeared recently sorted by `market_value` $\rightarrow$ selected [single player page](<Routes#Single pages>)
## Competitions
Calls 3 #get :
1. **National**: the values of column `country_name` in `competitions` dataset
2. **International**: the images matching values from `competition_id` column in `competitions` dataset which has `local_competition_code == NA`
3. **England**: the images matching values from `competition_id` column in `competitions` dataset which has `local_competition_code == GB1`
> [!danger]-  Competitions Icons
> We must upload one small img for each `competition_id`'s value.

Each game shown will have a (query) button $\rightarrow$ selected [single game page](<Routes#Single pages>)
### National
Clicking on a card, calls a #get of all competition with `country_name == <NATION>` and insert their `<competition_name>` in the heads of each "accordion menu".
Opening an accordion_`<competition_name>`, it must call a further #get on `games` having `competition_id` belong to the selected `<competition_name>`
### International
On selection, calls a #get of $N$ `games` in corresponding `competition_id`.
`OnClick()` of a "**`more results`** button" (or scrolling the page #opzional) it will call a further #get (or #post which communicates last game read received by the site) to obtain $N$ more `games` 
### England
On selection, calls a #get of $N$ `games` with `competition_id` belonging "England".
`OnClick()` of a "**`more results`** button" (or scrolling the page #opzional) it will call a further #get (or #post which communicates last game read received by the site) to obtain $N$ more `games` 
## Clubs
Shows all clubs in collapsed "accordion menu". 
The criteria to group them will be set by "pills buttons" which should be:
- by Nation
- by Name
- by net-transfer-record
- 

According to the pill button selected, a first #get will be performed in order to obtain all values to fill heads of all accordion menus ( ex. `<nation name>` values).
Expanding an accordion menu, will be performed an other #get to obtain N clubs that respects the criteria and the `more results` button will be shown (or scrolling the page #opzional)
Every club will have a button $\rightarrow$ selected [single club page](<Routes#Single pages>)
## Players
Like [Clubs](<Routes#Clubs>) page, shows all players in collapsed "accordion menu". 
The criteria to group them will be set by "pills buttons" which should be:
- by Nation
- by Name
- by Club
- by [Valuation](<Routes#Valuation>)
- 

According to the pill button selected, a first #get will be performed in order to obtain all values to fill heads of all accordion menus ( ex. `<nation name>` values).
Expanding an accordion menu, will be performed an other #get to obtain N players that respects the criteria and the `more results` button will be shown (or scrolling the page #opzional)

`OnClick()` on a player $\rightarrow$ selected [single player page](<Routes#Single pages>)

### Valuation
Further info about valuation criteria

## Single pages
### Player
### Club

### Game

## Chat