//
//  GameMapFunctions.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 07/09/2025.
//
 import Foundation

/// Updates the map for everytime something changes like at the start of the game or when the player moves.
/// - Parameters:
///   - playerCharacter
///   - oldPlayerPosition: Used to replace the charcter the player was standing.
///   - playerPosition: Used to place the player chcacter in the new position.
///   - underneathPlayer: The character the player is currently standing on, used to replace this character when the player moves.
///   - mapScreen: The full map the player see's which this function updates.
func updateMap(
    playerCharacter: String,
    oldPlayerPosition: [Int],
    playerPosition: [Int],
    underneathPlayer: inout String,
    mapScreen: inout [[String]]
) {
    
    
    // Replace where the charcter used to be with the character that was "underneath" them.
    mapScreen[oldPlayerPosition[0]][oldPlayerPosition[1]] = underneathPlayer
    // Get the new character which is undertheath the player.
    underneathPlayer = mapScreen[playerPosition[0]][playerPosition[1]]
    // add the player to the map in the new position
    mapScreen[playerPosition[0]][playerPosition[1]] = playerCharacter
}

/// prints the map the user will see
///
/// parameters:
///
///     map
func printMap(gameMap: [[String]]) {
    for row in gameMap {
        for column in row {
            print(column, terminator: "")
        }
        print()
    }
}
