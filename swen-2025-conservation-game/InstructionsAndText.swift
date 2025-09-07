//
//  InstructionsAndText.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 28/08/2025.
//

import Foundation



/// Displays the key for controls and what the different parts of the map mean
func MapKey () {
    print("""
    
    Map key:
    ^   Is forest area - moving in this area will take a long time.
    ,   Is alpine area - moving in this area will not take very long.
    ∙   Is a track - moving here will not take much time at all
    °   Is a trap line - moving here will take longer than a track but is still fast.
    ≈   Is a river - this won't take as long as forest but is still slow.
    ~   Is a stream - moving here isn't fast but it's better than bush bashing.
    -   Is a bridge - this takes as long as a track.
    _   Is a gorge - don't even try.
    |   Is a cliff - are you trying to get killed.
    H   Is a hut 
    """)
}

/// the instructions on how to complete the particular tasks
func instructions() {
    print("""
        Instructions for tasks
        
        - The mitre creek trap line starts on the main track just before the track swings north after mitre flats. 
          It ends at the bushline just below mitre peak.
        - The waignawa river trap line starts just before the bridge across the waignawa river near arete forks hut.
          It ends at the bushline along the rigline south east of arete hut.
        - Arete stream trap line branches off the main track just after arete forks hut. It ends at the tree line on this ridge just east of arete hut.
        
        - Cow creek hut is located on the main track on the banks of the waingawa river north of mitre flats hut.
        - mid king biv is located just off the side of baldy creek near the tree line west of mitre flats hut.
        - arete forks hut is locted on the main track where arete stream forks from the waingawa river.
        - arete hut is located at the headwaters of arete stream above the bushline to the north west of arete forks hut.
        
        """)
}

/// Text shown at the begining of the game explaining the backstory and such.
///
/// parameters:
///
///     map
///     tasks the user has completed
///     all tasks
func startGame(map: [[String]], taskscompleted: [Task], alltasks: [Task]) {
    print("""
        ██╗    ██╗███████╗██╗     ██╗      ██████╗ ██████╗ ███╗   ███╗███████╗
        ██║    ██║██╔════╝██║     ██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝
        ██║ █╗ ██║█████╗  ██║     ██║     ██║     ██║   ██║██╔████╔██║█████╗  
        ██║███╗██║██╔══╝  ██║     ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  
        ╚███╔███╔╝███████╗███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗
         ╚══╝╚══╝ ╚══════╝╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝
        
        ████████╗ ██████╗      ██████╗ ██╗    ██╗██████╗ ███╗   ██╗                   
        ╚══██╔══╝██╔═══██╗    ██╔════╝ ██║    ██║██╔══██╗████╗  ██║                   
           ██║   ██║   ██║    ██║  ███╗██║ █╗ ██║██████╔╝██╔██╗ ██║                   
           ██║   ██║   ██║    ██║   ██║██║███╗██║██╔══██╗██║╚██╗██║                   
           ██║   ╚██████╔╝    ╚██████╔╝╚███╔███╔╝██████╔╝██║ ╚████║                   
           ╚═╝    ╚═════╝      ╚═════╝  ╚══╝╚══╝ ╚═════╝ ╚═╝  ╚═══╝                   
                                                                                      
        ██████╗  █████╗ ███╗   ██╗ ██████╗ ███████╗██████╗                            
        ██╔══██╗██╔══██╗████╗  ██║██╔════╝ ██╔════╝██╔══██╗                           
        ██████╔╝███████║██╔██╗ ██║██║  ███╗█████╗  ██████╔╝                           
        ██╔══██╗██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██╔══██╗                           
        ██║  ██║██║  ██║██║ ╚████║╚██████╔╝███████╗██║  ██║                           
        ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝                           
                                                                                      
        ███████╗██╗███╗   ███╗██╗   ██╗██╗      █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
        ██╔════╝██║████╗ ████║██║   ██║██║     ██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
        ███████╗██║██╔████╔██║██║   ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║
        ╚════██║██║██║╚██╔╝██║██║   ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
        ███████║██║██║ ╚═╝ ██║╚██████╔╝███████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
        ╚══════╝╚═╝╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
        
        Press enter
        """, terminator: "")
    
    // makes the user press enter to continue.
    let _ = readLine()
    print("\u{001B}[2J")
    
    print("""
        GWBN, in case you didn't know is a volunteer program based in the lower north island. 
        Which maintains much of the backcountry infrastructure here, like huts tracks and traplines. 
        """)
    
    // makes the user press enter to continue.
    let _ = readLine()
    print("\u{001B}[2J")
    
    print("""
          In this game you will learn about the kinds of tasks you will need to carry out as a GWBN volunteer ranger.
          
          press enter
          """, terminator: "")
    
    // makes the user press enter to continue.
    let _ = readLine()
    print("\u{001B}[2J")
    
    print("""
        The tasks you will carry out will include:
        
        - Checking on huts 
        - Cheking on trap lines
        
        press enter
        """, terminator: "")
    
    // Makes the user press enter to continue
    let _ = readLine()
    print("\u{001B}[2J")
    
    // Show the user what the map looks like.
    printMap(gameMap: map)
    print("""
    
    This is the map you will use to play the game.
    
    press enter:
    """, terminator: "")
    
    // Makes the user press enter to continue
    let _ = readLine()
    print("\u{001B}[2J")
    
    print("""
        Use the W A S D keys to move around the map
        
        press enter
        """, terminator: "")
    
    // Makes the user press enter to continue
    let _ = readLine()
    print("\u{001B}[2J")
    
    printMap(gameMap: map)
    print("""
        
        Your player character is represented by \u{001B}[32m@\u{001B}[0m
        
        press enter:
        """, terminator: "")
    
    // Makes the user press enter to continue
    let _ = readLine()
    print("\u{001B}[2J")
    
    print("""
        As you move around the map it will get later in the day.
        
        press enter: 
        """, terminator: "")
    
    // Makes the user press enter to continue
    let _ = readLine()
    print("\u{001B}[2J")

    print("""
        At 8 oclock, 12.5 oclock, 18 oclock, and midnight, you will need to eat food 
        
        Make sure you don't run out!
        
        press enter: 
        """, terminator: "")
    
    // Makes the user press enter to continue
    let _ = readLine()
    print("\u{001B}[2J")
    
    print("""
        Different types of terrain will take different amounts of time to travel allong 
        
        press enter: 
        """, terminator: "")
    
    // Makes the user press enter to continue
    let _ = readLine()
    print("\u{001B}[2J")
    
    MapKey()
    print("press enter: ", terminator: "")
    
    // Makes the user press enter to continue
    let _ = readLine()
    print("\u{001B}[2J")
    
    print("These are your tasks, go to all these places and check on them")
    printTasks(tasksCompleted: taskscompleted, allTasks: alltasks)
    print("press enter: ", terminator: "")
    
    let _ = readLine()
    print("\u{001B}[2J")
}



