//
//  MeshLibrary.swift
//  Game Engine Tutorial
//
//  Created by Christoph Prenissl on 12.11.20.
//

import MetalKit

enum MeshTypes {
    case Triangle_Custom
    case Quad_Custom
    case Cube_Custom
}


class MeshLibrary {
    
    private static var meshes: [MeshTypes: Mesh] = [:]
    
    public static func initialize() {
        createDefaultMeshes()
    }
    
    private static func createDefaultMeshes() {
        meshes.updateValue(Triangle_CustomMesh(), forKey: .Triangle_Custom)
        meshes.updateValue(Quad_CustomMesh(), forKey: .Quad_Custom)
        meshes.updateValue(Cube_CustomMesh(), forKey: .Cube_Custom)
    }
    
    public static func Mesh(_ meshType: MeshTypes) -> Mesh {
        return meshes[meshType]!
    }
}


protocol Mesh {
    var vertexBuffer: MTLBuffer! { get }
    var vertexCount: Int! { get }
    func setInstanceCount(_ count: Int)
    func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder)
}

class CustomMesh: Mesh {
    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!
    var vertexCount: Int! {
        return vertices.count
    }
    var instanceCount: Int = 1
    
    init() {
        createVertices()
        createBuffers()
    }
    
    func createVertices() {}
    
    func createBuffers() {
        vertexBuffer = Engine.Device.makeBuffer(bytes: vertices, length: Vertex.stride(vertices.count), options: [])
    }
    
    func setInstanceCount(_ count: Int) {
        self.instanceCount = count
    }
    
    func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertexCount, instanceCount: instanceCount)
    }
    
}

class Triangle_CustomMesh: CustomMesh {
    
    override func createVertices() {
        vertices = [
            Vertex(position: float3(0, 1, 0), color: float4(1,0,0,1)),
            Vertex(position: float3(-1,-1,0), color: float4(0,1,0,1)),
            Vertex(position: float3( 1,-1,0), color: float4(0,0,1,1))
        ]
    }
}

class Quad_CustomMesh: CustomMesh {
    
    override func createVertices() {
        vertices = [
            Vertex(position: float3(1, 1, 0), color: float4(1,0,0,1)),
            Vertex(position: float3(-1,1,0), color: float4(0,1,0,1)),
            Vertex(position: float3(-1,-1,0), color: float4(0,0,1,1)),
            
            Vertex(position: float3(1, 1, 0), color: float4(1,0,0,1)),
            Vertex(position: float3(-1,-1,0), color: float4(0,0,1,1)),
            Vertex(position: float3(1,-1,0), color: float4(1,0,1,1))
        ]
    }
}

class Cube_CustomMesh: CustomMesh {
    override func createVertices() {
           vertices = [
               //Left
               Vertex(position: float3(-1.0,-1.0,-1.0), color: float4(1.0, 0.5, 0.0, 1.0)),
               Vertex(position: float3(-1.0,-1.0, 1.0), color: float4(0.0, 1.0, 0.5, 1.0)),
               Vertex(position: float3(-1.0, 1.0, 1.0), color: float4(0.0, 0.5, 1.0, 1.0)),
               Vertex(position: float3(-1.0,-1.0,-1.0), color: float4(1.0, 1.0, 0.0, 1.0)),
               Vertex(position: float3(-1.0, 1.0, 1.0), color: float4(0.0, 1.0, 1.0, 1.0)),
               Vertex(position: float3(-1.0, 1.0,-1.0), color: float4(1.0, 0.0, 1.0, 1.0)),
               
               //RIGHT
               Vertex(position: float3( 1.0, 1.0, 1.0), color: float4(1.0, 0.0, 0.5, 1.0)),
               Vertex(position: float3( 1.0,-1.0,-1.0), color: float4(0.0, 1.0, 0.0, 1.0)),
               Vertex(position: float3( 1.0, 1.0,-1.0), color: float4(0.0, 0.5, 1.0, 1.0)),
               Vertex(position: float3( 1.0,-1.0,-1.0), color: float4(1.0, 1.0, 0.0, 1.0)),
               Vertex(position: float3( 1.0, 1.0, 1.0), color: float4(0.0, 1.0, 1.0, 1.0)),
               Vertex(position: float3( 1.0,-1.0, 1.0), color: float4(1.0, 0.5, 1.0, 1.0)),
               
               //TOP
               Vertex(position: float3( 1.0, 1.0, 1.0), color: float4(1.0, 0.0, 0.0, 1.0)),
               Vertex(position: float3( 1.0, 1.0,-1.0), color: float4(0.0, 1.0, 0.0, 1.0)),
               Vertex(position: float3(-1.0, 1.0,-1.0), color: float4(0.0, 0.0, 1.0, 1.0)),
               Vertex(position: float3( 1.0, 1.0, 1.0), color: float4(1.0, 1.0, 0.0, 1.0)),
               Vertex(position: float3(-1.0, 1.0,-1.0), color: float4(0.5, 1.0, 1.0, 1.0)),
               Vertex(position: float3(-1.0, 1.0, 1.0), color: float4(1.0, 0.0, 1.0, 1.0)),
               
               //BOTTOM
               Vertex(position: float3( 1.0,-1.0, 1.0), color: float4(1.0, 0.5, 0.0, 1.0)),
               Vertex(position: float3(-1.0,-1.0,-1.0), color: float4(0.5, 1.0, 0.0, 1.0)),
               Vertex(position: float3( 1.0,-1.0,-1.0), color: float4(0.0, 0.0, 1.0, 1.0)),
               Vertex(position: float3( 1.0,-1.0, 1.0), color: float4(1.0, 1.0, 0.5, 1.0)),
               Vertex(position: float3(-1.0,-1.0, 1.0), color: float4(0.0, 1.0, 1.0, 1.0)),
               Vertex(position: float3(-1.0,-1.0,-1.0), color: float4(1.0, 0.5, 1.0, 1.0)),
               
               //BACK
               Vertex(position: float3( 1.0, 1.0,-1.0), color: float4(1.0, 0.5, 0.0, 1.0)),
               Vertex(position: float3(-1.0,-1.0,-1.0), color: float4(0.5, 1.0, 0.0, 1.0)),
               Vertex(position: float3(-1.0, 1.0,-1.0), color: float4(0.0, 0.0, 1.0, 1.0)),
               Vertex(position: float3( 1.0, 1.0,-1.0), color: float4(1.0, 1.0, 0.0, 1.0)),
               Vertex(position: float3( 1.0,-1.0,-1.0), color: float4(0.0, 1.0, 1.0, 1.0)),
               Vertex(position: float3(-1.0,-1.0,-1.0), color: float4(1.0, 0.5, 1.0, 1.0)),
               
               //FRONT
               Vertex(position: float3(-1.0, 1.0, 1.0), color: float4(1.0, 0.5, 0.0, 1.0)),
               Vertex(position: float3(-1.0,-1.0, 1.0), color: float4(0.0, 1.0, 0.0, 1.0)),
               Vertex(position: float3( 1.0,-1.0, 1.0), color: float4(0.5, 0.0, 1.0, 1.0)),
               Vertex(position: float3( 1.0, 1.0, 1.0), color: float4(1.0, 1.0, 0.5, 1.0)),
               Vertex(position: float3(-1.0, 1.0, 1.0), color: float4(0.0, 1.0, 1.0, 1.0)),
               Vertex(position: float3( 1.0,-1.0, 1.0), color: float4(1.0, 0.0, 1.0, 1.0))
           ]
       }
}
