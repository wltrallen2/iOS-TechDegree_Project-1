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

// TODO: Finish coding and commenting each helper function
func getPlayers(withExperience experience: Bool) -> ([[String:String]], [[String:String]]) {
    var expPlayers: Array<Dictionary<String, String>> = [[:]]
    var inexpPlayers: Array<Dictionary<String, String>> = [[:]]
    return (expPlayers, inexpPlayers)
}

func distributePlayersIntoLeague(using players: Array<Dictionary<String, String>>) -> () {
    
}

func printTeamsToConsole(forTeams teams: Array<Array<Dictionary<String, String>>>,
                         includingAverageHeight includeAverageHeight: Bool) -> () {
    
}

func createLetters(forMembersOfTeams teams: Array<Array<Dictionary<String, String>>>) -> Array<String> {
    return []
}

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
let (experiencedPlayers, inexperiencedPlayers) = getPlayers(withExperience: true)
distributePlayersIntoLeague(using: experiencedPlayers)
distributePlayersIntoLeague(using: inexperiencedPlayers)
printTeamsToConsole(forTeams: leagueTeams, includingAverageHeight: true)

let letters = createLetters(forMembersOfTeams:leagueTeams)
printLettersToConsole(using: letters)
