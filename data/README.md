[6213_games.csv](https://github.com/AdamStelmaszczyk/ranking/blob/master/data/6213_games.csv) and [179_games.csv](https://github.com/AdamStelmaszczyk/ranking/blob/master/data/179_games.csv) files contain outcomes of real table football games that took place in years 2014 - 2017. Intersection between set of players from 6213_games and set of players from 179_games is only one person.

Most of the games were 2 vs 2, some of them 2 vs 1 and 1 vs 1.

Columns descriptions:

1. `game_id` - integer from [1; 6213] uniquely identifying a game.
2. `player_a_id` - integer, ID of the first player A from the winners team AB.
3. `player_b_id` - integer or NULL, ID of the second player B, if exists (otherwise NULL) from the winners team AB.
4. `player_c_id` - integer, ID of the first player C from the losers team CD.
5. `player_d_id` - integer or NULL, ID of the second player D, if exists (otherwise NULL) from the losers team CD.
6. `team_ab_goals` - integer number of winners team's goals. Always 10.
7. `team_cd_goals` - integer number of losers team's goals. From [0; 9].
8. `entry_time_in_edt` - EDT (Eastern Daylight Time) at which the game was inserted into a database (which is usually a couple of seconds/minutes after the game ends), `%Y-%m-%d %H:%M:%S` [format](http://strftime.org).
