//
//  Tasks.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 27/08/2025.
//

import Foundation

/// Checks if the player has one the game by checking whether they have completed all their tasks.
/// - Parameters:
///   - tasksCompleted: will be compared against all tasks.
///   - allTasks: as above.
/// - Returns: Bool of whether the player has won the game.
func trackTasks(tasksCompleted: [Task], allTasks: [Task]) -> Bool {
    
    // I compare the number of items in the two lists because this is the most simple way and because there are mesures in place to make it safe.
    if tasksCompleted.count == allTasks.count {
        return true
        
    } else {
        return false
    }
}

/// Prints the list of tasks the player has to complete and the instructions on how to complete them
/// - Parameters:
///   - tasksCompleted: Used to tick off the tasks the user has completed
///   - allTasks: As above
func printTasks(tasksCompleted: [Task], allTasks: [Task]) {
    print("WGBN Ranger Tasks List: 4rth 2025")
    print()
    
    // Iterate over all tasks so that they can all be printed.
    for task in allTasks {
        
        // Some of the tasks are in two parts, but I only want one of the parts to show up on the list.
        switch task {
        case .turnOffToMitreTrapLine:
            
            //  We need to not only check that this task is completed, but the other part of this task as well before we print the text.
            if tasksCompleted.contains(.turnOffToMitreTrapLine) && tasksCompleted.contains(.mitreTrapLineToAlpine) {
                print("[x] - ", terminator: "")
                
            } else {
                print("[ ] - ", terminator: "")
            }
            
            print(task.rawValue)
            
        case .waingawaRiverTrapLine:
            
            // The same for this one.
            if tasksCompleted.contains(.waingawaRiverTrapLine) && tasksCompleted.contains(.waingawaRiverTrapLineEnd) {
                print("[x] - ", terminator: "")
                
            } else {
                print("[ ] - ", terminator: "")
            }
            
            print(task.rawValue)
            
        case .areteStreamTrapLineTurnOff:
            
            // And this one.
            if tasksCompleted.contains(.areteStreamTrapLineTurnOff) && tasksCompleted.contains(.areteStreamTrapLineToAlpine) {
                print("[x] - ", terminator: "")
                
            } else {
                print("[ ] - ", terminator: "")
            }
            
            print(task.rawValue)
            
            // These are the scond parts of the tasks beforehand they don't need to be displayed because they are already acounted for.
        case .mitreTrapLineToAlpine, .waingawaRiverTrapLineEnd, .areteStreamTrapLineToAlpine:
            continue
            
        default:
            
            // The rest of the tasks only need the player to do one thing therefore we don't need to check anything.
            if tasksCompleted.contains(task) {
                print("[x] - ", terminator: "")
            } else {
                print("[ ] - ", terminator: "")
            }
            print(task.rawValue)
            
            // This will make it clrearer to the player where the particular places.
        }
    }
    
    instructions()
}


