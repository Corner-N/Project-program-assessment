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
let FeedingTimes = [8.0, 12.5, 18, 0.0]


var descriptionText = "track"
var hutFood: [UnderneathMapSpecialKey] = [.cowCreekHut, .areteForksHut, .midKingBiv, .areteHut]
var oldTime = 8.0
var time = 8.0
var characterPosition = [2, 4]
var oldPlayerPosition = [3, 2]
var underneathPlayer = "."
var timeString = ""
var foodAmount = 10
var alive = true
var mainDescriptionText: MainStatements = .track
var specialdescriptionText: specialStatements

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
    movementReturn: .good,
    timeString: timeString,
    food: foodAmount,
    alive: true,
    descriptionText: descriptionText
)

controlsAndMapKey()


while true {
    
    let movement = movement(
        oldPlayerPosition: &oldPlayerPosition,
        playerPosition: &characterPosition,
        mapScreen: map,
        mapSize: mapSize
    )
    
    if movement.0 == true {
        updateMap(
            playerCharacter: playerCharacter,
            oldPlayerPosition: oldPlayerPosition,
            playerPosition: characterPosition,
            underneathPlayer: &underneathPlayer,
            mapScreen: &map
        )
        
        if let tileType = typeofTitle(undernethMap: underneathMap, playerPosition: characterPosition){
            if tileType {
                if let descriptionTextAttempt = normalTileTime(time: &time, UnderneathMap: underneathMap, timeString: &timeString, playerPosition: characterPosition, oldTime: &oldTime) {
                    descriptionText = descriptionTextAttempt
                }
            } else {
                if let descriptionTextAttempt = specialTileTime(time: &time, UnderneathMap: underneathMap, timeString: &timeString, playerPosition: characterPosition, oldTime: &oldTime, hutFood: &hutFood, food: &foodAmount) {
                    descriptionText = descriptionTextAttempt
                }
            }
            if time == 24 {
                time = 0
            }
            
            timeString = String(format: "%.2f", time)
        }
        
        
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
        movementReturn: movement.1,
        timeString: timeString,
        food: foodAmount,
        alive: alive,
        descriptionText: descriptionText
    )
}

