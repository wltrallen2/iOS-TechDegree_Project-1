/**********************************************************************
 SOCCER LEAGUE
 Author: Walter Allen
 
 This project was created to satisfy the requirements of the
 Team TreeHouse iOS TechDegree - Project #1.
 
 It divides a hard-coded dictionary of team players into three equal
 teams, ensuring that each team has an equal number of players with
 expeience and an equal number of players without experience and that
 each team's average height is within 1.5 inches of the other teams'
 average heights.
 
 The program then creates Welcome Letters for each team and outputs
 those letters to the console.
 **********************************************************************/


import Foundation


/**********************************************************************
 CONSTANTS and GLOBAL VARIABLES
 **********************************************************************/
/* The following sixteen constants are of type Dictionary<String, Any>,
 each representing one player with the following keys:
 "name", "heightInInches", "hasExperience", and "guardianNames".
 */
let player1: [String: Any] = ["name": "Joe Smith",
                              "heightInInches": 42,
                              "hasExperience": true,
                              "guardianNames": "Jim and Jan Smith"]
let player2: [String: Any]  = ["name": "Jill Tanner",
                               "heightInInches": 36,
                               "hasExperience": true,
                               "guardianNames": "Clara Tanner"]
let player3: [String: Any]  = ["name": "Bill Bon",
                               "heightInInches": 43,
                               "hasExperience": true,
                               "guardianNames": "Sara and Jenny Bon"]
let player4: [String: Any]  = ["name": "Eva Gordon",
                               "heightInInches": 45,
                               "hasExperience": false,
                               "guardianNames": "Wendy and Mike Gordon"]
let player5: [String: Any]  = ["name": "Matt Gill",
                               "heightInInches": 40,
                               "hasExperience": false,
                               "guardianNames": "Charles and Sylvia Gill"]
let player6: [String: Any]  = ["name": "Kimmy Stein",
                               "heightInInches": 41,
                               "hasExperience": false,
                               "guardianNames": "Bill and Hillary Stein"]
let player7: [String: Any]  = [ "name": "Sammy Adams",
                                "heightInInches": 45,
                                "hasExperience": false,
                                "guardianNames": "Jeff Adams"]
let player8: [String: Any]  = ["name": "Karl Saygan",
                               "heightInInches": 42,
                               "hasExperience": true,
                               "guardianNames": "Heather Bledsoe"]
let player9: [String: Any]  = ["name": "Suzane Greenberg",
                               "heightInInches": 44,
                               "hasExperience": true,
                               "guardianNames": "Henrietta Dumas"]
let player10: [String: Any]  = ["name": "Sal Dali",
                                "heightInInches": 41,
                                "hasExperience": false,
                                "guardianNames": "Gala Dali"]
let player11: [String: Any]  = ["name": "Joe Kavalier",
                                "heightInInches": 39,
                                "hasExperience": false,
                                "guardianNames": "Sam and Elaine Kavalier"]
let player12: [String: Any]  = ["name": "Ben Finkelstein",
                                "heightInInches": 44,
                                "hasExperience": false,
                                "guardianNames": "Aaron and Jill Finkelstein"]
let player13: [String: Any]  = ["name": "Diego Soto",
                                "heightInInches": 41,
                                "hasExperience": true,
                                "guardianNames": "Robin and Sarika Soto"]
let player14: [String: Any]  = ["name": "Chloe Alaska",
                                "heightInInches": 47,
                                "hasExperience": false,
                                "guardianNames": "David and Jamie Alaska"]
let player15: [String: Any]  = ["name": "Arnold Willis",
                                "heightInInches": 43,
                                "hasExperience": false,
                                "guardianNames": "Claire Willis"]
let player16: [String: Any]  = ["name": "Phillip Helm",
                                "heightInInches": 44,
                                "hasExperience": true,
                                "guardianNames": "Thomas Helm and Eva Jones"]
let player17: [String: Any]  = ["name": "Les Clay",
                                "heightInInches": 42,
                                "hasExperience": true,
                                "guardianNames": "Wynonna Brown"]
