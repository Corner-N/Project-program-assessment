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
///     player position
///     size of the map
///
/// returns: Whether the player can move and if they can't what is blocking their way
func colision(map: [[String]], movementDirection: CorrectUserInputs, playerPosition: [Int], mapSize: [Int]) -> MovementReturn{
    
    if let playerUnderneathType = UnderneathMapKey(rawValue: underneathMap[playerPosition[0]][playerPosition[1]]) {
        // switch statement for the different directions the player could be moving in
        switch movementDirection {
        case .movementRight :
            //check if the player is trying to walk off the edge of the map
            if playerPosition[1] == mapSize[1]{
                return .edge
                // check if the player is trying to walk through a gorge.
            } else if playerUnderneathType ==  .walls {
                return .wall
                // check if the player is trying to walk through a cliff
            } else {
                // if nothing was triggered then return good
                return .good
            }
            
        case .movementLeft :
            if playerPosition[1] == 0 {
                return .edge
            } else if playerUnderneathType ==  .walls {
                return .wall
            } else  {
                return .good
            }
            
        case .movementDown :
            if playerPosition[0] == mapSize[0] {
                return .edge
            } else if playerUnderneathType == .walls {
                return .wall
            } else {
                return .good
            }
        case .movementUp :
            if playerPosition[0] == 0 {
                return .edge
            } else if playerUnderneathType ==  .walls {
                return .wall
            } else {
                return .good
            }
        default :
            return .bigError
        }
    } else {
        return .bigError
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
func movement(oldPlayerPosition: inout [Int], playerPosition: inout [Int], mapScreen: [[String]], mapSize: [Int]) -> (Bool, MovementReturn) {

    // Get the user input.
    let userInput = stringInput(prompt: "Enter movement direction", errorMessage: "how")
    
    // Switch statement for each of the valid user inputs.
    
    if let test = CorrectUserInputs(rawValue: userInput.lowercased()) {
        switch test {
        case .movementUp :
            // Call the colision function to check if the user is trying to move into a wall
            let collision = colision(map: mapScreen, movementDirection: .movementUp, playerPosition: playerPosition, mapSize: mapSize)
            //check's that user won't go off the edge of the map and crash the game.
            if collision == .good {
                //stores the last point the player was at to be replaced with the origional character that was there.
                oldPlayerPosition = playerPosition
                // updates the player's position
                playerPosition[0] -= 1
                // Tell the function not to loop
                // Return
                return (true, collision)
            } else {
                // tell the function to loop again
                return (false, collision)
            }
            
        case .movementDown :
            let colision = colision(map: mapScreen, movementDirection: .movementDown, playerPosition: playerPosition, mapSize: mapSize)
            if colision == .good {
                oldPlayerPosition = playerPosition
                playerPosition[0] += 1
                return (true, colision)
            } else {
                return (false, colision)
            }
        case .movementRight :
            let colision = colision(map: mapScreen, movementDirection: .movementRight, playerPosition: playerPosition, mapSize: mapSize)
            if colision == .good {
                oldPlayerPosition = playerPosition
                playerPosition[1] += 1
                return (true, colision)
            } else {
                return (false, colision)
            }
        case .movementLeft :
            let colision = colision(map: mapScreen, movementDirection: .movementLeft, playerPosition: playerPosition, mapSize: mapSize)
            if colision == .good {
                oldPlayerPosition = playerPosition
                playerPosition[1] -= 1
                return (true, colision)
            } else {
                return (false, colision)
            }
            // Give the user the option to print the tutorial again.
        case .helpMenu1, .helpMenu2 :
            return (false, .tutorial)
        }
        
    } else {
        return (false, .invalid)
    }
    
}
