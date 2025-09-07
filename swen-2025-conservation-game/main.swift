//
//  main.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 18/07/2025.
//import Foundation
//34567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
// Escape code to make a greeen @ symbol.
import Foundation

let playerCharacter = "\u{001B}[32m@\u{001B}[0m"

// Used to determine whether the player is out of bounds
let mapSize = [29, 66]

// Used to determine whether the player should use food on a particular action
let FeedingTimes = [8.0, 12.5, 18, 0.0]

// Used to give the user food when they get to a hut.
let hutFoodAmount = 5

// Used to check against tasksCompleted
let allTasks: [Task] = [
    .cowCreekHut,
    .areteForksHut,
    .areteHut,
    .midKingBiv,
    .turnOffToMitreTrapLine,
    .mitreTrapLineToAlpine,
    .waingawaRiverTrapLine,
    .waingawaRiverTrapLineEnd,
    .areteStreamTrapLineTurnOff,
    .areteStreamTrapLineToAlpine
]

var descriptionText = MainStatements.track.rawValue

// used to track what tasks the user has done.
var tasksCompleted: [Task] = []

// Used to check if the used has gone past one of the feeding times
var oldTime = 8.0
var time = 8.0

// used to find what tile the player is standing on and what character represents that tile to 
var characterPosition = [29, 65]

// Used to replace the character where the player was standing before they moved.
var oldPlayerPosition = [29, 65]
var underneathPlayer = "∙"

// The string used for the time rounded to one decimal point.
var timeString = "8.0"
var foodAmount = 15

// used to end the program if the user looses
var alive = true

// used to end the program if the user wins.
var win = false

// What action the user has taken
var userAction: (Bool, CorrectUserInputs) = (false, .invalid)

// The variable used to store the outcome of the movement function.
var movementOutcome: (Bool, MovementReturn) = (false, .good)

// Update the map so the player character apears in the starting place when it is first printed
updateMap(
    playerCharacter: playerCharacter,
    oldPlayerPosition: oldPlayerPosition,
    playerPosition: characterPosition,
    underneathPlayer: &underneathPlayer,
    mapScreen: &gameMap
)

// Plays the tutorial and backstory
startGame(map: gameMap, taskscompleted: tasksCompleted, alltasks: allTasks)

// Displays the scene for the start of the game.
updateGameScene(
    map: gameMap,
    userAction: userAction.1,
    timeString: timeString,
    food: foodAmount,
    alive: alive,
    descriptionText: descriptionText,
    win: win,
    allTasks: allTasks,
    tasksCompleted: tasksCompleted,
    movementOutcome: .good
)

// The loop for gameplay, each time this loops the player carries out an action
while true {
    
    // Get the input to determine what happens next.
    userAction = Inputs()
    
    // Checks if the user tried to move.
    if userAction.0 {
        movementOutcome = movement(
            oldPlayerPosition: &oldPlayerPosition,
            playerPosition: &characterPosition,
            mapSize: mapSize,
            underneathMap: underneathMap,
            movementDirection: userAction.1
        )
    }
    
    // Will only run if the player is moving because if this happens multiple times before the player moves then it causes multiple errors
    if movementOutcome.0 && userAction.0 {
        
        // I only update the map if the player is moving because if we don't then the map heavily breaks.
        updateMap(
            playerCharacter: playerCharacter,
            oldPlayerPosition: oldPlayerPosition,
            playerPosition: characterPosition,
            underneathPlayer: &underneathPlayer,
            mapScreen: &gameMap
        )
        
        // check whether the tile is special or not to determine whic function to send it to.
        let tileType = typeofTitle(
            undernethMap: underneathMap,
            playerPosition: characterPosition)
            
        // This is for the normal tiles
        if tileType == true{
            
            // The descriptions for the normal tiles is in a different enum than for the special tiles which is why these are seperate function.s.
            descriptionText = normalTileTime(
                time: &time,
                UnderneathMap: underneathMap,
                playerPosition: characterPosition,
                oldTime: &oldTime
            )
        } else {
            descriptionText = specialTileUpdate(
                time: &time,
                underneathMap: underneathMap,
                playerPosition: characterPosition,
                oldTime: &oldTime,
                tasksCompleted: &tasksCompleted,
                food: &foodAmount
            )
        }
        
        // we check this here because the time will only change if the player has moved.
        if time >= 24 {
            
            // This makes sure that the time above 24 is kept so that I don't get 0.0 every time.
            time = time - 24
        }
        
        // This converts the time from a double into a string and limits it to 1 decimal point so that there isn't floating point error..
        timeString = String(format: "%.2f", time)
        
        // I check if the player has won here because the user will only ever win when they move.
        win = trackTasks(tasksCompleted: tasksCompleted, allTasks: allTasks)
        
        // I check if the user has used food here because if I do it later it might register them eating food multiple times if they enter an incorect input.
        foodCheck(
            currentTime: time,
            oldTime: oldTime,
            keyTimes: FeedingTimes,
            food: &foodAmount,
            alive: &alive,
        )
    }
    
    // I allways update the game scene even if the player doesn't move so that i don't get lots of the same error message on screen at once.
    updateGameScene(map: gameMap, userAction: userAction.1, timeString: timeString, food: foodAmount, alive: alive, descriptionText: descriptionText, win: win, allTasks: allTasks, tasksCompleted: tasksCompleted, movementOutcome: movementOutcome.1)
    
}

