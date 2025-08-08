//
//  StaminaAndTime.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 04/08/2025.
//

/// Advances time for the game
///
/// Parameters:
///
///     Underneath player: the character which the player is standing on.
///     time: the time of day: will be used to calculate the amount of food used
///     timemap: describes what the character is standing on.
func timeStep(underneathPlayer: String, time:  inout Double, timeMap: [[String]], timeString: inout String) -> Double {
    // Switch statement for different types of things the player could be standing under.
    let oldTime = time
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
    case "_" :
        print("how")
    case "H" :
        print("sleeping at hut")
        time = 8.0
    default :
        print("interesting")
    }
    if time > 24 {
        time = 0
    }
    timeString = String(format: "%.2f", time)
    return oldTime
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
    
    if underneathPlayer == "H" {
        food += 3
    }
    
    //
    if food < 0 {
        alive = false
    } else {
        alive = true
    }
}
