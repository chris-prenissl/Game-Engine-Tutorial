//
//  Preferences.swift
//  Game Engine Tutorial
//
//  Created by Christoph Prenissl on 12.11.20.
//

import MetalKit

public enum ClearColor {
    static let white: MTLClearColor = MTLClearColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static let blue: MTLClearColor = MTLClearColor(red: 0.1, green: 0.3, blue: 0.92, alpha: 1.0)
    static let grey: MTLClearColor = MTLClearColor(red: 0.5, green: 0.52, blue: 0.5, alpha: 1.0)
    static let black: MTLClearColor = MTLClearColor(red: 0, green: 0, blue: 0, alpha: 1.0)
}


class Preferences {
    public static var clearColor: MTLClearColor = ClearColor.grey
    
    public static var MainPixelFormat: MTLPixelFormat = MTLPixelFormat.bgra8Unorm
    
    public static var StartingSceneType: SceneTypes = SceneTypes.Sandbox
}
