//
//  main.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 18/07/2025.
//

import Foundation

// Escape code to make a greeen @ symbol.
let playerCharacter = "\u{001B}[32m@\u{001B}[0m"

// Used to determine whether the player is out of bounds
let mapSize = [29, 66]

// Used to determine whether the player should use food on a particular action
let FeedingTimes = [8.0, 12.5, 18, 0.0]

// Used to check against tasksCompleted
let allTasks: [Task] = [.cowCreekHut, .areteForksHut, .areteHut, .midKingBiv, .turnOffToMitreTrapLine, .mitreTrapLineToAlpine, .waingawaRiverTrapLine, .waingawaRiverTrapLineEnd, .areteStreamTrapLineTurnOff, .areteStreamTrapLineToAlpine]

var descriptionText = MainStatements.track.rawValue

// used to track what tasks the user has done.
var tasksCompleted: [Task] = []

// Used to check if the used has gone past one of the feeding times
var oldTime = 8.0
var time = 8.0

// Used to find which character the player is standing on so that it can replace it when the player moves, and to find what specific place on the map the user is standing.
var characterPosition = [29, 65]

// Used to replace the character where the player was standing before they moved.
var oldPlayerPosition = [3, 2]
var underneathPlayer = "."

// The string for the time which is 
var timeString = "8.0"
var foodAmount = 10
var alive = true
var mainDescriptionText: MainStatements = .track
var specialdescriptionText: specialStatements
var win = false

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
    descriptionText: descriptionText,
    win: false
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
        
        let tileType = typeofTitle(
            undernethMap: underneathMap,
            playerPosition: characterPosition)
            
        if tileType == true{
            descriptionText = normalTileTime(time: &time, UnderneathMap: underneathMap, timeString: &timeString, playerPosition: characterPosition, oldTime: &oldTime)
        } else {
            descriptionText = specialTileTime(time: &time, UnderneathMap: underneathMap, timeString: &timeString, playerPosition: characterPosition, oldTime: &oldTime, tasks: &tasksCompleted, food: &foodAmount)
        }
        if time > 24 {
            time = 0
        }
        
        timeString = String(format: "%.2f", time)
        
        win = trackTasks(tasksUncompleted: tasksCompleted, allTasks: allTasks)
        
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
        descriptionText: descriptionText,
        win: win
    )
}

