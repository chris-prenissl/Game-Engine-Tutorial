//
//  Node.swift
//  Game Engine Tutorial
//
//  Created by Christoph Prenissl on 12.11.20.
//

import MetalKit

class Node {

    var name: String = "Node"
    
    var position: float3 = float3(repeating: 0)
    var scale: float3 = float3(repeating: 1)
    var rotation: float3 = float3(repeating: 0)
    
    var children: [Node] = []
    
    init(name: String = "Node") {
        self.name = name
    }
    
    func addChild(_ child: Node) {
        children.append(child)
    }
    

    var modelMatrix: matrix_float4x4 {
        var modelMatrix = matrix_identity_float4x4
        modelMatrix.translate(direction: position)
        modelMatrix.rotate(angle: rotation.x, axis: X_AXIS)
        modelMatrix.rotate(angle: rotation.y, axis: Y_AXIS)
        modelMatrix.rotate(angle: rotation.z, axis: Z_AXIS)
        modelMatrix.scale(axis: scale)
        
        return modelMatrix
    }
    
    func update(deltaTime: Float) {
        for child in children {
            child.update(deltaTime: deltaTime)
        }
    }
    
    func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        
        renderCommandEncoder.pushDebugGroup("Rendering \(name)")
        for child in children {
            child.render(renderCommandEncoder: renderCommandEncoder)
        }
        
        if let renderable = self as? Renderable {
            renderable.doRender(renderCommandEncoder)
        }
        renderCommandEncoder.popDebugGroup()
    }
}
