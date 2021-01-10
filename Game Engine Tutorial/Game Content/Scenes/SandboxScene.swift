//
//  SandboxScene.swift
//  Game Engine Tutorial
//
//  Created by Christoph Prenissl on 16.11.20.
//

import MetalKit

class SandboxScene: Scene {
    
    var debugCamera: DebugCamera = DebugCamera()
    var cube = Cube()
    
    override func buildScene() {
        
        addCamera(debugCamera)
        
        debugCamera.position.z = 30
        
        addCubes()
    }
    
    func addCubes() {
        for y in -20..<20 {
            let posY = Float(y) + 0.5
            for x in -24..<24 {
                let posX = Float(x) + 0.5
                let cube = Cube()
                cube.position.y = posY
                cube.position.x = posX
                cube.scale = float3(repeating: 0.1)
                cube.setColor(ColorUtil.randomColor)
                addChild(cube)
            }
        }
    }
}
