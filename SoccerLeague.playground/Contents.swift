/**********************************************************************
 SOCCER LEAGUE
 Author: Walter Allen
 
 This project was created to satisfy the requirements of the
 Team TreeHouse iOS TechDegree - Project #1.
 
 It divides a hard-coded dictionary of team players into three equal
 teams, ensuring that each team has an equal number of players with
 expeience and an equal number of players without experience and that
 each team's average height is within 1.5 cm of the other teams'
 average heights.
 
 The program then creates Welcome Letters for each team and outputs
 those letters to the console.
 **********************************************************************/


/**********************************************************************
 CONSTANTS and GLOBAL VARIABLES
 **********************************************************************/
/* The following sixteen constants are [String : String] dictionaries,
 each representing one player with the following keys:
 "Name", "Height (inches)", "Soccer Experience", and "Guardian Name(s)".
 */
let player1 = ["Name": "Joe Smith", "Height (inches)": "42", "Soccer Experience": "YES", "Guardian Name(s)": "Jim and Jan Smith"]
let player2 = ["Name": "Jill Tanner", "Height (inches)": "36", "Soccer Experience": "YES", "Guardian Name(s)": "Clara Tanner"]
let player3 = ["Name": "Bill Bon", "Height (inches)": "43", "Soccer Experience": "YES", "Guardian Name(s)": "Sara and Jenny Bon"]
let player4 = ["Name": "Eva Gordon", "Height (inches)": "45", "Soccer Experience": "NO", "Guardian Name(s)": "Wendy and Mike Gordon"]
let player5 = ["Name": "Matt Gill", "Height (inches)": "40", "Soccer Experience": "NO", "Guardian Name(s)": "Charles and Sylvia Gill"]
let player6 = ["Name": "Kimmy Stein", "Height (inches)": "41", "Soccer Experience": "NO", "Guardian Name(s)": "Bill and Hillary Stein"]
let player7 = [ "Name": "Sammy Adams", "Height (inches)": "45", "Soccer Experience": "NO", "Guardian Name(s)": "Jeff Adams"]
let player8 = ["Name": "Karl Saygan", "Height (inches)": "42", "Soccer Experience": "YES", "Guardian Name(s)": "Heather Bledsoe"]
let player9 = ["Name": "Suzane Greenberg", "Height (inches)": "44", "Soccer Experience": "YES", "Guardian Name(s)": "Henrietta Dumas"]
let player10 = ["Name": "Sal Dali", "Height (inches)": "41", "Soccer Experience": "NO", "Guardian Name(s)": "Gala Dali"]
let player11 = ["Name": "Joe Kavalier", "Height (inches)": "39", "Soccer Experience": "NO", "Guardian Name(s)": "Sam and Elaine Kavalier"]
let player12 = ["Name": "Ben Finkelstein", "Height (inches)": "44", "Soccer Experience": "NO", "Guardian Name(s)": "Aaron and Jill Finkelstein"]
let player13 = ["Name": "Diego Soto", "Height (inches)": "41", "Soccer Experience": "YES", "Guardian Name(s)": "Robin and Sarika Soto"]
let player14 = ["Name": "Chloe Alaska", "Height (inches)": "47", "Soccer Experience": "NO", "Guardian Name(s)": "David and Jamie Alaska"]
let player15 = ["Name": "Arnold Willis", "Height (inches)": "43", "Soccer Experience": "NO", "Guardian Name(s)": "Claire Willis"]
let player16 = ["Name": "Phillip Helm", "Height (inches)": "44", "Soccer Experience": "YES", "Guardian Name(s)": "Thomas Helm and Eva Jones"]
let player17 = ["Name": "Les Clay", "Height (inches)": "42", "Soccer Experience": "YES", "Guardian Name(s)": "Wynonna Brown"]
let player18 = ["Name": "Herschel Krustofski", "Height (inches)": "45", "Soccer Experience": "YES", "Guardian Name(s)": "Hyman and Rachel Krustofski"]


