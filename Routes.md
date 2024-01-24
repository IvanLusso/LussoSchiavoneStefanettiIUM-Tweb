> #### Info:
> There are various important **hashtag**:
> - #JPA $\rightarrow$ The route will probably redirect to the **JPA** server, to query the **PostrgreSQL** database
> - #EXPRESS $\rightarrow$ The route will probably redirect to the **EXPRESS** server, to query the **MongoDB** database
> - #GENERAL_ROUTE  $\rightarrow$ The route will be probably called by many sheets, so it has a general path *(This could be changed)*
> - #LOADING_PAGE_ROUTE $\rightarrow$ The route is used to load the initial page of a sheet, so it could be called by the **NAVBAR menu buttons**
> - #get and #post $\rightarrow$ They will be used to **suggest** a way to proceed in the route construction process

---
# /home
- [ ] `home/get_last_games` - #JPA $\rightarrow$ This #get will retrieve the last 20/25 games. For this, we can set a **query string** to order the tuples by their `game_date`
	> HYD: info to gain: `game_date`, `competition_id`, 2 `club_name`, 2 `own_goal`, `club_img`.

- [ ] `home/get_recent_clubs_news`
- [ ] `home/get_trend_players`
#### Clickable Routes:
- [ ] `general/get_game_by_id` - #JPA $\rightarrow$ This is a #get to retrieve the game by the **id** *(int)* passed as *@RequestParam* ( #GENERAL_ROUTE)
- [ ] `general/get_club_by_id` - #JPA  $\rightarrow$ This is a #get to retrieve the game by the **id** *(int)* passed as *@RequestParam* ( #GENERAL_ROUTE)
- [ ] `general/get_player_by_id` - #JPA  $\rightarrow$ WIP

---
# /competitions
- [ ] `competitions/get_competitions` - #EXPRESS $\rightarrow$ It gets all the data we want to show the different subsets of *competitions*: `competition_id`, `domestic_league_code` are **required** ( #LOADING_PAGE_ROUTE)
- [ ] `competitions/get_national_flags` - #EXPRESS $\rightarrow$ It is **ONE** `get` (or `post`) which gets country images and names from the custom model on Mongo: `flag_url`, `country_name` and `domestic_league_code` ( #LOADING_PAGE_ROUTE)
- [ ] `competitions/get_national_competition` - #EXPRESS $\rightarrow$ It is a #get which requires a `domestic_league_code` as a *@RequestParam* and retrieves **all the competitions** with that value
- [ ] `competitions/get_games_of_league` - #JPA $\rightarrow$ This route has to retrieve **names** and **ids** of the local competitions. For this reason, it will ask for the `competition_name` and  the `competition_id` with the `domestic_league_code` matching to the one passed as argument  
- [ ] `general/get_game_by_id` - #JPA $\rightarrow$ ( #GENERAL_ROUTE)
#### Search bars:
- [ ] `competitions/query_games_by_name` - #JPA $\rightarrow$ It gets a **string** name as argument to search and display all the games in which a club with matching name has played *(we will show games grouped by league accordions)*
- [ ] `competitions/query_games_by_double_name` - #JPA $\rightarrow$ It gets **TWO** **string** names as argument to search and display all the games between these two clubs. *(we will show games grouped by league accordions)*
- [ ] `competitions/query_games_by_date` - #JPA $\rightarrow$ It gets a **date** *(or a **string** with a date in it)* as parameter and it returns a list of games (could be empty, so make sure to check it as an `Optional<>`)

---
# /clubs
- [ ] `competitions/query_clubs_by_nation` - #JPA $\rightarrow$ This route requires a *@RequestParam* of **string** type, to query the tuples that match the `<LOCAL_COMPETITION_CODE>` argument.
- [ ] `clubs/query_clubs_by_name` - #JPA  $\rightarrow$ This route requires a *@RequestParam* of **string** type to query the tuples that match the `club_name` given
- [ ] `clubs/get_club_by_id` - #JPA $\rightarrow$ ( #GENERAL_ROUTE)

---
# /players
- [ ] `players/query_player_by_name` - #JPA $\rightarrow$ This #get requires a *@RequestParam* of **string** type *(with `length > 1`)*. The tuples will be returned and ordered by `last_name`. We want to get these values: `player_id`, `last_name`, `player_name` and `image_url`
- [ ] `players/query_players_by_nation` - #JPA $\rightarrow$ This route requires a *@RequestParam* of **string** type. The tuples will be returned and ordered by `country_of_citizenship`. We want to get these values: `player_id`, `last_name`, `player_name`, `country_of_citizenship`, `image_url`
- [ ]  `players/query_player_by_club` - #JPA $\rightarrow$ This #get requires a *@RequestParam*$ of **long int** type. The tuples will be returned and ordered by `current_club_id`. 
- [ ] `players/query_players_by_club/query_name` - #JPA $\rightarrow$ This #get requires a *@RequestParam* of type **DICT**. The format of the dict accepted will be `{club: '<long_int_value>', 'name': '<string>'}`
 - [ ] `players/query_playes_valuations` - #EXPRESS $\rightarrow$ This #get will need a requires a *@RequestParam* of **date** type, to sort players by the **last player valuation date** *(We could eventually add the possibility to sort them by decreasing value)*
 - [ ] `players/get_player_by_id` - #JPA $\rightarrow$ This #get will redirect the user to the ***single_page***, loading info about the given `player_id`

---
# /single_page
- [ ] `single_club/get_club` - #JPA $\rightarrow$ It gets a parameter *(**int**)* as argument for the #get and loads the **club info** in the ***single_page***
- [ ] `single_club/get_game` - #JPA $\rightarrow$ It gets a parameter *(**int**)* as argument for the #get and loads the **game info** in the ***single_page***
- [ ] `single_club/get_competition` - #EXPRESS $\rightarrow$ It gets a parameter *(**string**)* as argument for the #get and loads the **competition info** in the ***single_page***. It also call `single_club/get_games_by_competition` to get the values of `games`
- [ ] `single_club/get_games_by_competition` - #JPA $\rightarrow$ It gets games info in base of the argument passed, which has to be a `<COMPETITION_ID>`
- [ ] `single_club/get_games_by_club` - #JPA $\rightarrow$ It gets games info in base of the argument passed, which has to be a `<CLUB_ID>`
- [ ] `single_club/get_player` #JPA $\rightarrow$ It gets a parameter *(**int**)* as argument for the #get and loads the **player info** in the ***single_page***
