//
//  DepthStencilStateLibrary.swift
//  Game Engine Tutorial
//
//  Created by Christoph Prenissl on 30.11.20.
//

import MetalKit

enum DepthStencilStateTypes {
    case Less
}

class DepthStencilStateLibrary {
    
    private static var _depthStencilStates: [DepthStencilStateTypes: DepthStencilState] = [:]

    public static func Initialize() {
            createDefaultDepthStencilState()
    }
    
    private static func createDefaultDepthStencilState() {
        _depthStencilStates.updateValue(Less_DepthStencilState(), forKey: .Less)
    }
    
    public static func DepthStencilState(_ depthStencilStateType: DepthStencilStateTypes) -> MTLDepthStencilState {
        return _depthStencilStates[depthStencilStateType]!.depthStencilState
    }
    
    
}


protocol DepthStencilState {
    
    var depthStencilState: MTLDepthStencilState! { get }

}

class Less_DepthStencilState: DepthStencilState {
    
    var depthStencilState: MTLDepthStencilState!
    
    
    init() {
        let depthStencilDescriptor = MTLDepthStencilDescriptor()
        depthStencilDescriptor.isDepthWriteEnabled = true
        depthStencilDescriptor.depthCompareFunction = .less
        depthStencilState = Engine.Device.makeDepthStencilState(descriptor: depthStencilDescriptor)
    }
}