let player18: [String: Any]  = ["name": "Herschel Krustofski",
                                "heightInInches": 45,
                                "hasExperience": true,
                                "guardianNames": "Hyman and Rachel Krustofski"]


// This constant is an array which stores the eighteen soccer player dictionaries.
let players = [player1, player2, player3, player4, player5, player6,
               player7, player8,player9, player10, player11, player12,
               player13, player14, player15, player16, player17, player18]


// Global variables that represent the the three teams that the players will be sorted into.
// It takes the form: Array<Dictionary<String, Any>>.
var teamDragons: [[String: Any]] = []
var teamSharks: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []


/**********************************************************************
 HELPER FUNCTIONS
 ----------------
 These helper functions are called in the primary script at the end of
 the file or by other helper functions. The functions are listed for
 reference as follows:
 
 - dividePlayersByExperienceLevels()
 - getTotalHeightsOfPlayersInInches(inArray:)
 - hasEmptyTeams(in:)
 - getNumPlayersOnSmallestTeam(in:)
 - getSum(ofDistributionKeys:)
 - add(:, toTeamAtIndex:)
 - distribute(players:, intoTeams:, usingDistributionKey:)
 - getAverageHeightForPlayers(onTeam:)
 - printPlayersToConsole(forTeam:)
 - formatHeight(:)
 - getTeamName(forTeam:)
 - getFirstPracticeTime(forTeam:)
 - printTeamsToConsole(forTeams:)
 - createLetters(forMembersOfTeams:)
 - printLettersToConsole(using:)
 **********************************************************************/

/* Returns a tuple of two arrays. Each array is a dictionary of players.
 * One dictionary represents players with experience, and the second
 * represents players without experience.
 */
func dividePlayersByExperienceLevels()
    -> (Array<Dictionary<String, Any>>, Array<Dictionary<String, Any>>) {
    var expPlayers: Array<Dictionary<String, Any>> = []
    var inexpPlayers: Array<Dictionary<String, Any>> = []
        
    for player in players {
        if player["hasExperience"] != nil && player["hasExperience"] as! Bool {
            expPlayers.append(player)
        } else {
            inexpPlayers.append(player)
        }
    }
    return (expPlayers, inexpPlayers)
}

/* Returns an Int that represents the sum of all heights, in inches, for each of the
 * players in the passed array of player dictionaries.
 */
func getTotalHeightsOfPlayersInInches(inArray players: Array<Dictionary<String, Any>>) -> Int {
    var totalHeight = 0
    for player in players {
        let playerHeight = player["heightInInches"] as! Int
        totalHeight += playerHeight
    }
    
    return totalHeight
}

/* Returns a Bool representing whether or not the array of team dictionaries
 * is empty.
 */
func hasEmptyTeams(in arrayOfTeams: Dictionary<String, Array<Dictionary<String, Any>>>) -> Bool {
    for (_, players) in arrayOfTeams {
        if players.count == 0 {
            return true
        }
    }
    
    return false
}

// Returns an Int representing the number of players on the team with the fewest players.
func getNumPlayersOnSmallestTeam(in arrayOfTeams:
    Dictionary<String, Array<Dictionary<String, Any>>>) -> Int {
    var minPlayers: Int = 0
    for (_, team) in arrayOfTeams {
        if team.count < minPlayers || minPlayers == 0 {
            minPlayers = team.count
        }
    }
    
    return minPlayers
}

/* Returns an Int representing the sum of values for the passed key in the passed array.
 * Returns zero (0) if the values are not able to be cast to Ints.
 */
func getSum(ofDistributionKeys key: String,
            inArray arrayOfDicts: Array<Dictionary<String, Any>>) -> Int {
    var sum = 0
    for dict in arrayOfDicts {
        sum += dict[key] as! Int
    }
    return sum
}

/* Returns an dictionary of team arrays by adding a new player dictionary
 * to the team array identified by the value of the passed String "teamName."
 */
