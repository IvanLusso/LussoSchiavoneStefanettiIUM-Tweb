# /home
- [ ] `home/get_last_games` - #JPA $\rightarrow$ This #get will retrieve the last 20/25 games. For this, we can set a **query string** to order the tuples by their `game_date`
	> HYD:
	> info to gain: `game_date`, `competition_id`, 2 `club_name`, 2 `own_goal`, `club_img`.

- [ ] `home/get_recent_clubs_news`
- [ ] `home/get_trend_players`
---
# /competitions
- [ ] `competitions/get_competitions` - #EXPRESS $\rightarrow$ It gets all the data we want to show the different subsets of *competitions*: `competition_id`, `country_name` and `competition_name` are **required**
- [ ] `competitions/get_national_images` - #EXPRESS $\rightarrow$ It is **ONE** `get` (or `post`) which gets the images of:
	- national flags 
	- competitions to show (International and English ones)
- [ ] `competitions/get_countries` - #EXPRESS $\rightarrow$ It gets all the `country_name` tuples and `local_competition_code` associated, *(to show the accordions sorted by nation)*
- [ ] `competitions/query_clubs_by_nation` - #JPA $\rightarrow$ This route requires a $@RequestParam$ of **string** type, to query the tuples that match the `<LOCAL_COMPETITION_CODE>` argument.

---
# /clubs
- [ ] `clubs/query_clubs_by_name` - #JPA  $\rightarrow$ This route requires a $@RequestParam$ of **string** type to query the tuples that match the `club_name` given
- [ ] `clubs/get_club_by_id` - #JPA $\rightarrow$ This #get requires a $@RequestParam$ of **int** type *(the `club_id` associated to the button of the club tuple)* and it redirects the user to the ***single_page***, where the club info will been shown

---
# /players
- [ ] `players/query_player_by_name` - #JPA $\rightarrow$ This #get requires a $@RequestParam$ of **string** type *(with `length > 1`)*. The tuples will be returned and ordered by `last_name`. We want to get these values: `player_id`, `last_name`, `player_name` and `image_url`
- [ ] `players/query_players_by_nation` - #JPA $\rightarrow$ This route requires a $@RequestParam$ of **string** type. The tuples will be returned and ordered by `country_of_citizenship`. We want to get these values: `player_id`, `last_name`, `player_name`, `country_of_citizenship`, `image_url`
- [ ]  `players/query_player_by_club` - #JPA $\rightarrow$ This #get requires a $@RequestParam$ of **long int** type. The tuples will be returned and ordered by `current_club_id`. 
- [ ] `players/query_players_by_club/query_name` - #JPA $\rightarrow$ This #get requires a $@RequestParam$ of type **DICT**. The format of the dict accepted will be `{club: '<long_int_value>', 'name': '<string>'}`
 - [ ] `players/query_playes_valuations` - #EXPRESS $\rightarrow$ This #get will need a requires a $@RequestParam$ of **date** type, to sort players by the **last player valuation date** *(We could eventually add the possibility to sort them by decreasing value)*
 - [ ] `players/get_player_by_id` - #JPA $\rightarrow$ This #get will redirect the user to the ***single_page***, loading info about the given `player_id`

---
# /single_page
- [ ] `single_club/get_club` - #JPA $\rightarrow$ It gets a parameter *(**int**)* as argument for the #get and loads the **club info** in the ***single_page***
- [ ] `single_club/get_game` - #JPA $\rightarrow$ It gets a parameter *(**int**)* as argument for the #get and loads the **game info** in the ***single_page***
- [ ] `single_club/get_competition` - #EXPRESS $\rightarrow$ It gets a parameter *(**string**)* as argument for the #get and loads the **competition info** in the ***single_page***. It also call `single_club/get_games_by_competition` to get the values of `games`
- [ ] `single_club/get_games_by_competition` - #JPA $\rightarrow$ It gets games info in base of the argument passed, which has to be a `<COMPETITION_ID>`
- [ ] `single_club/get_games_by_club` - #JPA $\rightarrow$ It gets games info in base of the argument passed, which has to be a `<CLUB_ID>`
- [ ] `single_club/get_player` #JPA $\rightarrow$ It gets a parameter *(**int**)* as argument for the #get and loads the **player info** in the ***single_page***
