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
- 

---
# /single_page
- 

