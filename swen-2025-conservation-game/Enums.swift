//
//  Enums.swift
//  swen-2025-conservation-game
//
//  Created by Conor Newdick on 13/08/2025.
//

/// the correct user inputs the user can input.
enum CorrectUserInputs: String {
    ///movement
    case movementUp = "w"
    case movementDown = "s"
    case movementRight = "d"
    case movementLeft = "a"
    /// menu
    case helpMenu1 = "h"
    case helpMenu2 = "?"
}

/// the main parts of the map which the user can be standing on.
enum UnderneathMapKey: Int {
    case forest = 0
    case alpine = 1
    case streams = 2
    case river = 3
    case track = 4
    case trapLine = 5
    case walls = 100
}


/// the special parts of the map which hthe user could be standing on.
enum UnderneathMapSpecialKey: Int {
    case firstBridge = 10
    case turnOffToMitreFlats = 11
    case mitreFlats = 12
    case turnOffToMitreTrapLine = 13
    case cowCreekHut = 14
    case turnOffToCowCreek = 15
    case midKingBiv = 16
    case turnOffToMidKingBiv = 17
    case baldyCreekIntoAlpine = 18
    case alpineToBaldyCreek = 19
    case mitreTrapLineToAlpine = 20
    case alpineToMitreTrapLine = 21
    case mitrePeak = 22
    case waingawaRiverCrossing = 23
    case waingawaRiverTrapLine = 24
    case waingawaRiverTrapLineEnd = 25
    case areteForksHut = 26
    case areteForksTurnOff = 27
    case areteStreamTrapLineTurnOff = 28
    case areteTrackToAlpine = 29
    case areteStreamTrapLineToAlpine = 30
    case alpineToAreteStream = 31
    case areteHut = 32
}

/// the types of errors the movement code could output
enum MovementReturn {
    case good
    case edge
    case wall
    case tutorial
    case invalid
    case bigError
}

enum Times: Double {
    case forest = 1.0
    case alpine = 0.4
    case track = 0.2
    case trapline = 0.5
    case streams = 0.7
    case river = 1.2
    
    var description:Double {
        return self.rawValue
    }
}

enum MainStatements: String {
    case forest = "forest"
    case alpine = "alpine"
    case streams = "stream"
    case river = "river"
    case track = "track"
    case trapLine = "trapline"
    case walls = "error"
}

enum specialStatements: String {
    case firstBridge = "first bridge" //
    case turnOffToMitreFlats = "turn off to mitre flats"//
    case mitreFlats = "mittle flats"//
    case turnOffToMitreTrapLine = "turn off to mitre trap line"//
    case cowCreekHut = "cow creek hut"//
    case turnOffToCowCreek = "turn off to cow creek"//
    case midKingBiv = "mid king biv"//
    case turnOffToMidKingBiv = "turn off to mid king biv"//
    case baldyCreekIntoAlpine = "baldy creek into alpine"//
    case alpineToBaldyCreek = "alpine to baldy creek"//
    case mitreTrapLineToAlpine = "mitre trap line to alpine"//
    case alpineToMitreTrapLine = "alpine to mitre trap line"//
    case mitrePeak = "mitre peak"//
    case waingawaRiverCrossing = "waingawa river crossing"//
    case waingawaRiverTrapLine = "waingawa river trap line"//
    case waingawaRiverTrapLineEnd = "waingawa river trap line end"//
    case areteForksHut = "arete forks hut"//
    case areteForksTurnOff = "arete forks turn off"//
    case areteStreamTrapLineTurnOff = "arete stream trap line turn off"//
    case areteTrackToAlpine = "arete track to alpine"//
    case areteStreamTrapLineToAlpine = "arete stream trap line to alpine"
    case alpineToAreteStream = "alpine to arete stream"//
    case areteHut = "arete hut"//
}


