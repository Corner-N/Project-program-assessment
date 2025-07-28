//
//  main.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 18/07/2025.
//

import Foundation

let playerCharacter = "@"

var map = [
    [",", ",", ".", ","],
    [",", ",", ".", ","],
    [",", ",", ".", ","],
    [",", ",", "@", ","]
    ]
var characterPosition = [3, 2]
var oldPlayerPosition = [3, 2]
var underneathPlayer = "."

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

func displayMovement(playerCharacter: String, oldPlayerPosition: [Int], playerPosition: [Int], underneathPlayer: String, mapScreen: inout [[String]]) {
    mapScreen[playerPosition[0]][playerPosition[1]] = playerCharacter
    mapScreen[oldPlayerPosition[0]][oldPlayerPosition[1]] = underneathPlayer
}

///Allow the player to move around the map
///
///Parameters:
///the map which the user can move around
func movement(playerCharacter: String, oldPlayerPosition: inout [Int], playerPosition: inout [Int], underneathPlayer: inout String, mapScreen: [[String]]) {
    let userInput = stringInput(prompt: "Enter", errorMessage: "Fuck off")
    switch userInput {
    case "w" :
        oldPlayerPosition = playerPosition
        playerPosition[0] -= 1
        underneathPlayer = mapScreen[playerPosition[0]][playerPosition[1]]
    case "s" :
        oldPlayerPosition = playerPosition
        playerPosition[0] += 1
        underneathPlayer = mapScreen[playerPosition[0]][playerPosition[1]]
    case "d" :
        oldPlayerPosition = playerPosition
        playerPosition[1] -= 1
        underneathPlayer = mapScreen[playerPosition[0]][playerPosition[1]]
    case "a" :
        oldPlayerPosition = playerPosition
        playerPosition[1] += 1
        underneathPlayer = mapScreen[playerPosition[0]][playerPosition[1]]
    default :
        print("fuck off")
        return
    }
}

while true {
    movement(playerCharacter: playerCharacter, oldPlayerPosition: &oldPlayerPosition, playerPosition: &characterPosition, underneathPlayer: &underneathPlayer, mapScreen: map)
    displayMovement(playerCharacter: playerCharacter, oldPlayerPosition: oldPlayerPosition, playerPosition: characterPosition, underneathPlayer: underneathPlayer, mapScreen: &map)
    for row in map {
        for colum in row {
            print(colum, terminator: "")
        }
        print()
    }
}


