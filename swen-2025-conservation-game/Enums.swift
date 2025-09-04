//
//  Enums.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 13/08/2025.
//

import Foundation

/// the correct user inputs the user can input.
enum CorrectUserInputs: String {
    
    ///movement
    case movementUp = "w"
    case movementDown = "s"
    case movementLeft = "a"
    case movementRight = "d"
    
    /// menu
    case helpMenu = "?"
    case tasks = "t"
    
    case debug = "debug1"
    case invalid
}

/// the main parts of the map which the user can be standing on.
enum UnderneathMapKey: Int {
    case forest = 0
    case alpine = 1
    case river = 3
    case streams = 2
    case track = 4
    case trapLine = 5
    
    /// This case should never be seen and will result in the program prematurely quitting.
    case walls = 100
}


/// the special parts of the map which hthe user could be standing on.
enum UnderneathMapSpecialKey: Int {
    
    /// Huts and their turn off's
    case turnOffToMitreFlats = 11
    case mitreFlats = 12
    case turnOffToCowCreek = 15
    case cowCreekHut = 14
    case turnOffToMidKingBiv = 17
    case midKingBiv = 16
    case areteForksTurnOff = 27
    case areteForksHut = 26
    case areteHut = 32
    
    /// Trap lines
    case turnOffToMitreTrapLine = 13
    case mitreTrapLineToAlpine = 20
    case alpineToMitreTrapLine = 21
    case waingawaRiverTrapLine = 23
    case waingawaRiverTrapLineEnd = 25
    case areteStreamTrapLineTurnOff = 28
    case areteStreamTrapLineToAlpine = 30
    
    /// Misc
    case firstBridge = 10
    case baldyCreekIntoAlpine = 18
    case alpineToBaldyCreek = 19
    case mitrePeak = 22
    case waingawaRiverCrossing = 24
    case areteTrackToAlpine = 29
    case alpineToAreteStream = 31
}

/// the types of errors the movement code could output
enum MovementReturn {
    
    /// colision
    case good
    case edge
    case wall
}

/// The amount of time eah type of tile takes to travel.
enum Times: Double {
    case forest = 1.0
    case alpine = 0.4
    case river = 0.9
    case streams = 0.7
    case track = 0.2
    case trapline = 0.5
}

/// The text used to describe the nomal parts of the map
enum MainStatements: String {
    case forest = "You strugle slowley through dense bush"
    case alpine = "You walk through long brown grass up to your thighs avoiding nasty speargrass."
    case river = "you hop between boulders and try to keep your feet dry on the riverbed"
    case streams = "you wade through shalow and peacefull steam"
    case track = "a rough and overgrown track is marked with orage triangle nailed to trees"
    case trapLine = """
        as you strugle through the bush to the next peice of blue cruise tape you check traps allong the way, 
        some, which lood like wooden boxes contain rats, mice and stoats, some are nailed to trees with posums 
        underneath.
        """
}

/// The text used to describe the special places the user can go.
enum specialStatements: String {
    
    /// Huts and their turn off's
    case turnOffToMitreFlats = "A sign pointing south says mitre flats hut, to the west it says cow creek hut."
    case mitreFlats = """
        You come to a large hut overlooking a lawn, there is a medium sized stream just south of the hut.
        there is no food left in the ranger's cache at the hut.
        """
    case turnOffToCowCreek = "A sign pointing east indicates cow creek hut. You pick up some oats and BAKED BEANS from the hut's food cache"
    case cowCreekHut = """
        you come to a medium sized bright orange hut on the boudary of beach and podocarp forest, the river 
        can be heard faintly in the distance.
        """
    case turnOffToMidKingBiv = "From the creek a faint path marked with cruise tape leads into the bush to the south."
    case midKingBiv = """
        you come through the dense beach forset to a small patch of flat ground with a tiny bright orange biv.,
        You get two musli bars and a whole cake from the cache
        """
    case areteForksTurnOff = "A small sigh points north indicating arete forks hut."
    case areteForksHut = """
        in a large clearing surounded by old trees lies a bright orange hut. You pick up some wierdly 
        fresh venison and a freese dried meal from the hut.
        """
    case areteHut = """
        A small green biv is perched at the bottom of a slope surounded by towering peaks and overlooking deep valleys. 
        you pick up a half full botle of olive oil, and some frosen cat food.
        """
    
    /// Trap lines
    case turnOffToMitreTrapLine = """
        The path takes a hard right to go north, to the west blue cruise tape heads into the bush. and on 
        a tree is marked 'mitre peak trap line'
        """
    case mitreTrapLineToAlpine = "You come to the first or last trap, on this trap line to the west the opens out into alpine shrub"
    case baldyCreekIntoAlpine = "To the west a small creek petres out as the bush opens out into alpine shrub"
    case alpineToBaldyCreek = "At the tree line to the east you can see the start of a small creek"
    case waingawaRiverTrapLine = "Some cruise tape leads off into the bush, on a tree is marked 'waignawa river trap line'"
    case waingawaRiverTrapLineEnd = "At one of the trap boxes the path stops and makred on the box is an indication that this is the last trap."
    case areteStreamTrapLineTurnOff = "Some cruise tape leads off into the bush, on a tree is marked 'arete stream trap line'"
    case areteStreamTrapLineToAlpine = "the trap line stops at the tree line."
    
    /// Miscilaneus
    case firstBridge = "you come across a moderate swing bridge overlooking a large rapid river."
    case alpineToMitreTrapLine = "at the tree line there is a smal peice of cruise tape marking the strat of a path of some kind."
    case mitrePeak = "A small flat spot marks the top of the highest point in the tararuas, Pukeamoamo"
    case waingawaRiverCrossing = "you some to a decent sise stream with a small bridge crossing it"
    case areteTrackToAlpine = "the small track disapears at the tree line."
    case alpineToAreteStream = "At the tree line some cruise tape leads off into the bush"
}

/// The parts of the map which have tasks asociated with them, and a description for the ones which the user will see in the tasks list.
enum Task: String {
    
    /// Huts
    case cowCreekHut = "check on cow creek hut"
    case midKingBiv = "check on mid king biv"
    case areteForksHut = "check on arete forks hut"
    case areteHut = "check on arete hut"
    
    /// Trap lines.
    case turnOffToMitreTrapLine = "check the mitre peak trap line"
    case waingawaRiverTrapLine = "check the waingawa river trap line"
    case areteStreamTrapLineTurnOff = "check the arete stream trap line"
    
    /// These don't have text asociated with then because they will not be displayed, this is because they are the second part of two part tasks.
    case mitreTrapLineToAlpine
    case waingawaRiverTrapLineEnd
    case areteStreamTrapLineToAlpine
}
