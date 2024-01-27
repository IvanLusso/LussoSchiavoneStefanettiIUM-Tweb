> #### Info:
> There are various important **hashtag**:
> - #JPA $\rightarrow$ The route will probably redirect to the **JPA** server, to query the **PostgreSQL** database
> - #EXPRESS $\rightarrow$ The route will probably redirect to the **EXPRESS** server, to query the **MongoDB** database
> - #GENERAL_ROUTE  $\rightarrow$ The route will be probably called by many sheets, so it has a general path *(This could be changed)*
> - #LOADING_PAGE_ROUTE $\rightarrow$ The route is used to load the initial page of a sheet, so it could be called by the **NAVBAR menu buttons**
> - #get and #post $\rightarrow$ They will be used to **suggest** a way to proceed in the route construction process

---
# /home
- [x] `games/get_last_games` - #JPA $\rightarrow$ This #get will retrieve the last 15/20 games. For this, we can set a **query string** to order the tuples by their `game_date`.
	> **HYD**: **@Response**: `game_date`, `competition_id`, 2 `club_name`, 2 `own_goal`, `club_img`

- [x] `clubs/get_recent_clubs_news` - #JPA $\rightarrow$ It is a #get to retrieve last clubs in base of last `game_date`.
> **HYD**:
> - **@Param**: `None`
> - **@Response**: `club_id`, `club_name` *(And `club_img` which does not exist for us)*
- [ ] `home/get_trend_players` - #JPA & #EXPRESS  $\rightarrow$ It could be one of this 3:
	- Top $N$ players by last appearances and their goals number (filter by last $N$ games)
	- Last $N$ player **valuations** ordered by **top value**
	- $WIP$
#### Clickable Routes:
- [ ] `games/get_game_by_id` - #JPA $\rightarrow$ This is a #get to retrieve the game by the **id** *(int)* passed as *@RequestParam* ( #GENERAL_ROUTE)
- [ ] `clubs/get_club_by_id` - #JPA  $\rightarrow$ This is a #get to retrieve the club by the **id** *(int)* passed as *@RequestParam* ( #GENERAL_ROUTE)
- [ ] `players/get_player_by_id` - #JPA  $\rightarrow$ This is a #get to retrieve the player by the **id** *(int)* passed as *@RequestParam* ( #GENERAL_ROUTE)