// This constant is an array which stores the eighteen soccer player dictionaries.
let players = [player1, player2, player3, player4, player5, player6,
               player7, player8,player9, player10, player11, player12,
               player13, player14, player15, player16, player17, player18]


// Global variables that represent the the three teams that the players will be sorted into.
// It takes the form: Array<Dictionary<String, String>>.
var teamSharks: [[String: String]] = []
var teamDragons: [[String: String]] = []
var teamRaptors: [[String: String]] = []


// A global variable that represents the three disparate teams into a league.
// It takes the form: Array<Array<Dictionary<String, String>>>.
var leagueTeams = [teamSharks, teamDragons, teamRaptors]


/**********************************************************************
 HELPER FUNCTIONS
 ----------------
 These helper functions will be used in the primary script at the end of
 the file.
 **********************************************************************/

/* Returns a tuple of two arrays. Each array is a dictionary of players.
 * One dictionary represents players with experience, and the second
 * represents players without experience.
 */
func dividePlayersByExperienceLevels()
    -> (Array<Dictionary<String, String>>, Array<Dictionary<String, String>>) {
    var expPlayers: Array<Dictionary<String, String>> = []
    var inexpPlayers: Array<Dictionary<String, String>> = []
        
        for player in players {
            if player["Soccer Experience"] == "YES" {
                expPlayers.append(player)
            } else {
                inexpPlayers.append(player)
            }
        }
    return (expPlayers, inexpPlayers)
}

// TODO: Comment this function
func getTotalHeightsOfPlayersInInches(inArray players: Array<Dictionary<String, String>>) -> Int {
    var totalHeight = 0
    for player in players {
        let playerHeight = player["Height (inches)"] as! String
        totalHeight += Int(playerHeight)!
    }
    
    return totalHeight
}

// TODO: Comment this function
func hasEmptyTeams(in arrayOfTeams: Array<Array<Dictionary<String, String>>>) -> Bool {
    for team in leagueTeams {
        if team.count == 0 {
            return true
        }
    }
    
    return false
}

// TODO: Comment this function
func getNumPlayersOnSmallestTeam() -> Int {
    var minPlayers: Int = 0
    for team in leagueTeams {
        if minPlayers == 0 || team.count < minPlayers {
            minPlayers = team.count
        }
    }
    
    return minPlayers
}

// TODO: Comment this function
func getSum(ofDistributionKeys key: String,
            inArray arrayOfDicts: Array<Dictionary<String, String>>) -> Int {
    var sum = 0
    for dict in arrayOfDicts {
        sum += Int(dict[key]!)!
    }
    return sum
}

/*
 * Returns null.
 * Accepts an array of player dictionaries. Then, the function sorts those dictionaries
 * from high to low using the passed variable, distributionKey, which should
 * be a String representing a key in the player dictionary. Then, it
 * distributes the players evenly into the teams arrays in the global variable,
 * league, making sure that the average value for the distributionKey has
 * minimal variance across the teams.
 *
 * It operates using the following algorithm:
 * a) If no teams have been placed into the league, starting with the
 *    element with the greatest distributionKey value, place one
 *    element of the sorted array into each team in the league, where x
 *    is the number of teams in the league,
 * b) Calculate the total for all distributionKey values in the players array
 *    and all players already placed in teams in the league,
 * c) Divide the total by the number of teams in the league (dividedSum),
 * d) From the teams that have the fewest players, identify the team which
 *    has a sum of distributionKey values that is nearest to but less than the dividedsum,
 * e) Place the next player dictionary in the identified team, and
 * f) Repeat steps d & e until all players have been placed into league teams
 */
