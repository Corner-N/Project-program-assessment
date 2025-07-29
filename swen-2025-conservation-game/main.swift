//
//  main.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 18/07/2025.
//

import Foundation

//MARK: Variables and constants.

let playerCharacter = "@"

var characterPosition = [29, 65]
var oldPlayerPosition = [3, 2]
var underneathPlayer = "."
var playerCorrectInput = true

// MARK: Functions

/// Gets a String user inout from the user
///
/// Parameters:  Prompt, Error message
/// Return:  a String of the user's input
func stringInput(prompt: String, errorMessage: String) -> String {
    while true {
        
        print(prompt)
        if let userInput = readLine(){
            return userInput
        } else {
            print(errorMessage)
        }
    }
}

/// Updates and prints the map.
///
/// Parameters:
///
///     playerCharacter: let constant allways contain an @ symbol.
///     oldPlayerPosition: the position the user used to be at, will be used to replace the character that used to be there.
///     playerPosition: where the player is now.
///     underneathPlayer: the character the player is currently covering.
///     mapscreen: the 2d array used for the screen.
func updateMap(playerCharacter: String, oldPlayerPosition: [Int], playerPosition: [Int], underneathPlayer: inout String, mapScreen: inout [[String]]) {
    
    // Clear the screen
    print("\u{001B}[2J")
    
    // Replace where the charcter used to be with the character that was "underneath" them.
    mapScreen[oldPlayerPosition[0]][oldPlayerPosition[1]] = underneathPlayer
    // Get the new character which is undertheath the player.
    underneathPlayer = mapScreen[playerPosition[0]][playerPosition[1]]
    // add the player to the map in the new position
    mapScreen[playerPosition[0]][playerPosition[1]] = playerCharacter
    
    // Display the map
    for row in mapScreen {
        for colum in row {
            print(colum, terminator: "")
        }
        print()
    }
}

/// Allow the player to move around the map
///
/// Parameters:
///
///     oldPlayerPosition:
///     playerPosition:
///     mapScreen: the map which the user can move around on.
///     playerCorrectInput: whether the user made a valid input.
func movement(oldPlayerPosition: inout [Int], playerPosition: inout [Int], mapScreen: [[String]], playerCorrectInput: inout Bool) {
    let userInput = stringInput(prompt: "Enter", errorMessage: "how")
    switch userInput {
    case "w" :
        oldPlayerPosition = playerPosition
        playerPosition[0] -= 1
    case "s" :
        oldPlayerPosition = playerPosition
        playerPosition[0] += 1
    case "d" :
        oldPlayerPosition = playerPosition
        playerPosition[1] += 1
    case "a" :
        oldPlayerPosition = playerPosition
        playerPosition[1] -= 1
    default :
        print("fuck off")
        playerCorrectInput = false
        return
    }
    playerCorrectInput = true
}

//MARK: Main code

updateMap(playerCharacter: playerCharacter, oldPlayerPosition: oldPlayerPosition, playerPosition: characterPosition, underneathPlayer: &underneathPlayer, mapScreen: &map)

while true {
    movement(oldPlayerPosition: &oldPlayerPosition, playerPosition: &characterPosition, mapScreen: map, playerCorrectInput: &playerCorrectInput)
    
    if playerCorrectInput {
        updateMap(playerCharacter: playerCharacter, oldPlayerPosition: oldPlayerPosition, playerPosition: characterPosition, underneathPlayer: &underneathPlayer, mapScreen: &map)
    }
}
