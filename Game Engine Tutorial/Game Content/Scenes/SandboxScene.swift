//
//  SandboxScene.swift
//  Game Engine Tutorial
//
//  Created by Christoph Prenissl on 16.11.20.
//

import MetalKit

class SandboxScene: Scene {
    
    var debugCamera: DebugCamera = DebugCamera()
    var cubeCollection1: CubeCollection!
    var cubeCollection2: CubeCollection!
    
    override func buildScene() {
        
        addCamera(debugCamera)
        
        debugCamera.position.z = 100
        
        addCubes()
    }
    
    
    func addCubes() {
        cubeCollection1 = CubeCollection(cubesWide: 10, cubesHigh: 10, cubesBack: 10)
        cubeCollection1.position.x -= 16
        cubeCollection2 = CubeCollection(cubesWide: 10, cubesHigh: 10, cubesBack: 10)
        addChild(cubeCollection1)
        addChild(cubeCollection2)
    }
    
    override func update(deltaTime: Float) {
        
        cubeCollection1.rotation.z += deltaTime
        cubeCollection2.rotation.z -= deltaTime
        
        super.update(deltaTime: deltaTime)
    }
}
