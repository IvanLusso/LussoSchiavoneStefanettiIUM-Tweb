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

- [ ] `players/get_trend_players` - #JPA & #EXPRESS  $\rightarrow$ It could be one of this 3:
	- Last (in ***date***) $N$ player **valuations** ordered by **top value**
	- [ ] `player_valuations/get_last_players_by_valuations` - #EXPRESS $\rightarrow$ made as:
	> - **@Param**: `None`
	> - **@Response**: A **LIST** with `player_id` and `player_valutation`
	- [x] `players/get_players_by_ids` - #JPA $\rightarrow$ #get or #post made as:
	  > - **@Param**: A **LIST** of `player_id`
	  > -	**@Response**: A **LIST** of tuples with `player_name`, `player_id`, `image_url` 
#### Clickable Routes:
- [x] `games/get_game_by_id` - #JPA $\rightarrow$ This is a #get to retrieve the game by the **id** *(long int)* passed as *@RequestParam* ( #GENERAL_ROUTE)
- [x] `clubs/get_club_by_id` - #JPA  $\rightarrow$ This is a #get to retrieve the club by the **id** *(long int)* passed as *@RequestParam* ( #GENERAL_ROUTE)
- [x] `players/get_player_by_id` - #JPA  $\rightarrow$ This is a #get to retrieve the player by the **id** *(long int)* passed as *@RequestParam* ( #GENERAL_ROUTE)

