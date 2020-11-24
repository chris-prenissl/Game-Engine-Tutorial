//
//  SandboxScene.swift
//  Game Engine Tutorial
//
//  Created by Christoph Prenissl on 16.11.20.
//

import MetalKit

class SandboxScene: Scene {
    
    var debugCamera: DebugCamera = DebugCamera()
    
    override func buildScene() {
        
        addCamera(debugCamera)
        
        let count: Int = 5
        for y in -count..<count {
            for x in -count..<count {
                let pointer = Pointer(camera: cameraManager.currentCamera)
                pointer.position.y = Float(Float(y) + 0.5) / Float(count)
                pointer.position.x = Float(Float(x) + 0.5) / Float(count)
                pointer.scale = float3(repeating: 0.1)
                addChild(pointer)
            }
        }
    }
}
