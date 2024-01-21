# /home
- `home/get_last_games`
- `home/get_clubs_news`
- `home/get_players_news`
---
# /competitions
- `competitions/get_competitions` $\rightarrow$ It gets all the data we want to show the different subsets of *competitions*: `competition_id`, `country_name` and `competition_name` are **required**.
- `competions/get_national_images` $\rightarrow$ It is **ONE** `get` (or `post`) which gets the images of:
	- national flags 
	- competitions to show (International and English ones)

---
# /clubs
- clubs/get_countries $\rightarrow$ It gets from **Express** all the `country_name` tuples and `local_competition_code` associated, *(to show the accordions sorted by nation)*
- `clubs/query_clubs` $\rightarrow$ This route requires a $@RequestParam$ with a string in one of the following formats:
	- a `<LETTER>` to query all the clubs with name starting with `LETTER` from the **JPA** server
	- a `<LOCAL_COMPETITION_CODE>` to query all the clubs with column `local_competition_code==<LOCAL_COMPETITION_CODE>` from the **JPA** server

---
# /players
- `players/query_players` $\rightarrow$ This route requires a $@RequestParam$ that is a **dict** in the form of two strings, the first indicates one of the following fields:
	- a field `<NATION>` to sort players by the `country` ***(`of_birth` or `of_citizenship`)***  attribute
	- a field `<LAST_NAME>` to sort players by their `last_name`
	- a field `<PLAYER_NAME>` to sort players by their `player_name`
	-  a field `<CLUB>` to sort players by their `current_club_id`.

> While the second one is the value to use as a **filter**. We could have:
>-  a `<LETTER>` to query all the players with **name** or the **last_name** starting with `LETTER` from the **JPA** server
> -  a `<STRING>` to query **only** the matching values of the `field`. This input is triggered by the **search bar**!
> An **example** of $@RequestParam$:  `{'field': 'nation', 'value': 'italy'}`

 - `players/query_playes_valutations` $\rightarrow$ This #get will need a parameter `<VALUATION>` to sort players by the **last** **player valuation** **date** *(We could eventually add the possibility to sort them by decreasing value)*.
 This route requires to query to the **second Express server**, as we are querying the player_valuation table.

---
# /single_page
- `single_club/get_club` $\rightarrow$ It gets a parameter as argument for the #get and loads the **club info** in the single page.
- `single_club/get_game` $\rightarrow$ It gets a parameter as argument for the #get and loads the **game info** in the single page.
- `single_club/get_competition` $\rightarrow$ It gets a parameter as argument for the #get and loads the **competition info** in the single page.
