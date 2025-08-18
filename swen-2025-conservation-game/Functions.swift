//
//  Functions.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 31/07/2025.
//

import Foundation

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
    ^   Is forest area - moving in this area will take a long time.
    ,   Is alpine area - moving in this area will not take very long.
    ∙   Is a track - moving here will not take much time at all
    °   Is a trap line - moving here will take longer than a track but is still fast.
    ≈   Is a river - this won't take as long as forest but is still slow.
    ~   Is a stream - moving here isn't fast but it's better than bush bashing.
    -   Is a bridge - this takes as long as a track.
    _   Is a gorge - don't even try.
    |   Is a cliff - are you trying to get killed.
    your player character is \u{001B}[32m@\u{001B}[0m
    
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
    
    
    // Replace where the charcter used to be with the character that was "underneath" them.
    mapScreen[oldPlayerPosition[0]][oldPlayerPosition[1]] = underneathPlayer
    // Get the new character which is undertheath the player.
    underneathPlayer = mapScreen[playerPosition[0]][playerPosition[1]]
    // add the player to the map in the new position
    mapScreen[playerPosition[0]][playerPosition[1]] = playerCharacter
}

func updatescreen (map: [[String]], time: Double, movementReturn: MovementReturn, timeString: String, food: Int, alive: Bool, descriptionText: String) {
    
    
    // Clear the screen
    print("\u{001B}[2J")
    
    // print the map
    for row in map {
        for colum in row {
            print(colum, terminator: "")
        }
        print()
    }
    
    if !alive {
        print("You ran out of food and died")
        sleep(2)
        exit(0)
    }
    
    print("the time is \(timeString)")
    print("you have \(food) food left")
    
    // Print a different message depending on what the user tried to input.
    
    if movementReturn == .edge || movementReturn == .wall {
        print("you cannor go any further")
        
    } else if movementReturn == .tutorial {
        controlsAndMapKey()
    } else if movementReturn == .good {
        print(descriptionText)
    }
}

