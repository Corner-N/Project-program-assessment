//
//  Functions.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 31/07/2025.
//

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

/// Displays the key for controls and what the different parts of the map mean
func controlsAndMapKey () {
    print("""
    Controlls: use w,a,s,d to move around
    
    Map key:
    #   Is forest area - moving in this area will take a long time.
    ;   Is alpine area - moving in this area will not take very long.
    ∙   Is a track - moving here will not take much time at all
    °   Is a trap line - moving here will take longer than a track but is still fast.
    ≈   Is a river - this won't take as long as forest but is still slow.
    ~   Is a stream - moving here isn't fast but it's better than bush bashing.
    -   Is a bridge - this takes as long as a track.
    _   Is a gorge - don't even try.
    |   Is a cliff - are you trying to get killed.
    
    Enter ? or h to see this again.
    """)
}


// MARK: Update map
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

// MARK: Colision
/// checks the colision for the player to make sure there isn't a wall in the way of the player's movement.
///
/// parameters :
///
///     map
///     movement direction
func colision(map: [[String]], movementDirection: String, playerPosition: [Int]) -> String{
    switch movementDirection {
    case "right" :
            if map[playerPosition[0]][playerPosition[1] + 1] == "_" {
            return "gorge"
        } else if map[playerPosition[0]][playerPosition[1] + 1] == "|" {
            return "cliff"
        } else {
            return "good"
        }
        
    case "left" :
        if map[playerPosition[0]][playerPosition[1] - 1] == "_" {
            return "gorge"
        } else if map[playerPosition[0]][playerPosition[1] - 1] == "|" {
            return "cliff"
        } else {
            return "good"
        }
        
    case "down" :
        if map[playerPosition[0] + 1][playerPosition[1]] == "_" {
            return "gorge"
        } else if map[playerPosition[0] + 1][playerPosition[1]] == "|" {
            return "cliff"
        } else {
            return "good"
        }
    case "up" :
        if map[playerPosition[0] - 1][playerPosition[1]] == "_" {
            return "gorge"
        } else if map[playerPosition[0] - 1][playerPosition[1]] == "|" {
            return "cliff"
        } else {
            return "good"
        }
    default :
        print("very big error")
        return "error"
    }
}


// MARK: Movement
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
            let colision = colision(map: mapScreen, movementDirection: "up", playerPosition: playerPosition)
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
            let colision = colision(map: mapScreen, movementDirection: "down", playerPosition: playerPosition)
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
            let colision = colision(map: mapScreen, movementDirection: "right", playerPosition: playerPosition)
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
            let colision = colision(map: mapScreen, movementDirection: "left", playerPosition: playerPosition)
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


// MARK: Time
/// Advances time for the game
///
/// Parameters:
///
///     Underneath player: the character which the player is standing on.
///     time: the time of day: will be used to calculate the amount of food used
///     timemap: describes what the character is standing on.
func timeStep(underneathPlayer: String, time:  inout Double, timeMap: [[String]]) {
    // Switch statement for different types of things the player could be standing under.
    switch underneathPlayer {
    case "∙" :
        time += 0.2
    case "°" :
        time += 0.5
    case "#" :
        time += 1
    case ";" :
        time += 0.4
    case "~" :
        time += 0.7
    case "≈" :
        time += 1.2
    case "-" :
        time += 0.2
    case "|" :
        print("how")
        return
    case "_" :
        print("how")
        return
    case "H" :
        print("sleeping at hut")
        time = 6.0
    default :
        return
    }
    if time > 24 {
        time = 0
    }
}

/// Changes the stamina based on the time of day
///
/// Paramenters :
///
///     Map to check where the player is
///     Time
///

