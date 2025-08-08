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
let FeedingTimes = [6.0, 12.5, 18, 0.0]


var time = 8.0
var characterPosition = [29, 65]
var oldPlayerPosition = [3, 2]
var underneathPlayer = "."
var timeString = ""
var foodAmount = 100
var alive = true

//MARK: Main code

updateMap(
    playerCharacter: playerCharacter,
    oldPlayerPosition: oldPlayerPosition,
    playerPosition: characterPosition,
    underneathPlayer: &underneathPlayer,
    mapScreen: &map
)

updatescreen(
    map: map,
    time: time,
    errorType: "good",
    timeString: timeString,
    food: foodAmount,
    alive: true
)

controlsAndMapKey()


while true {
    
    let movement = movement(
        oldPlayerPosition: &oldPlayerPosition,
        playerPosition: &characterPosition,
        mapScreen: map,
        mapSize: mapSize
    )
    
    if movement[0] == "update" {
        updateMap(
            playerCharacter: playerCharacter,
            oldPlayerPosition: oldPlayerPosition,
            playerPosition: characterPosition,
            underneathPlayer: &underneathPlayer,
            mapScreen: &map
        )
        
        let oldTime = timeStep(
            underneathPlayer: underneathPlayer,
            time: &time,
            timeMap: map,
            timeString: &timeString
        )
        
        foodCheck(
            currentTime: time,
            oldTime: oldTime,
            keyTimes: FeedingTimes,
            food: &foodAmount,
            alive: &alive,
            underneathPlayer: underneathPlayer
            
        )
        
        
    }
    updatescreen(
        map: map,
        time: time,
        errorType: movement[1],
        timeString: timeString,
        food: foodAmount,
        alive: alive
    )
}