func distributePlayersIntoLeague(using players: Array<Dictionary<String, String>>,
                                 andDistributionKey distributionKey: String) -> () {
    var sortedPlayers = players.sorted{$0[distributionKey]! < $1[distributionKey]!}
    
    // If all teams are empty, place one player from the sorted arrage on each team
    if hasEmptyTeams(in: leagueTeams) {
        for index in leagueTeams.indices {
            if let newPlayer = sortedPlayers.popLast() {
                leagueTeams[index].append(newPlayer)
            }
        }
    }
    
    // Divide the total height of all players already in the league and those to be
    // sorted into the league by the number of teams
    var totalHeight = getTotalHeightsOfPlayersInInches(inArray: sortedPlayers)
    for team in leagueTeams {
        if team.count > 0 {
            totalHeight += getTotalHeightsOfPlayersInInches(inArray: team)
        }
    }
    let dividedSum = totalHeight / leagueTeams.count

    /* Choose only teams that have the fewest number of players, and identify the
     * team that has an average height that is farthest from the dividedSum
     */
    while sortedPlayers.count > 0 {
        let currentMinPlayersPerTeam = getNumPlayersOnSmallestTeam()
        
        var targetDifference: Int = 0
        var targetTeamIndex = 0
        for team in leagueTeams {
            if team.count == currentMinPlayersPerTeam {
                let teamKeySum = getSum(ofDistributionKeys: "Height (inches)",
                                        inArray: team)
                let difference = abs(teamKeySum - dividedSum)
                if targetDifference == 0 || difference < targetDifference {
                    targetDifference = difference
                    targetTeamIndex = leagueTeams.index(of: team)!
                }
            }
        }
        
        // Pop the next player from the sorted team and add him or her to the team
        // that was identified in the last step
        if let nextPlayer = sortedPlayers.popLast() {
            leagueTeams[targetTeamIndex].append(nextPlayer)
        }
    }
}

// TODO: Comment this function
func getAverageHeightForPlayers(onTeam team: Array<Dictionary<String, String>>) -> Double {
    var sum: Double = 0.0
    for player in team {
        sum += Double(player["Height (inches)"]!)!
    }
    
    return sum / Double(team.count)
}

/* Returns null. Iterates through an array of dictionaries, which each represent
 * a soccer player, and prints each player in the array as a string in the
 * following format: PlayerName (HasExperience) - Height
*/
func printPlayersToConsole(forTeam team: Array<Dictionary<String, String>>) -> () {
    for player in team {
        player
        let name = player["Name"] as! String
        let height = player["Height (inches)"] as! String
        let experience = player["Soccer Experience"]
        let expMarker = experience == "YES" ? "Y" : "N"
        print("\(name) (\(expMarker)) - \(height)\"")
    }
}

// TODO: Complete this function
func printTeamsToConsole(forTeams teams: Array<Array<Dictionary<String, String>>>) -> () {
    for team in teams {
        let averageHeight = getAverageHeightForPlayers(onTeam: team)
        // TODO: Print average height to 1st significant digit
        print("Team #\(teams.index(of: team)!) (Avg Height: \(averageHeight)\")")
        print("----------------------------")
        printPlayersToConsole(forTeam: team)
        print()
    }
}

// TODO: Implement this function
func createLetters(forMembersOfTeams teams: Array<Array<Dictionary<String, String>>>) -> Array<String> {
    return []
}

// TODO: Implement this function
func printLettersToConsole(using letters: Array<String>) -> () {
    
}


/**********************************************************************
 MAIN SCRIPT
 -----------
 The following code executes helper functions and are the
 primary control structure of this program. Ultimately, the script will
 
 - separate the teams into two groups (experienced and inexperienced),
 
 - disperse the teams into the three teams of the league, ensuring that
   the average heights of each team are within 1.5 inches of each other,
 
 - print the rosters of each team along with each team's average height
   to the console,
 
 - compose a letter to each guardian that informs them what team their
   child is on and when and where their child's first practice is, and
 
 - prints those letters to the console.
 **********************************************************************/
let (experiencedPlayers, inexperiencedPlayers) = dividePlayersByExperienceLevels()
distributePlayersIntoLeague(using: experiencedPlayers,
                            andDistributionKey: "Height (inches)")
distributePlayersIntoLeague(using: inexperiencedPlayers,
                            andDistributionKey: "Height (inches)")
printTeamsToConsole(forTeams: leagueTeams)

let letters = createLetters(forMembersOfTeams: leagueTeams)
printLettersToConsole(using: letters)
