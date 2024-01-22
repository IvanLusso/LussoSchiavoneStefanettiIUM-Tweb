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
- `clubs/get_countries` $\rightarrow$ It gets from **Express** all the `country_name` tuples and `local_competition_code` associated, *(to show the accordions sorted by nation)*
- `clubs/query_clubs_by_nation` $\rightarrow$ This route requires a $@RequestParam$ of **string** type, to query the tuples that match the `<LOCAL_COMPETITION_CODE>` argument.
- `clubs/query_clubs_by_name` $\rightarrow$ This route requires a $@RequestParam$ of **string** type to query the tuples that match the `club_name` given
- `clubs/get_club_by_id` $\rightarrow$ This #get requires a $@RequestParam$ of **int** type *(the club_id associated to the button of the club tuple)* and it redirects the user to the ***single_page***, where the club info will been shown

---
# /players
- `players/query_player_by_name` $\rightarrow$ This #get requires a $@RequestParam$ of **string** type *(with `length > 1`)*. The tuples will be returned and ordered by `last_name`. We want to get these values: `player_id`, `last_name`, `player_name` and `image_url`.
- `players/query_players_by_nation` $\rightarrow$ This route requires a $@RequestParam$ of **string** type. The tuples will be returned and ordered by `country_of_citizenship`. We want to get these values: `player_id`, `last_name`, `player_name`, `country_of_citizenship`, `image_url`.
-  `players/query_player_by_club` $\rightarrow$ This #get requires a $@RequestParam$ of **long int** type. The tuples will be returned and ordered by `current_club_id`. 
- `players/query_players_by_club/query_name` $\rightarrow$ This #get requires a $@RequestParam$ of type **DICT**. The format of the dict accepted will be `{club: '<long_int_value>', 'name': '<string>'}`.
 - `players/query_playes_valutations` $\rightarrow$ This #get will need a requires a $@RequestParam$ of **date** type, to sort players by the **last player valuation date** *(We could eventually add the possibility to sort them by decreasing value)*.

---
# /single_page
- `single_club/get_club` $\rightarrow$ It gets a parameter *(**int**)* as argument for the #get and loads the **club info** in the single page.
- `single_club/get_game` $\rightarrow$ It gets a parameter *(**int**)* as argument for the #get and loads the **game info** in the single page.
- `single_club/get_competition` $\rightarrow$ It gets a parameter *(**string**)* as argument for the #get and loads the **competition info** in the single page.
- - `single_club/get_player` $\rightarrow$ It gets a parameter *(**int**)* as argument for the #get and loads the **player info** in the single page.