---
# /competitions
- [x] `flags/get_all` - #EXPRESS $\rightarrow$ It is a #get which retrieves all dataset from the custom model on Mongo: 
> **HYD**: **@Response**: `flag_url`, `country_name` and `domestic_league_code` ( #LOADING_PAGE_ROUTE, #GENERAL_ROUTE )

- [x] `competitions/get_national_competitions` - #EXPRESS $\rightarrow$ It is a #get which requires a `domestic_league_code` as a *@RequestParam* and retrieves **all the competitions** with that value. *(Also used in Competition/National accordions menu)*
> **HYD**:
> - **@Param**: `domestic_league_code`: 
> 	 - can be `NULL` to retrieve ***International*** ( #LOADING_PAGE_ROUTE)
> 	 - can be `GB1` to retrieve ***England*** ( #LOADING_PAGE_ROUTE)
>  -  **@Response**: info to gain are: `competition_id`, `competition_name` and `image_url`
>  $\textcolor{red}{image\ url\ is\ missing}$

- [x] `games/get_games_of_league` - #JPA $\rightarrow$ This route has to retrieve **names** and **ids** of the given domestic competitions. *(when an accordion is clicked)*
> **HYD**: 
> - **@Param**: `competition_id`
> - **@Response**:   `game_id`, `game_date`, 2 `club_name`, 2 `own_goal`

- [x] `games/get_game_by_id` - #JPA $\rightarrow$ ( #GENERAL_ROUTE)
- [x] `competitions/get_competition_by_id` - #EXPRESS $\rightarrow$ This is a #get to retrieve the competition by the **id** *(string)* passed as *@RequestParam* ( #GENERAL_ROUTE)
#### Search bars:
- [x] `games/query_games_by_name` - #JPA $\rightarrow$ It gets **1** **string** name as argument to search and display all the games in which a club with matching name has played *(we will show games grouped by league accordions)*  ( #GENERAL_ROUTE)
> **HYD**:
>  - **@Response**: `game_id`, `game_date`, `competition_id`, 2 `club_name`, 2 `own_goals` 

- [x] `games/query_games_by_double_name` - #JPA $\rightarrow$ It gets **2** **string** names as argument to search and display all the games between these two clubs. *(we will show games grouped by league accordions)*  ( #GENERAL_ROUTE)
> **HYD**:
>  - **@Response**: `game_id`, `game_date`, `competition_id`, 2 `club_name`, 2 `own_goals` 

- [x] `games/query_games_by_date` - #JPA $\rightarrow$ It gets a **date** *(or a **string** with a date in it)* as parameter and it returns a list of games ( #GENERAL_ROUTE)
> **HYD**:
>  - **@Response**: `game_id`, `game_date`, `competition_id`, 2 `club_name`, 2 `own_goals` 

---
# /clubs
- [x] `flags/get_all` - #EXPRESS $\rightarrow$ ( #LOADING_PAGE_ROUTE, #GENERAL_ROUTE)
- [x] `clubs/clubs_by_nation` - #JPA $\rightarrow$ This route requires a **string** type as *@RequestParam* and retrieves the tuples that match the `<LOCAL_COMPETITION_CODE>` argument.
> **HYD**: **@Response**: `club_id`, `club_name` 

- [x] `clubs/clubs_by_string` - #JPA  $\rightarrow$ This route requires a **string** type as *@RequestParam*, to query the tuples that match the `club_name` given
> **HYD**: 
> - **@Param**: `club_name`
> - **@Response**: A **LIST** of `club_id`, `club_name`, `local_competition_code`

- [x] `clubs/get_club_by_id` - #JPA $\rightarrow$ ( #GENERAL_ROUTE)

---
# /players
- [x] `players/get_player_by_id` - #JPA $\rightarrow$ ( #GENERAL_ROUTE)
#### Search Bar:
- [x] `players/get_players_by_name` - #JPA $\rightarrow$ This #get requires a *@RequestParam* of **string** type *(with `length > 1`)*. The tuples will be returned and ordered by `last_name`. 
> **HYD**:
> - **@Param**: a string to compare with `player_name` 
> - **@Response**: A **LIST** of `player_id`, `player_name`, `image_url`

---
# /single_page
- [x] `clubs/get_club_by_id` - #JPA $\rightarrow$ ( #GENERAL_ROUTE )
- [x] `competitions/get_competitions_by_id` - #EXPRESS $\rightarrow$ ( #GENERAL_ROUTE )
- [x] `players/get_player_by_id` - #JPA  $\rightarrow$ ( #GENERAL_ROUTE )
- [x] `games/get_game_by_id` - #JPA  $\rightarrow$ ( #GENERAL_ROUTE )
- [x] `games/get_games_by_competition_id` - #JPA $\rightarrow$ It gets games info in base of the argument passed, which has to be a `<COMPETITION_ID>`
> **HYD**:
> - **@Param**: `competition_id` and `season` 
> - **@Response**: `game_id`, `game_date`, `competition_id`, 2 `club_name`, 2 `own_goals` 
- [x] `games/get_games_by_club_id` - #JPA $\rightarrow$ It gets games info in base of the argument passed, which has to be a `<CLUB_ID>`
> **HYD**:
> - **@Param**: `club_id` and `season` 
> - **@Response**: `game_id`, `game_date`, `competition_id`, 2 `club_name`, 2 `own_goals` 

- [ ] `clubs/get_club_competitions` - #JPA and #EXPRESS $\rightarrow$ It gets `club_id` as input and joins with **club_games** to find the `game_ids`. Therefore, it retrieves `competition_id` and `season` from **games**.
> **HYD**:
> - **@Param**: `club_id`
> - process: 
> 	1.  - [x]  Name `club/get_club_competitions_id`. #JPA receive the `club_id` and return a LIST of `competition_id`
> 	2. - [x] Name: `competitions/get_competitions_by_ids`. #EXPRESS receive a LIST of `competition_id` and return a list of tuple with `competition_id`, `competition_name` and `img_url`
> - **@Response**: A **LIST** of `competition_id`, `competition_name` and `img_url`

- [x] `players/query_player_names_by_ids` - #JPA $\rightarrow$ (Used in **singlePage/game** to see players name in different contexts). As follow:
> **HYD**:
> - **@Params**: A **LIST** of `player_id`
> - @Response: A **LIST** of tuples: (`player_id`, `player_name`)
