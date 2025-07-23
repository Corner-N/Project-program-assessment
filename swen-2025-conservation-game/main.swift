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
func movement(playerCharacter: String, oldPlayerPosition: [Int], playerPosition: inout [Int], underneathPlayer: String, mapScreen: inout [[String]]) {
    let userInput = stringInput(prompt: "Enter", errorMessage: "Fuck off")
    switch userInput {
    case "w" :
        playerPosition[0] += 1
    case "s" :
        playerPosition[0] -= 1
    case "d" :
        playerPosition[1] += 1
    case "a" :
        playerPosition[1] -= 1
    default :
        print("fuck off")
        return
    }
    displayMovement(playerCharacter: playerCharacter, oldPlayerPosition: oldPlayerPosition, playerPosition: playerPosition, underneathPlayer: underneathPlayer, mapScreen: &map)
}

while true {
    movement(playerCharacter: playerCharacter, oldPlayerPosition: oldPlayerPosition, playerPosition: &characterPosition, underneathPlayer: underneathPlayer, mapScreen: &map)
    for row in map {
        for colum in map {
            print(colum)
        }
    }
}


