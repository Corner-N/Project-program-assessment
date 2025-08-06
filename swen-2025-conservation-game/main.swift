//
//  main.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 18/07/2025.
//

import Foundation

//MARK: Variables and constants.

// Escape code to make a greeen @ symbol.
let playerCharacter = "\u{001B}[32m@\u{001B}[0m"
let mapSize = [29, 66]


var time = 6.999999999
var characterPosition = [29, 65]
var oldPlayerPosition = [3, 2]
var underneathPlayer = "."
var timeString = ""


//MARK: Main code

updateMap(playerCharacter: playerCharacter, oldPlayerPosition: oldPlayerPosition, playerPosition: characterPosition, underneathPlayer: &underneathPlayer, mapScreen: &map)

updatescreen(map: map, time: time, errorType: "good", timeString: timeString)

controlsAndMapKey()


while true {
    let movement = movement(oldPlayerPosition: &oldPlayerPosition, playerPosition: &characterPosition, mapScreen: map, mapSize: mapSize, correctUserInputs: correctUserInputs)
    
    if movement[0] == "update" {
        updateMap(playerCharacter: playerCharacter, oldPlayerPosition: oldPlayerPosition, playerPosition: characterPosition, underneathPlayer: &underneathPlayer, mapScreen: &map)
        timeStep(underneathPlayer: underneathPlayer, time: &time, timeMap: map, timeString: &timeString)
    }
    updatescreen(map: map, time: time, errorType: movement[1], timeString: timeString)
}

