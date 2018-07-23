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
/* The following sixteen constants are of type Dictionary<String, String>,
 each representing one player with the following keys:
 "Name", "Height (inches)", "Soccer Experience", and "Guardian Name(s)".
 */
let player1 = ["Name": "Joe Smith",
               "Height (inches)": "42",
               "Soccer Experience": "YES",
               "Guardian Name(s)": "Jim and Jan Smith"]
let player2 = ["Name": "Jill Tanner",
               "Height (inches)": "36",
               "Soccer Experience": "YES",
               "Guardian Name(s)": "Clara Tanner"]
let player3 = ["Name": "Bill Bon",
               "Height (inches)": "43",
               "Soccer Experience": "YES",
               "Guardian Name(s)": "Sara and Jenny Bon"]
let player4 = ["Name": "Eva Gordon",
               "Height (inches)": "45",
               "Soccer Experience": "NO",
               "Guardian Name(s)": "Wendy and Mike Gordon"]
let player5 = ["Name": "Matt Gill",
               "Height (inches)": "40",
               "Soccer Experience": "NO",
               "Guardian Name(s)": "Charles and Sylvia Gill"]
let player6 = ["Name": "Kimmy Stein",
               "Height (inches)": "41",
               "Soccer Experience": "NO",
               "Guardian Name(s)": "Bill and Hillary Stein"]
let player7 = [ "Name": "Sammy Adams",
                "Height (inches)": "45",
                "Soccer Experience": "NO",
                "Guardian Name(s)": "Jeff Adams"]
let player8 = ["Name": "Karl Saygan",
               "Height (inches)": "42",
               "Soccer Experience": "YES",
               "Guardian Name(s)": "Heather Bledsoe"]
let player9 = ["Name": "Suzane Greenberg",
               "Height (inches)": "44",
               "Soccer Experience": "YES",
               "Guardian Name(s)": "Henrietta Dumas"]
let player10 = ["Name": "Sal Dali",
                "Height (inches)": "41",
                "Soccer Experience": "NO",
                "Guardian Name(s)": "Gala Dali"]
let player11 = ["Name": "Joe Kavalier",
                "Height (inches)": "39",
                "Soccer Experience": "NO",
                "Guardian Name(s)": "Sam and Elaine Kavalier"]
let player12 = ["Name": "Ben Finkelstein",
                "Height (inches)": "44",
                "Soccer Experience": "NO",
                "Guardian Name(s)": "Aaron and Jill Finkelstein"]
let player13 = ["Name": "Diego Soto",
                "Height (inches)": "41",
                "Soccer Experience": "YES",
                "Guardian Name(s)": "Robin and Sarika Soto"]
let player14 = ["Name": "Chloe Alaska",
                "Height (inches)": "47",
                "Soccer Experience": "NO",
                "Guardian Name(s)": "David and Jamie Alaska"]
let player15 = ["Name": "Arnold Willis",
                "Height (inches)": "43",
                "Soccer Experience": "NO",
                "Guardian Name(s)": "Claire Willis"]
let player16 = ["Name": "Phillip Helm",
                "Height (inches)": "44",
                "Soccer Experience": "YES",
                "Guardian Name(s)": "Thomas Helm and Eva Jones"]
let player17 = ["Name": "Les Clay",
                "Height (inches)": "42",
                "Soccer Experience": "YES",
                "Guardian Name(s)": "Wynonna Brown"]
let player18 = ["Name": "Herschel Krustofski",
                "Height (inches)": "45",
                "Soccer Experience": "YES",
                "Guardian Name(s)": "Hyman and Rachel Krustofski"]


// This constant is an array which stores the eighteen soccer player dictionaries.
let players = [player1, player2, player3, player4, player5, player6,
               player7, player8,player9, player10, player11, player12,
               player13, player14, player15, player16, player17, player18]


// Global variables that represent the the three teams that the players will be sorted into.
// It takes the form: Array<Dictionary<String, String>>.
var teamDragons: [[String: String]] = []
var teamSharks: [[String: String]] = []
var teamRaptors: [[String: String]] = []


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
 - add(_newPlayer:, toTeamAtIndex:)
 - distribute(players:, intoTeams:, usingDistributionKey:)
 - getAverageHeightForPlayers(onTeam:)
 - printPlayersToConsole(forTeam:)
 - formatHeight(_height:)
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

/* Returns an Int that represents the sum of all heights, in inches, for each of the
 * players in the passed array of players.
 */
func getTotalHeightsOfPlayersInInches(inArray players: Array<Dictionary<String, String>>) -> Int {
    var totalHeight = 0
    for player in players {
        if let playerHeight = player["Height (inches)"] as String? {
            totalHeight += Int(playerHeight)!
        }
    }
    
    return totalHeight
}

/* Returns a Bool representing whether or not the array of teams contains any teams
 * without players.
 */
func hasEmptyTeams(in arrayOfTeams: Array<Array<Dictionary<String, String>>>) -> Bool {
    for team in arrayOfTeams {
        if team.count == 0 {
            return true
        }
    }
    
    return false
}

// Returns an Int representing the number of players on the team with the fewest players.
func getNumPlayersOnSmallestTeam(in arrayOfTeams: Array<Array<Dictionary<String, String>>>) -> Int {
    var minPlayers: Int = 0
    for team in arrayOfTeams {
        if minPlayers == 0 || team.count < minPlayers {
            minPlayers = team.count
        }
    }
    
    return minPlayers
}

/* Returns an Int representing the sum of values for the passed key in the passed array.
 * Returns zero (0) if the values are not able to be cast to Ints.
 */
