//
//  GameObject.swift
//  Game Engine Tutorial
//
//  Created by Christoph Prenissl on 12.11.20.
//

import MetalKit

class GameObject: Node {
    
    var modelConstants = ModelConstants()
    
    var mesh: Mesh!
    
    init(meshType: MeshTypes) {
        mesh = MeshLibrary.Mesh(meshType)
    }
    
    override func update(deltaTime: Float) {
        updateModelConstants()
    }
    
    private func updateModelConstants() {
        modelConstants.modelMatrix = self.modelMatrix
    }
}

extension GameObject: Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.PipelineState(.Basic))
        renderCommandEncoder.setDepthStencilState(DepthStencilStateLibrary.DepthStencilState(.Less))
        renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.setVertexBytes(&modelConstants, length: ModelConstants.stride, index: 2)
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: mesh.vertexCount)
    }
}
