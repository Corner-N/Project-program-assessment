//
//  StaminaAndTime.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 04/08/2025.
//

import Foundation

/// decides whether the player is standing on a normal tile or a special tile.
///
/// parameters:
///
///     number underneath the player.
///     player position
///
/// returns whether the user is on a special title or a normal one.
func typeofTitle(undernethMap: [[Int]], playerPosition: [Int]) -> Bool? {
    
    if let _ = UnderneathMapKey(rawValue: underneathMap[playerPosition[0]][playerPosition[1]])  {
        return true
    } else if let _ = UnderneathMapSpecialKey(rawValue: underneathMap[playerPosition[0]][playerPosition[1]])  {
        return false
    } else {
        exit(3)
    }
}

/// Advances time and adds the corect description for the tile the player is standing on
///
/// Parameters:
///
///     the currecnt time for the game
///     the map used to find the specific character the player is standing on
///     the string the time is turned into to make it a small decimal point.
///     the player's current position
///     the time before it was advanced used by food
///     the decription for the tile the player is standing on.
func normalTileTime(time:  inout Double, UnderneathMap: [[Int]], timeString: inout String, playerPosition: [Int], oldTime: inout Double,) -> String {
    
    // Logs the time before the player moves to be used in the food function.
    oldTime = time
    
    // Turns the players position on the underneath map into the type of character they are staying on.
    if let playerUnderneathType = UnderneathMapKey(rawValue: UnderneathMap[playerPosition[0]][playerPosition[1]])  {
        
        // checks which type of tile the player is standing on, and changes the time accordingly.
        switch playerUnderneathType {
        case .track :
            time += Times.track.rawValue
            return MainStatements.track.rawValue
        case .trapLine :
            time += Times.trapline.rawValue
            return MainStatements.trapLine.rawValue
        case .forest :
            time += Times.forest.rawValue
            return MainStatements.forest.rawValue
        case .alpine :
            time += Times.alpine.rawValue
            return MainStatements.alpine.rawValue
        case .streams :
            time += Times.streams.rawValue
            return MainStatements.streams.rawValue
        case .river :
            time += Times.river.rawValue
            return MainStatements.river.rawValue
        case .walls :
            print("how")
            exit(2)
        }
    } else {
        exit(2)
    }
}

/// advances time and adds the correct description for the special places.
///
/// Parameters:
///
///     the currecnt time for the game
///     the map used to find the specific character the player is standing on
///     the string the time is turned into to make it a small decimal point.
///     the player's current position
///     the time before it was advanced used by food
///     the amount of food the player has
/// returns: the decription for the tile the player is standing on.
func specialTileTime(time:  inout Double, UnderneathMap: [[Int]], timeString: inout String, playerPosition: [Int], oldTime: inout Double, tasks: inout [Task], food: inout Int) -> String {
    
    oldTime = time
    
    if let playerTile = UnderneathMapSpecialKey(rawValue: UnderneathMap[playerPosition[0]][playerPosition[1]]) {
        switch playerTile {
        case .firstBridge:
            time += 0.2
            return specialStatements.firstBridge.rawValue
        case .turnOffToMitreFlats:
            time += 0.2
            return specialStatements.turnOffToMitreFlats.rawValue
        case .turnOffToCowCreek:
            time += 0.2
            return specialStatements.turnOffToCowCreek.rawValue
        case .turnOffToMidKingBiv:
            time += 0.2
            return specialStatements.turnOffToMidKingBiv.rawValue
        case .alpineToBaldyCreek:
            time += 0.2
            return specialStatements.alpineToBaldyCreek.rawValue
        case .alpineToMitreTrapLine:
            time += 0.2
            return specialStatements.alpineToMitreTrapLine.rawValue
        case .mitrePeak :
            time += 0.2
            return specialStatements.mitrePeak.rawValue
        case .waingawaRiverCrossing:
            time += 0.2
            return specialStatements.waingawaRiverCrossing.rawValue
        case .areteForksTurnOff:
            time += 0.2
            return specialStatements.areteForksTurnOff.rawValue
        case .areteStreamTrapLineTurnOff:
            time += 0.2
            if !tasks.contains(.areteStreamTrapLineTurnOff) {
                food += 3
                tasks.append(.areteStreamTrapLineTurnOff)
            }
            return specialStatements.areteStreamTrapLineTurnOff.rawValue
        case .areteTrackToAlpine:
            time += 0.2
            return specialStatements.areteTrackToAlpine.rawValue
        case .alpineToAreteStream:
            time += 0.2
            return specialStatements.alpineToAreteStream.rawValue
        case .mitreFlats:
            time = 7.0
            return specialStatements.mitreFlats.rawValue
        case .cowCreekHut:
            time = 7.0
            if !tasks.contains(.cowCreekHut) {
                food += 3
                tasks.append(.cowCreekHut)
                
            }
            return specialStatements.cowCreekHut.rawValue
        case .midKingBiv:
            time = 7.0
            if !tasks.contains(.midKingBiv) {
                food += 3
                tasks.append(.midKingBiv)
            }
            return specialStatements.midKingBiv.rawValue
            
        case .areteForksHut:
            time = 7.0
            if !tasks.contains(.areteForksHut) {
                food += 3
                tasks.append(.areteForksHut)
            }
            return specialStatements.areteForksHut.rawValue
            
        case .areteHut:
            time = 7.0
            if !tasks.contains(.areteHut) {
                food += 3
                tasks.append(.areteHut)
            }
            return specialStatements.areteHut.rawValue
            
        case .turnOffToMitreTrapLine:
            time += 0.2
            if !tasks.contains(.turnOffToMitreTrapLine) {
                food += 3
                tasks.append(.turnOffToMitreTrapLine)
            }
            return specialStatements.turnOffToMitreTrapLine.rawValue
        case .baldyCreekIntoAlpine:
            time += 0.2
            return specialStatements.baldyCreekIntoAlpine.rawValue
            
        case .mitreTrapLineToAlpine:
            time += 0.2
            if !tasks.contains(.mitreTrapLineToAlpine) {
                food += 3
                tasks.append(.mitreTrapLineToAlpine)
            }
            return specialStatements.mitreTrapLineToAlpine.rawValue
        case .waingawaRiverTrapLine:
            time += 0.2
            if !tasks.contains(.waingawaRiverTrapLine) {
                food += 3
                tasks.append(.waingawaRiverTrapLine)
            }
            return specialStatements.waingawaRiverTrapLine.rawValue
        case .waingawaRiverTrapLineEnd:
            time += 0.2
            if !tasks.contains(.waingawaRiverTrapLineEnd) {
                food += 3
                tasks.append(.waingawaRiverTrapLineEnd)
            }
            return specialStatements.waingawaRiverTrapLineEnd.rawValue
        case .areteStreamTrapLineToAlpine:
            time += 0.2
            if !tasks.contains(.areteStreamTrapLineToAlpine) {
                food += 3
                tasks.append(.areteStreamTrapLineToAlpine)
            }
            return specialStatements.areteStreamTrapLineToAlpine.rawValue
        }
    } else {
        exit(2)
    }
}

/// Changes the food(stamina) based on the time of day
///
/// Paramenters :
///
///     Time
///     food
///     map
func foodCheck(currentTime: Double, oldTime: Double, keyTimes: [Double], food: inout Int, alive: inout Bool, underneathPlayer: String) {
    
    // This code is brought to you by Oli Stacey.
    for keyTime in keyTimes {
        if (currentTime >= keyTime) != (oldTime >= keyTime) {
            food -= 1
            break
        }
    }

    if food < 0 {
        alive = false
    } else {
        alive = true
    }
}