func getSum(ofDistributionKeys key: String,
            inArray arrayOfDicts: Array<Dictionary<String, String>>) -> Int {
    var sum = 0
    for dict in arrayOfDicts {
        sum += Int(dict[key]!)!
    }
    return sum
}

/* Returns an array of players by adding a new player dictionary to the team array
 * using the given index values. The index values are hard coded due to the project
 * instructions to use three different collections to store the player dictionaries.
 */
func add(_ newPlayer: Dictionary<String, String>, toTeamAtIndex index: Int) -> [Array<Dictionary<String, String>>] {
    switch index {
    case 0: teamDragons.append(newPlayer)
    case 1: teamSharks.append(newPlayer)
    default: teamRaptors.append(newPlayer) // TODO: The rest of this function needs to be refractored for leagueTeams?
    }
    
    return [teamDragons, teamSharks, teamRaptors]
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
func distribute(players: Array<Dictionary<String, String>>,
                intoTeams teams: Array<Array<Dictionary<String, String>>>,
                usingDistributionKey distributionKey: String) -> Array<Array<Dictionary<String, String>>> {
    var sortedPlayers = players.sorted{$0[distributionKey]! < $1[distributionKey]!}
    
    var leagueTeams = teams
    
    // If all teams are empty, place one player from the sorted arrage on each team
    if hasEmptyTeams(in: leagueTeams) {
        for index in leagueTeams.indices {
            if let newPlayer = sortedPlayers.popLast() {
                leagueTeams = add(newPlayer, toTeamAtIndex: index)
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
        let currentMinPlayersPerTeam = getNumPlayersOnSmallestTeam(in: leagueTeams) // refractored?
        
        var targetDifference: Int = 0
        var targetTeamIndex = 0
        for team in leagueTeams {
            if team.count == currentMinPlayersPerTeam {
                let teamKeySum = getSum(ofDistributionKeys: "Height (inches)",
                                        inArray: team)
                let difference = abs(teamKeySum - dividedSum)
                if targetDifference == 0 || difference > targetDifference {
                    targetDifference = difference
                    targetTeamIndex = leagueTeams.index(of: team)!
                }
            }
        }
        
        // Pop the next player from the sorted team and add him or her to the team
        // that was identified in the last step
        if let nextPlayer = sortedPlayers.popLast() {
            leagueTeams = add(nextPlayer, toTeamAtIndex: targetTeamIndex)
        }
    }
    
    return leagueTeams
}

// Returns a Double representing the average height for each team.
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
        if let name = player["Name"] as String?,
            let height = player["Height (inches)"] as String? {
            let experience = player["Soccer Experience"]
            let expMarker = experience == "YES" ? "Y" : "N"
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

// Returns a String representing the team name of the passed team
func getTeamName(forTeam team: Array<Dictionary<String, String>>) -> String {
    // Set a default value for the teamName variable
    var teamName = "Dragons"
    
    // Test to see if the elements in the passed array (team) are equal to the elements
    // in one of the other two teams. If so, reset the teamName variable to that team
    // name. If not, then the teamName is the default.
    if team.elementsEqual(teamSharks) {
        teamName = "Sharks"
    } else if team.elementsEqual(teamRaptors) {
        teamName = "Raptors"
    }
    
    return teamName
}

// Returns a String representing the first practice date and time of the passed team
func getFirstPracticeTime(forTeam team: Array<Dictionary<String, String>>) -> String {
    // Set a default value for the teamName variable
    var practiceInfo = "March 17 at 1 p.m."
    
    // Test to see if the elements in the passed array (team) are equal to the elements
    // in one of the other two teams. If so, reset the practiceInfo variable to that team's
    // first practice info. If not, then the teamName is the default.
    if team.elementsEqual(teamSharks) {
        practiceInfo = "March 17 at 3 p.m."
    } else if team.elementsEqual(teamRaptors) {
        practiceInfo = "March 18 at 1 p.m."
    }
    
    return practiceInfo
}

/* Returns null. Prints the teams to the console identifying them by team name
 * and average height. Then, prints the name of each team member, whether that player
 * has experience (Y or N), and his or her height.
 */
func printTeamsToConsole(forTeams teams: Array<Array<Dictionary<String, String>>>) -> () {
    for team in teams {
        let teamName = getTeamName(forTeam: team)
        let avgHeight = getAverageHeightForPlayers(onTeam: team)
        let avgHeightString = formatHeight(avgHeight)
        // TODO: Print average height to 1st significant digit
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
func createLetters(forMembersOfTeams teams: Array<Array<Dictionary<String, String>>>) -> Array<String> {
    var letters: [String] = []
    for team in teams {
        let teamName = getTeamName(forTeam: team)
        let firstPractice = getFirstPracticeTime(forTeam: team)
        for player in team {
            if let playerName = player["Name"] as String?,
                let playerGuardian = player["Guardian Name(s)"] as String? {
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
var leagueTeams = [teamDragons, teamSharks, teamRaptors]
leagueTeams = distribute(players: experiencedPlayers,
           intoTeams: leagueTeams,
           usingDistributionKey: "Height (inches)")
leagueTeams = distribute(players: inexperiencedPlayers,
           intoTeams: leagueTeams,
           usingDistributionKey: "Height (inches)")
printTeamsToConsole(forTeams: [teamDragons, teamSharks, teamRaptors])

print("\n\n**** WELCOME LETTERS ****\n\n")
let letters = createLetters(forMembersOfTeams: [teamDragons, teamSharks, teamRaptors])
printLettersToConsole(using: letters)