---
# /competitions
- [ ] `flags/get_nations` - #EXPRESS $\rightarrow$ It is a #get which retrieves **country images** and **names** from the custom model on Mongo: 
> **HYD**: **@Response**: `flag_url`, `country_name` and `domestic_league_code` ( #LOADING_PAGE_ROUTE, #GENERAL_ROUTE )
- [ ] `competitions/get_national_competition` - #EXPRESS $\rightarrow$ It is a #get which requires a `domestic_league_code` as a *@RequestParam* and retrieves **all the competitions** with that value
> **HYD**:
> - **@Param**: `domestic_league_code`: 
> 	 - can be `NULL` to retrieve ***International*** ( #LOADING_PAGE_ROUTE)
> 	 - can be `GB1` to retrieve ***England*** ( #LOADING_PAGE_ROUTE)
>  -  info to gain are: `competition_id`, `competition_name`. Also the `image` if **@Param** is `NULL`
- [ ] `?/get_games_of_league` - #JPA $\rightarrow$ This route has to retrieve **names** and **ids** of the given domestic competitions. *(when an accordion is clicked)*
> **HYD**: 
> - **@Param**: `competition_id`
> - **@Response**:   `game_id`, `game_date`, 2 `club_name`, 2 `own_goal`
- [x] `games/get_game_by_id` - #JPA $\rightarrow$ ( #GENERAL_ROUTE)
- [ ] `competitions/get_competition_by_id` - #EXPRESS $\rightarrow$ This is a #get to retrieve the competition by the **id** *(string)* passed as *@RequestParam* ( #GENERAL_ROUTE)
#### Search bars:
- [ ] `games/query_games_by_name` - #JPA $\rightarrow$ It gets **1** **string** name as argument to search and display all the games in which a club with matching name has played *(we will show games grouped by league accordions)*  ( #GENERAL_ROUTE)
- [ ] `games/query_games_by_double_name` - #JPA $\rightarrow$ It gets **2** **string** names as argument to search and display all the games between these two clubs. *(we will show games grouped by league accordions)*  ( #GENERAL_ROUTE)
- [ ] `games/query_games_by_date` - #JPA $\rightarrow$ It gets a **date** *(or a **string** with a date in it)* as parameter and it returns a list of games (could be empty, so make sure to check it as an `Optional<>`) ( #GENERAL_ROUTE)

---
# /clubs
- [ ] `flags/get_nations` - #EXPRESS $\rightarrow$ ( #LOADING_PAGE_ROUTE, #GENERAL_ROUTE)
- [ ] `clubs/get_clubs_by_nation` - #JPA $\rightarrow$ This route requires a **string** type as *@RequestParam* and retrieves the tuples that match the `<LOCAL_COMPETITION_CODE>` argument.
> **HYD**: **@Response**: `club_id`, `club_name` 
- [ ] `clubs/query_clubs_by_name` - #JPA  $\rightarrow$ This route requires a **string** type as *@RequestParam*, to query the tuples that match the `club_name` given
> HYD: 
> - **@Param**: `club_name`
> - **@Response**: `club_id`, `club_name`, `local_competition_code`
- [ ] `clubs/get_club_by_id` - #JPA $\rightarrow$ ( #GENERAL_ROUTE)

---
# /players
- [ ] `players/get_date_weeks` - #EXPRESS $\rightarrow$ This #get will retrieve the `date_week` values from the ***player_valuations table*** to display them as **accordions titles** ( #LOADING_PAGE_ROUTE)
- [x] `players/get_players_by_nation` - #JPA $\rightarrow$ This route requires a **string** type as *@RequestParam*. The tuples will be returned and ordered by `country_of_citizenship`.
> **HYD**: 
> - **@Params**: `country_of_citizenship`
 > - **@Response**: `player_id`, `last_name`, `player_name`, `image_url`
- [ ] `players/get_players_by_valuation` - #EXPRESS $\rightarrow$ This #get retrieves all values of **player_valutation**, to sort the player list. 
> **HYD**: 
> - **@Response**: player_id, date, player_valuation
- [ ] `players/get_player_names` - #JPA $\rightarrow$ WIP ... 
> **HYD**:
> - **@Params**: A **LIST** of `player_id`
> - @Response: A LIST of tuples: (`player_id`, `player_name`)
- [x] `players/get_player_by_id` - #JPA $\rightarrow$ ( #GENERAL_ROUTE)
#### Search Bar:
- [ ] `players/query_players_by_name` - #JPA $\rightarrow$ This #get requires a *@RequestParam* of **string** type *(with `length > 1`)*. The tuples will be returned and ordered by `last_name`. 
> **HYD**:
> - **@Param**: a string to compare with `player_name` 
> - **@Response**: `player_id`, `last_name`, `player_name` and `image_url`

---
# /single_page
- [ ] `single_club/get_club` - #JPA $\rightarrow$ It gets a parameter *(**int**)* as argument for the #get and loads the **club info** in the ***single_page***
- [ ] `single_club/get_game` - #JPA $\rightarrow$ It gets a parameter *(**int**)* as argument for the #get and loads the **game info** in the ***single_page***
- [ ] `single_club/get_competition` - #EXPRESS $\rightarrow$ It gets a parameter *(**string**)* as argument for the #get and loads the **competition info** in the ***single_page***. It also call `single_club/get_games_by_competition` to get the values of `games`
- [ ] `single_club/get_games_by_competition` - #JPA $\rightarrow$ It gets games info in base of the argument passed, which has to be a `<COMPETITION_ID>`
- [ ] `single_club/get_games_by_club` - #JPA $\rightarrow$ It gets games info in base of the argument passed, which has to be a `<CLUB_ID>`
- [ ] `single_club/get_player` #JPA $\rightarrow$ It gets a parameter *(**int**)* as argument for the #get and loads the **player info** in the ***single_page***
