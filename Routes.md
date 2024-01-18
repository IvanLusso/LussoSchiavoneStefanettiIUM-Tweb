# Main Express Server
## Home
Calls 3 #get of an `head( N )` of:
- last games $\rightarrow$ competition > selected game
- clubs that have played recently $\rightarrow$ selected club
- players appeared recently sorted by `market_value` $\rightarrow$ selected player
## Competitions
Calls 3 #get :
1. **National**: the values of column `country_name` in `competitions` dataset
2. **International**: the images matching values from `competition_id` column in `competitions` dataset which has `local_competition_code == NA`
3. **England**: the images matching values from `competition_id` column in `competitions` dataset which has `local_competition_code == GB1`
> [!danger]-  Competitions Icons
> We must upload one small img for each `competition_id`'s value.
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


## Players

## Chat