//
//  Functions.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 31/07/2025.
//

import Foundation

/// Gets input from the user and returns it as a string
/// - Parameters:
///   - prompt: The message printed to tell the user what to enter.
///   - errorMessage: The error message the user will see if somehore they don't input a valid string.
func stringInput(prompt: String, errorMessage: String) -> String {
    
    // Put a terminator after the prompt so that the user's input will be on the same line.
    print(prompt, terminator: " ")
    
    // safely set a user string constant to a user input so that it can be read by the input function.
    if let userInput = readLine(){
        
        // Return the string so that the movement function can use it.
        return userInput
    } else {
        
        // The user should never be able to get here.
        print(errorMessage)
        exit(4)
    }
    
}



/// Updates what the player see's every time the player enters somthing.
/// - Parameters:
///   - map: Used to print the map at the right point.
///   - movementReturn: Output from the movement function to determine what kind of input the user entered and whether they were sucsessfull with movement.
///   - timeString: The time which will be displayed rounded to 2dp
///   - food:
///   - descriptionText: The text which tells the user what tile they are standing on.
///   - win: Used to exit The game when the user wins.
///   - allTasks: Pased Into the task printing function.
///   - tasksCompleted: Pased into the task printing function.
func updateGameScene (
    map: [[String]],
    userAction: CorrectUserInputs,
    timeString: String,
    food: Int, alive: Bool,
    descriptionText: String,
    win: Bool,
    allTasks: [Task],
    tasksCompleted: [Task],
    movementOutcome: MovementReturn
) {
    
    
    // Clear the screen so the Screen is clean and can be updated.
    print("\u{001B}[2J")
    
    // Print the map here so that the user can allways
    printMap(gameMap: map)
    
    // I check the win condition here, before I check if the user dies, because if the user dies and wins on the same move, I think they should win, not loose.
    if win {
        print("""
            Well done!!
            You won 
        """)
        
        // Program sleeps here to give the player some time to read th e text before the game exits.
        sleep(4)
        exit(0)
    }
    
    // I check if the player is dead here so that the rest of the information doesn't show when the player dies.
    if !alive {
        print("You ran out of food and died")
        
        // Same as for win condition.
        sleep(4)
        exit(0)
    }
    
    // Print the controlls here so that the player allways sees them right below the map.
    print("""
          Movement controlls: W A S D
          View tasks: T
          Help: H or ?
          
          """)
    
    // This is the information the user will allways need to see.
    print("- The time is: \(timeString)")
    print("- You have: \(food) food left.")
    
    // Print a different message depending on what the user tried to input using a switch statement because there are many cases.
    switch userAction{
        
    // These are the cases for when the player has tried to move.
    case .movementUp, .movementDown, .movementLeft, .movementRight:
        
        print(descriptionText)
        // The colision only needs to display text, because the colision script stops the player from moving before this.
        if movementOutcome == .wall || movementOutcome == .edge {
            print("you cannot go any further")
        }
    
    // These are the cases for menu options which display information to the player.
    case .helpMenu:
        
        // There is lots of text here so it is printed in a funcition.
        MapKey()
        
    case .tasks:
        
        // Prints a complete list of the tasks for the user with the ones they have done being ticked off
        printTasks(tasksCompleted: tasksCompleted, allTasks: allTasks)
        
    case .invalid:
        print("Please enter one of the values above.")
    }
}
