//
//  Functions.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 31/07/2025.
//

// MARK: Core functions

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

// MARK: Game functions

/// Allow the player to move around the map
///
/// Parameters:
///
///     oldPlayerPosition:
///     playerPosition:
///     mapScreen: the map which the user can move around on.
///     playerCorrectInput: whether the user made a valid input.
func movement(oldPlayerPosition: inout [Int], playerPosition: inout [Int], mapScreen: [[String]], mapSize: [Int]) {
    
    var correctInput = false
    
    while !correctInput {
        let userInput = stringInput(prompt: "Enter", errorMessage: "how")
        
        // Switch statement for each of the valid user inputs.
        switch userInput {
        case "w" :
            //check's that user won't go off the edge of the map and crash the game.
            if playerPosition[0] != 0 {
                //stores the last point the player was at to be replaced with the origional character that was there.
                oldPlayerPosition = playerPosition
                // updates the player's position
                playerPosition[0] -= 1
                // Tell the function not to loop
                correctInput = true
            } else {
                print("you cannot go any further")
                // tell the function to loop again
                correctInput = false
            }
        case "s" :
            if playerPosition[0] != mapSize[0] {
                oldPlayerPosition = playerPosition
                playerPosition[0] += 1
                correctInput = true
            } else {
                print("you cannot go any further ")
                correctInput = false
            }
        case "d" :
            if playerPosition[1] != mapSize[1] {
                oldPlayerPosition = playerPosition
                playerPosition[1] += 1
                correctInput = true
            } else {
                print("you cannot go any further ")
                correctInput = false
            }
        case "a" :
            if playerPosition[1] != 0 {
                oldPlayerPosition = playerPosition
                playerPosition[1] -= 1
                correctInput = true
            } else {
                print("You cannot go any further")
                correctInput = false
            }
        default :
            print("fuck off")
            // will loop the function again if
            correctInput = false
        }
    }
    
}

/// Advances time for the game
///
/// Parameters:
///
///


