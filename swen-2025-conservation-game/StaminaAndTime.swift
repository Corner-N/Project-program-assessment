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
func timeStep(underneathPlayer: String, time:  inout Double, timeMap: [[String]], timeString: inout String) {
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
    timeString = String(format: "%.2f", time)
}

/// Changes the stamina based on the time of day
///
/// Paramenters :
///
///     Map to check where the player is
///     Time
///