func add(_ newPlayer: Dictionary<String, Any>,
         toTeamWithName teamName: String) -> Dictionary<String, Array<Dictionary<String, Any>>> {
            if teamName == "Dragons" {
                teamDragons.append(newPlayer)
            } else if teamName == "Sharks" {
                teamSharks.append(newPlayer)
            } else {
                teamRaptors.append(newPlayer)
            }
            
    
            return ["Dragons": teamDragons,
                    "Sharks": teamSharks,
                    "Raptors": teamRaptors]
}

/*
 * Returns a dictionary of teams, where the keys are the team names and the values
 * are dictionaries for each player on the team.
 *
 * Accepts an array of player dictionaries. Then, the function sorts those dictionaries
 * from high to low using the passed variable, distributionKey, which should
 * be a String representing a key in the player dictionary. Then, it
 * distributes the players evenly into the teams, making sure that the
 * average value for the distributionKey has minimal variance across the teams.
 *
 * It operates using the following algorithm:
 * a) If no teams have been placed into the league, starting with the
 *    element with the greatest distributionKey value, place one
 *    element of the sorted array into each team in the league, where x
 *    is the number of teams in the league,
 * b) Calculate the total for all distributionKey values in the players array
 *    and all players already placed in teams in the league,
 * c) Divide the total by the number of teams in the league (dividedSum),
 * d) From the teams that have the fewest players, identify the team which has
 *    a sum of distributionKey values that is nearest to but less than the dividedsum,
 * e) Place the next player dictionary in the identified team, and
 * f) Repeat steps d & e until all players have been placed into league teams
 */
func distribute(players: Array<Dictionary<String, Any>>,
                intoTeams teams: Dictionary<String, Array<Dictionary<String, Any>>>,
                usingDistributionKey distributionKey: String)
                    -> Dictionary<String, Array<Dictionary<String, Any>>> {
    var sortedPlayers = players.sorted{($0[distributionKey] as! Int) <
                                       ($1[distributionKey] as! Int)}
    var leagueTeams = teams
    
    // If all teams are empty, place one player from the sorted array on each team
    if hasEmptyTeams(in: leagueTeams) {
        for (teamName, _) in leagueTeams {
            if let newPlayer = sortedPlayers.popLast() {
                leagueTeams = add(newPlayer, toTeamWithName: teamName)
            }
        }
    }
    
    // Divide the total height of all players already in the league and those to be
    // sorted into the league by the number of teams
    var totalHeight = getTotalHeightsOfPlayersInInches(inArray: sortedPlayers)
    for (_, players) in leagueTeams {
        if players.count > 0 {
            totalHeight += getTotalHeightsOfPlayersInInches(inArray: players)
        }
    }
    let dividedSum = totalHeight / leagueTeams.count

    /* Choose only teams that have the fewest number of players, and identify the
     * team that has an average height that is farthest from the dividedSum.
     * Repeat until all players have been distributed.
     */
    while sortedPlayers.count > 0 {
        let currentMinPlayersPerTeam = getNumPlayersOnSmallestTeam(in: leagueTeams)
        
        var targetDifference: Int = 0
        var targetTeamName = ""
        for (teamName, team) in leagueTeams {
            if team.count == currentMinPlayersPerTeam {
                let teamKeySum = getSum(ofDistributionKeys: "heightInInches",
                                        inArray: team)
                let difference = abs(teamKeySum - dividedSum)
                if difference > targetDifference || targetDifference == 0 {
                    targetDifference = difference
                    targetTeamName = teamName
                }
            }
        }
        
        // Pop the next player from the sorted team and add him or her to the team
        // that was identified in the last step
        if let nextPlayer = sortedPlayers.popLast() {
            leagueTeams = add(nextPlayer, toTeamWithName: targetTeamName)
        }
    }
    
    return leagueTeams
}

