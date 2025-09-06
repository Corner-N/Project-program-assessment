//
//  Tasks.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 27/08/2025.
//

import Foundation

// track the tasks the player has completeted.
///
/// Parameters:
///
///     tasks completed
///     all tasks
func trackTasks(tasksUncompleted: [Task], allTasks: [Task]) -> Bool {
    if tasksUncompleted.count == allTasks.count {
        return true
    } else {
        return false
    }
}

/// print the tasks completed
///
/// parameters:
///
///     Tasks completed
///     all tasks
func printTasks(tasksCompleted: [Task], allTasks: [Task]) {
    print("WGBN Ranger Tasks List: 4rth quarter 2025")
    print("")
    for task in allTasks {
        switch task {
        case .turnOffToMitreTrapLine:
            if tasksCompleted.contains(.turnOffToMitreTrapLine) && tasksCompleted.contains(.mitreTrapLineToAlpine) {
                print("[x] - ", terminator: "")
            } else {
                print("[ ] - ", terminator: "")
            }
            print(task.rawValue)
            
        case .waingawaRiverTrapLine:
            if tasksCompleted.contains(.waingawaRiverTrapLine) && tasksCompleted.contains(.waingawaRiverTrapLineEnd) {
                print("[x] - ", terminator: "")
            } else {
                print("[ ] - ", terminator: "")
            }
            print(task.rawValue)
            
        case .areteStreamTrapLineTurnOff:
            if tasksCompleted.contains(.areteStreamTrapLineTurnOff) && tasksCompleted.contains(.areteStreamTrapLineToAlpine) {
                print("[x] - ", terminator: "")
            } else {
                print("[ ] - ", terminator: "")
            }
            print(task.rawValue)
            
        case .mitreTrapLineToAlpine, .waingawaRiverTrapLineEnd, .areteStreamTrapLineToAlpine:
            continue
        default:
            if tasksCompleted.contains(task) {
                print("[x] - ", terminator: "")
            } else {
                print("[ ] - ", terminator: "")
            }
            print(task.rawValue)
            
            // This will make it clrearer to the player where the particular places.
            instructions()
        }
    }
}


