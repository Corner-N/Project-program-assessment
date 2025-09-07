//
//  movement.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 04/08/2025.
//
//34567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
import Foundation


/// Checks if the player is trying to go through a wall or outside the map
/// - Parameters:
///   - underneathMap: Used to find what the player is trying to stand on.
///   - movementDirection: Combined with playerPosition to find what tile on underneathMap the player is trying to stand on.
///   - playerPosition: As above.
///   - mapSize: Used to find if the player is trying to go out of bounds.
/// - Returns: Whether the player will colide and if so what with,
func colision(
    underneathMap: [[Int]],
    movementDirection: CorrectUserInputs,
    playerPosition: [Int],
    mapSize: [Int]
) -> MovementReturn{
    
    // Get the player's new position based on their current position and what direction they are going.
    var newPlayerPosition: [Int]
    switch movementDirection {
    case .movementUp:
        newPlayerPosition = [playerPosition[0] - 1, playerPosition[1]]
    case .movementDown:
        newPlayerPosition = [playerPosition[0] + 1, playerPosition[1]]
    case .movementLeft:
        newPlayerPosition = [playerPosition[0], playerPosition[1] - 1]
    case .movementRight:
        newPlayerPosition = [playerPosition[0], playerPosition[1] + 1]
        
    // This should never happen therefore the code exits
    default:
        exit(5)
    }
    
    // This checks if the player is trying to leave the map.
    if
    newPlayerPosition[0] > mapSize[0] ||
    newPlayerPosition[1] > mapSize[1] ||
    newPlayerPosition[0] < 0 ||
    newPlayerPosition[1] < 0 {
        
        // This will be used by the main movement function to tell the game not to update the map.
        return .edge
    }
    
    // Get what is under the player's new position this needs to be done after the edge of map check so that we don't crash the game.
    if let underneathNewPosition = UnderneathMapKey(
        rawValue: underneathMap[newPlayerPosition[0]][newPlayerPosition[1]]
    ) {
        
        if underneathNewPosition == .walls {
            return .wall
        } else {
            return .good
        }
        
    // If the player's new position is a special tile then this will never be an incorect input.
    } else if let _ = UnderneathMapSpecialKey(
        rawValue: underneathMap[newPlayerPosition[0]][newPlayerPosition[1]]
    ) {
        return .good
    } else {
        // The program should never happen, if it does something has gone very wrong.
        exit(6)
    }
    

    
}



/// Returns the type of action the user inputed
func Inputs(
) -> (Bool, CorrectUserInputs) {

    // Get the user input.
    let userInput = stringInput(prompt: "Enter movement direction", errorMessage: "how")
    
    // Checking if the user input is one of the valid inputs.
    if let input = CorrectUserInputs(rawValue: userInput.lowercased()) {
        
        // Switch statement for each of the valid user inputs.
        switch input {
        case .movementUp, .movementDown, .movementLeft, .movementRight:
            return (true, input)
        // Give the user the option to print the tutorial again.
        default:
            return(false, input)
        }
        
    } else {
        return (false, .invalid)    }
    
}


/// Changes the playes position and gets the colision based on the player's movement direction.
/// - Parameters:
///   - oldPlayerPosition: Asigned to the player's position before they move.
///   - playerPosition: asigned to the player's position after they move.
///   - mapSize: pased into colsision function.
///   - underneathMap: Passed into colision function
///   - movementDirection: From the return of the input function, used to chqange playerPosition and check colision.
/// - Returns: A Bool of whether the map should be updated, and the result of the colision function.
func movement(
    oldPlayerPosition: inout [Int],
    playerPosition: inout [Int],
    mapSize: [Int],
    underneathMap: [[Int]],
    movementDirection: CorrectUserInputs
) -> (Bool, MovementReturn) {
    
    // Call the colision function to check if the user is trying to move into a wall
    let collision = colision(
        underneathMap: underneathMap,
        movementDirection: movementDirection,
        playerPosition: playerPosition,
        mapSize: mapSize
    )
    //check's that user won't go off the edge of the map and crash the game.
    if collision == .good {
        //stores the last point the player was at to be replaced with the origional character that was there.
        oldPlayerPosition = playerPosition
        // updates the player's position
        switch movementDirection {
        case .movementUp:
            playerPosition[0] -= 1
        case .movementDown:
            playerPosition[0] += 1
        case .movementLeft:
            playerPosition[1] -= 1
        case .movementRight:
            playerPosition[1] += 1
        default:
            exit(7)
        
        }
        
        // Tell the function not to loop
        // Return
        return (true, collision)
    } else {
        // Tell the program not to update the map because the player has run into something they cannot pass
        return (false, collision)
    }
}
