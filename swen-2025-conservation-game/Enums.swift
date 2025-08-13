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


let main = UnderneathMapKey.forest
