//
//  StaminaAndTime.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 04/08/2025.
//

import Foundation


/// Gets whether the player is on a special tile or not.
/// - Parameters:
///   - undernethMap: Used to tell what kind of tile the player is standing on.
///   - playerPosition: To find the player's position of the map above.
/// - Returns: Returns what type of tile the player is on using Bool
func typeofTitle(undernethMap: [[Int]], playerPosition: [Int]) -> Bool? {
    
    // Tries to asign the code the player is standing on as the type for the normal tiles.
    if let _ = UnderneathMapKey(rawValue: underneathMap[playerPosition[0]][playerPosition[1]])  {
        return true
        
    // Tries to asign this to the special key.
    } else if let _ = UnderneathMapSpecialKey(rawValue: underneathMap[playerPosition[0]][playerPosition[1]])  {
        return false
        
    } else {
        
        // If neither of these work then somthing has gone horibly wrong.
        exit(3)
    }
}

/// Changes the time depending on what type of tile the player is standing on.
/// - Parameters:
///   - time: Chaged based on the tile type.
///   - UnderneathMap: A 2d array the user won't see which is used to find what type of tile the player is standing on.
///   - playerPosition: The plarer's current position, used to find where on the underneathMap the player is.
///   - oldTime: The time before the time gets changed, used by the fodd function.
/// - Returns: The text used to describe the tile the character is standing on.
func normalTileTime(time:  inout Double, UnderneathMap: [[Int]], playerPosition: [Int], oldTime: inout Double,) -> String {
    
    // Logs the time before the player moves to be used in the food function.
    oldTime = time
    
    // Turns the players position on the underneath map into the type of character they are staying on.
    if let playerUnderneathType = UnderneathMapKey(rawValue: UnderneathMap[playerPosition[0]][playerPosition[1]])  {
        
        // checks which type of tile the player is standing on, and changes the time and text shown to the user accordingly.
        switch playerUnderneathType {
        case .track :
            
            // The Time and descrition for each of the tile types is stored in a different Enum therefore I need a seperate statement for each type.
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
            
            // The program should never get to here therefore it exits.
        case .walls :
            exit(2)
            
        }
    } else {
        
        // The program should never get to here because of the tile type function.
        exit(2)
    }
}

