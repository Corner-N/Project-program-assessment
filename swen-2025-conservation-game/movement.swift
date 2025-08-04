//
//  movement.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 04/08/2025.
//

/// checks the colision for the player to make sure there isn't a wall in the way of the player's movement.
///
/// parameters :
///
///     map
///     movement direction
func colision(map: [[String]], movementDirection: String, playerPosition: [Int], mapSize: [Int]) -> String{
    switch movementDirection {
    case "right" :
            if map[playerPosition[0]][playerPosition[1] + 1] == "_" {
            return "gorge"
        } else if map[playerPosition[0]][playerPosition[1] + 1] == "|" {
            return "cliff"
        } else if playerPosition[1] == mapSize[1]{
            return "edge"
        } else {
            return "good"
        }
        
    case "left" :
        if map[playerPosition[0]][playerPosition[1] - 1] == "_" {
            return "gorge"
        } else if map[playerPosition[0]][playerPosition[1] - 1] == "|" {
            return "cliff"
        } else if playerPosition[1] == 0 {
            return "edge"
        } else {
            return "good"
        }
        
    case "down" :
        if map[playerPosition[0] + 1][playerPosition[1]] == "_" {
            return "gorge"
        } else if map[playerPosition[0] + 1][playerPosition[1]] == "|" {
            return "cliff"
        } else if playerPosition[0] == mapSize[0] {
            return "edge"
        } else {
            return "good"
        }
    case "up" :
        if map[playerPosition[0] - 1][playerPosition[1]] == "_" {
            return "gorge"
        } else if map[playerPosition[0] - 1][playerPosition[1]] == "|" {
            return "cliff"
        } else if playerPosition[0] == 0 {
            return "edge"
        } else {
            return "good"
        }
    default :
        print("very big error")
        return "error"
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
func movement(oldPlayerPosition: inout [Int], playerPosition: inout [Int], mapScreen: [[String]], mapSize: [Int], updateScreen: inout Bool) {
    
    var correctInput = false
    
    while !correctInput {
        let userInput = stringInput(prompt: "Enter", errorMessage: "how")
        
        // Switch statement for each of the valid user inputs.
        switch userInput {
        case "w" :
            // Call the colision function to check if the user is trying to move into a wall
            let colision = colision(map: mapScreen, movementDirection: "up", playerPosition: playerPosition, mapSize: mapSize)
            //check's that user won't go off the edge of the map and crash the game.
            if playerPosition[0] != 0 && colision == "good" {
                //stores the last point the player was at to be replaced with the origional character that was there.
                oldPlayerPosition = playerPosition
                // updates the player's position
                playerPosition[0] -= 1
                // Tell the function not to loop
                correctInput = true
                updateScreen = true
            } else {
                print("you cannot go any further")
                // tell the function to loop again
                correctInput = false
                updateScreen = false
            }
        case "s" :
            let colision = colision(map: mapScreen, movementDirection: "down", playerPosition: playerPosition, mapSize: mapSize)
            if playerPosition[0] != mapSize[0] && colision == "good" {
                oldPlayerPosition = playerPosition
                playerPosition[0] += 1
                correctInput = true
                updateScreen = true
            } else {
                print("you cannot go any further ")
                correctInput = false
                updateScreen = false
            }
        case "d" :
            let colision = colision(map: mapScreen, movementDirection: "right", playerPosition: playerPosition, mapSize: mapSize)
            if playerPosition[1] != mapSize[1] && colision == "good" {
                oldPlayerPosition = playerPosition
                playerPosition[1] += 1
                correctInput = true
                updateScreen = true
            } else {
                print("you cannot go any further ")
                correctInput = false
                updateScreen = false
            }
        case "a" :
            let colision = colision(map: mapScreen, movementDirection: "left", playerPosition: playerPosition, mapSize: mapSize)
            if playerPosition[1] != 0 && colision == "good" {
                oldPlayerPosition = playerPosition
                playerPosition[1] -= 1
                correctInput = true
                updateScreen = true
            } else {
                print("You cannot go any further")
                correctInput = false
                updateScreen = false
            }
        // Give the user the option to print the tutorial again.
        case "?", "h" :
            controlsAndMapKey()
            correctInput = true
            updateScreen = false
            
        default :
            print("fuck off")
            // will loop the function again if the user doesn't input a correct input.
            correctInput = false
        }
    }
    
}
