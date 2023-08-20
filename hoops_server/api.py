from nba_api.stats.endpoints import leaguestandings
from nba_api.stats.static.players import get_active_players

def getStandings():

    data = leaguestandings.LeagueStandings(
        season=2022
    )

    data.get_data_frames()[0]

    data = data.get_dict()

    standings = data['resultSets'][0]['rowSet']

    return standings

def getStandingsInfo():
    result = []

    standings = getStandings()

    teamIdIndex = 2
    teamCityIndex = 3
    teamNameIndex = 4
    confRankIndex = 7
    teamRecordIndex = 16

    for team in standings:
        currentTeam = {
            "teamId": team[teamIdIndex],
            "teamCity": team[teamCityIndex],
            "teamName": team[teamNameIndex],
            "confRank": team[confRankIndex],
            "teamRecord": team[teamRecordIndex]
        }
        result.append(currentTeam)

    return result

players = get_active_players()

for player in players:
    print(player['full_name'])




    