/// Updates the time and the description shwon to the user based on the tile they are standing on. It then updates the tasks completed if needed.
/// - Parameters:
///   - time: Changed based on the tile the player is standing on.
///   - underneathMap: Used to find what the player is standing on.
///   - playerPosition: Where the player is, used to find the coresponding tile on Underneath map.
///   - oldTime: the time before the player moved, used by the food function.
///   - tasksCompleted: Adds a task if the player has completed one.
///   - food: Amount of food the user has left
/// - Returns: The string from the description of the tile the player is standing on.
func specialTileUpdate(time:  inout Double, underneathMap: [[Int]], playerPosition: [Int], oldTime: inout Double, tasksCompleted: inout [Task], food: inout Int) -> String {
    
    // Stores the current time before it get's changed.
    oldTime = time
    
    // Gets the number the player is standing on on the underneath map and turns it into a more useable type.
    if let playerTile = UnderneathMapSpecialKey(rawValue: underneathMap[playerPosition[0]][playerPosition[1]]) {
        
        // I need to iterate over all of the types of special charactes because there are multiple tyupes for the time, descrition and tasks.
        switch playerTile {
            
        // These are the cases for the tiles which only have a special message and not a special. They only need a specific time and a specific message added.
        case .firstBridge:
            
            // This one is located on a track and therefore gets the same time as walking on a track.
            time += Times.track.rawValue
            return specialStatements.firstBridge.rawValue
            
        case .turnOffToMitreFlats:
            
            // This one is located on a track and therefore gets the same time as walking on a track.
            time += Times.track.rawValue
            return specialStatements.turnOffToMitreFlats.rawValue
            
        case .turnOffToCowCreek:
            
            // This one is located on a track and therefore gets the same time as walking on a track.
            time += Times.track.rawValue
            return specialStatements.turnOffToCowCreek.rawValue
            
        case .turnOffToMidKingBiv:
            
            // This one is located on a river and therefore gets the same time as walking on a river.
            time += Times.streams.rawValue
            return specialStatements.turnOffToMidKingBiv.rawValue
            
        case .alpineToBaldyCreek:
            
            // This one is located in the alpine and therefore gets the same time as walking in the alpine.
            time += Times.alpine.rawValue
            return specialStatements.alpineToBaldyCreek.rawValue
            
        case .alpineToMitreTrapLine:
            
            // This one is located in the alpine and therefore gets the same time as walking in the alpine.
            time += Times.alpine.rawValue
            return specialStatements.alpineToMitreTrapLine.rawValue
            
        case .mitrePeak :
            
            // This one is located in the alpine and therefore gets the same time as walking in the alpine.
            time += Times.alpine.rawValue
            return specialStatements.mitrePeak.rawValue
            
        case .waingawaRiverCrossing:
            
            // This one is located on a track and therefore gets the same time as walking on a track.
            time += Times.track.rawValue
            return specialStatements.waingawaRiverCrossing.rawValue
            
        case .areteForksTurnOff:
            
            // This one is located on a track and therefore gets the same time as walking on a track.
            time += Times.track.rawValue
            return specialStatements.areteForksTurnOff.rawValue
            
            
        case .areteTrackToAlpine:
            
            // This one is located in the alpine and therefore gets the same time as walking in the alpine.
            time += Times.alpine.rawValue
            return specialStatements.areteTrackToAlpine.rawValue
            
        case .alpineToAreteStream:
            
            // This one is located in the alpine and therefore gets the same time as walking in the alpine.
            time += Times.alpine.rawValue
            return specialStatements.alpineToAreteStream.rawValue
            
            // This is a hut therefore the time is diferent, but there is no food in this hut, and it isn't one of the tasks.
        case .mitreFlats:
            
            // This is a hut, therefore the user "sleeps" here and the time is set to one hour before the first time they need to eat.
            time = FeedingTimes[0] - 1
            
            return specialStatements.mitreFlats.rawValue
            
            // These are the normal hut's they contain food for the user and add to the tasks.
        case .cowCreekHut:
            
            // This is a hut, therefore the user "sleeps" here and the time is set to one hour before the first time they need to eat.
            time = FeedingTimes[0] - 1
            
            // Checks if the user has already been to this hut.
            if !tasksCompleted.contains(.cowCreekHut) {
                
                // If not they they can collect the food from it.
                food += hutFoodAmount
                
                // And the task is added to the tasks completed so that it can be checked, and so that the user can't colect the food multiple times.
                tasksCompleted.append(.cowCreekHut)
                
            }
            return specialStatements.cowCreekHut.rawValue
            
        case .midKingBiv:
            
            // This is a hut, therefore the user "sleeps" here and the time is set to one hour before the first time they need to eat.
            time = FeedingTimes[0] - 1
            if !tasksCompleted.contains(.midKingBiv) {
                food += hutFoodAmount
                tasksCompleted.append(.midKingBiv)
            }
            return specialStatements.midKingBiv.rawValue
            
        case .areteForksHut:
            
            // This is a hut, therefore the user "sleeps" here and the time is set to one hour before the first time they need to eat.
            time = FeedingTimes[0] - 1
            if !tasksCompleted.contains(.areteForksHut) {
                food += hutFoodAmount
                tasksCompleted.append(.areteForksHut)
            }
            return specialStatements.areteForksHut.rawValue
            
        case .areteHut:
            
            // This is a hut, therefore the user "sleeps" here and the time is set to one hour before the first time they need to eat.
            time = FeedingTimes[0] - 1
            if !tasksCompleted.contains(.areteHut) {
                food += hutFoodAmount
                tasksCompleted.append(.areteHut)
            }
            return specialStatements.areteHut.rawValue
            
            // These are the trap lines, they have a time like the normal ones, but they are also linked to the player's tasks.
        case .turnOffToMitreTrapLine:
            
            // This one is located on a track and therefore gets the same time as walking on a track.
            time += Times.track.rawValue
            
            // Checks the user hasn't already been here, and if they haven't adds this to the list of tasks the user has to complete.
            if !tasksCompleted.contains(.turnOffToMitreTrapLine) {
                tasksCompleted.append(.turnOffToMitreTrapLine)
            }
            return specialStatements.turnOffToMitreTrapLine.rawValue
            
        case .areteStreamTrapLineTurnOff:
            
            // This one is located on a track and therefore gets the same time as walking on a track.
            time += Times.track.rawValue
            if !tasksCompleted.contains(.areteStreamTrapLineTurnOff) {
                tasksCompleted.append(.areteStreamTrapLineTurnOff)
            }
            return specialStatements.areteStreamTrapLineTurnOff.rawValue
            
            
        case .baldyCreekIntoAlpine:
            
            // This one is located in the alpine and therefore gets the same time as walking in the alpine.
            time += Times.alpine.rawValue
            return specialStatements.baldyCreekIntoAlpine.rawValue
            
        case .mitreTrapLineToAlpine:
            
            // This one is located in the alpine and therefore gets the same time as walking in the alpine.
            time += Times.alpine.rawValue
            if !tasksCompleted.contains(.mitreTrapLineToAlpine) {
                tasksCompleted.append(.mitreTrapLineToAlpine)
            }
            return specialStatements.mitreTrapLineToAlpine.rawValue
            
        case .waingawaRiverTrapLine:
            
            // This one is located on a track and therefore gets the same time as walking on a track.
            time += Times.track.rawValue
            if !tasksCompleted.contains(.waingawaRiverTrapLine) {
                tasksCompleted.append(.waingawaRiverTrapLine)
            }
            return specialStatements.waingawaRiverTrapLine.rawValue
            
        case .waingawaRiverTrapLineEnd:
            
            // This one is located on a track and therefore gets the same time as walking on a track.
            time += Times.track.rawValue
            if !tasksCompleted.contains(.waingawaRiverTrapLineEnd) {
                tasksCompleted.append(.waingawaRiverTrapLineEnd)
            }
            return specialStatements.waingawaRiverTrapLineEnd.rawValue
            
        case .areteStreamTrapLineToAlpine:
            
            // This one is located in the alpine and therefore gets the same time as walking in the alpine.
            time += Times.alpine.rawValue
            if !tasksCompleted.contains(.areteStreamTrapLineToAlpine) {
                tasksCompleted.append(.areteStreamTrapLineToAlpine)
            }
            return specialStatements.areteStreamTrapLineToAlpine.rawValue
            
        }
    } else {
        
        // This should never happen because of the tile type function.
        exit(2)
    }
}

/// Takes away food from the player at the right times and checks if they are dead.
/// - Parameters:
///   - currentTime: The time after the player moved.
///   - oldTime: The time befoee the player moved.
///   - keyTimes: The times when food is taken away.
///   - food: Amount of food the player has left.
///   - alive: Whether the player is alive.
func foodCheck(currentTime: Double, oldTime: Double, keyTimes: [Double], food: inout Int, alive: inout Bool) {
    
    // This code is brought to you by Oli Stacey.
    for keyTime in keyTimes {
        
        // This checks if the user has passes one of the key times by checking if the time before the player moved was the same reletive to the time after the player moved.
        if (currentTime >= keyTime) != (oldTime >= keyTime) {
            food -= 2
            break
        }
    }

    // This peice of code checks if the player has run out of food and died. I specificaly made this less than 0 because I wan't the user to die after a certain amount of time after they run out of food.
    if food < 0 {
        alive = false
    } else {
        alive = true
    }
}

