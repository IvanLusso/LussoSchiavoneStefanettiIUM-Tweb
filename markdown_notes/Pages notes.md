# Main Express Server
## Home
Calls 3 #get of a `head( N )` of:
- last **games** $\rightarrow$ selected [single game page](<Routes#Single pages>)
- **clubs** that have played recently $\rightarrow$ selected [single club page](<Routes#Single pages>)
- **players** appeared recently sorted by `market_value` $\rightarrow$ selected [single player page](<Routes#Single pages>)

---
## Competitions
For this page and [club page](#Clubs) we have built an additional Schema called ***'flags'***. 
> The *flags* schema contains the following data:
> - `domestic_league_code`
> - `country_name`
> - `flag_url` $\rightarrow$ *It's an URL to a GitHub repository that provides flags images.* 

This page delegate [Carousel](#Carousel) instances to call 3 #get
1. **National**: the values of column `country_name`, with the linked `league_code` and the `flag_url` 
2. **International**: the images whose `competition_id` is associated with an `NA` value of `local_competition_code`
3. **England**: the images whose `competition_id` is associated with an `GB1` value of `local_competition_code`

Each game shown will have a (query) button $\rightarrow$ selected [single game page](<Routes#Single pages>)
### National
Clicking on a card, calls a #get of all competitions with `country_name == <NATION>` and insert their `<competition_name>` in the heads of each "accordion menu".
Opening an accordion_`<competition_name>`, it must call a further #get on `games` having `competition_id` belong to the selected `<competition_name>`.
The games shown will have all the **last** `season` found for the `competition_id` passed.
### International
On selection, it redirects to `single_page/competition` with the corresponding `competition_id`.
### England
On selection, it redirects to `single_page/competition` with the corresponding British competition clicked.

---
## Clubs
This page is meant to show all clubs in "accordion menus". 
All accordions start collapsed.
The criteria to group them will be set by Nation on `local_competition_code`

A first #get will be performed in order to obtain all values to fill heads of all accordion menus ( e.g. `<national_flag> <country_name> <competition_code>` ).
Expanding an accordion menu, another #get will be performed to obtain the clubs that respects the criteria
Every club will have a button $\rightarrow$ selected [single club page](<Routes#Single pages>)

---
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

---
## Single pages
This page is meant to show the data of a single entity *(game, competition, player, club)*.
1. First of all, a route like `"/clubs/single_page"` *(names have to be defined yet)* is called with an **argument** of what it has to show. 
2. After that, the route will loads a *"struct"* in the `routes/index.js` with the data queried.
3. Finally, the first route will redirect to the **HTML** page (probably a #get), where the page will show the data.

$\bf{Example:}$
The route could have this structure:
``` js
try {  
	const Promise1 = load_data1()  
    const Promise2 = load_data2() 
	const Promise3 = load_data3()  
	Promise.all([Promise1, Promise2,  Promise3])  
	    .then(r => {  
				// to show the html page 
		        res.status(200).redirect('/single_page') 
	    })  
} catch (err) {  
	res.status(500).send('error' + err)  
}
 ```
### Player
### Club

### Game

---
## Chat
The chat has been implemented with the use of the ***socket.io*** library.
Its behaviour is different in base of the device used for the application.
- **Mobile:** will

---
## Carousel