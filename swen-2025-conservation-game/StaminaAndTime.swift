//
//  StaminaAndTime.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 04/08/2025.
//



/// decides whether the player is standing on a normal tile or a special tile.
///
/// parameters:
///
///     number underneath the player.
///     player position
///
/// returns whether the user is on a special title or a normal one.
//func typeofTitle(playerIsStandingOn: Int, playerPosition: [Int]) -> String {
//    player
//}

/// Advances time for the game
///
/// Parameters:
///
///     Underneath player: the character which the player is standing on.
///     time: the time of day: will be used to calculate the amount of food used
///     timemap: describes what the character is standing on.
func timeStep(underneathPlayer: String, time:  inout Double, timeMap: [[String]], timeString: inout String, playerPosition: [Int], oldTime: inout Double) {
    
    // Logs the time before the player moves to be used in the food function.
    let oldTime = time
    
    // Turns the players position on the underneath map into the type of character they are staying on.
    if let playerUnderneathType = UnderneathMapKey(rawValue: underneathMap[playerPosition[0]][playerPosition[1]])  {
        
        // checks which type of tile the player is standing on, and changes the time accordingly.
        switch playerUnderneathType {
        case .track :
            time += 0.2
        case .trapLine :
            time += 0.5
        case .forest :
            time += 1
        case .alpine :
            time += 0.4
        case .streams :
            time += 0.7
        case .river :
            time += 1.2
        case .walls :
            print("how")
            
            if time > 24 {
                time = 0
            }
            
            timeString = String(format: "%.2f", time)        }
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
    
    //
    if food < 0 {
        alive = false
    } else {
        alive = true
    }
}