// Returns a Double representing the average height for each team.
func getAverageHeightForPlayers(onTeam team: Array<Dictionary<String, Any>>) -> Double {
    var sum: Double = 0.0
    for player in team {
        sum += Double(player["heightInInches"] as! Int)
    }
    
    return sum / Double(team.count)
}

/* Returns null. Iterates through an array of dictionaries, which each represent
 * a soccer player, and prints each player in the array as a string in the
 * following format: PlayerName (HasExperience) - Height
*/
func printPlayersToConsole(forTeam team: Array<Dictionary<String, Any>>) -> () {
    for player in team {
        if let name = player["name"] as? String {
            let height = player["heightInInches"] as! Int
            let hasExperience = player["hasExperience"] as! Bool
            let expMarker = hasExperience ? "Y" : "N"
            print("\(name) (\(expMarker)) - \(height)\"")
        }
    }
}

/* Returns a string that represents the height based on the value (a Double)
 * that is passed in. The returned value will have a maximum of two decimal
 * places.
 */
func formatHeight(_ height: Double) -> String {
    let formatter = NumberFormatter()
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 2
    
    return formatter.string(for: height)!
}

// Returns a String representing the first practice date and time of the passed team
func getFirstPracticeTime(forTeamNamed teamName: String) -> String {
    switch(teamName) {
    case "Dragons" : return "March 17 at 1 p.m."
    case "Sharks" : return "March 17 at 3 p.m."
    default: return "March 18 at 1 p.m."
    }
}

/* Returns null. Prints the teams to the console identifying them by team name
 * and average height. Then, prints the name of each team member, whether that player
 * has experience (Y or N), and his or her height.
 */
func printTeamsToConsole(forTeams teams: Dictionary<String, Array<Dictionary<String, Any>>>) -> () {
    for (teamName, team) in teams {
        let avgHeight = getAverageHeightForPlayers(onTeam: team)
        let avgHeightString = formatHeight(avgHeight)
        print("Team: \(teamName) (Avg Height: \(avgHeightString)\")")
        print("----------------------------")
        printPlayersToConsole(forTeam: team)
        print()
    }
}

/* Returns an Array of Strings, each representing a welcome letter that includes
 * the student's guardians' names, the student's name, the name of the team that
 * they are on, and the date and time of the team's first practice.
 */
func createLetters(forMembersOfTeams teams: Dictionary<String, Array<Dictionary<String, Any>>>) -> Array<String> {
    var letters: [String] = []
    for (teamName, team) in teams {
        let firstPractice = getFirstPracticeTime(forTeamNamed: teamName)
        for player in team {
            if let playerName = player["name"] as? String,
                let playerGuardian = player["guardianNames"] as? String {
                let letter = "Dear \(playerGuardian),\n" +
                    "Congratulations! \(playerName) has been chosen to be a part\n" +
                    "of Team \(teamName) for this season! Your future soccer star's\n" +
                    "practice will be \(firstPractice) at the West Monroe Rec Center.\n" +
                    "We are looking forward to a great season! Now, let's play ball!\n\n" +
                    "Respectfully,\n" +
                    "Walter Allen\n" +
                "League Coordinator\n\n\n"
                letters.append(letter)
            }
        }
    }
    
    return letters
}

/* Returns null. Prints each string (reprsenting a letter to the guardians of
 * the team players) to the console.
 */
func printLettersToConsole(using letters: Array<String>) -> () {
    for letter in letters {
        print(letter)
    }
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
var leagueTeams = ["Dragons": teamDragons,
                   "Sharks": teamSharks,
                   "Raptors": teamRaptors]
leagueTeams = distribute(players: experiencedPlayers,
           intoTeams: leagueTeams,
           usingDistributionKey: "heightInInches")
leagueTeams = distribute(players: inexperiencedPlayers,
           intoTeams: leagueTeams,
           usingDistributionKey: "heightInInches")
printTeamsToConsole(forTeams: leagueTeams)

print("\n\n**** WELCOME LETTERS ****\n\n")
let letters = createLetters(forMembersOfTeams: leagueTeams)
printLettersToConsole(using: letters)
