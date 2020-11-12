import MetalKit

public typealias float3 = SIMD3<Float>
public typealias float4 = SIMD4<Float>

class GameView: MTKView {
    
    var renderer: Renderer!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        self.device = MTLCreateSystemDefaultDevice()
        
        Engine.Ignite(device: device!)
        
        self.clearColor = Preferences.clearColor
        self.colorPixelFormat = Preferences.MainPixelFormat
        
        self.renderer = Renderer()
        
        self.delegate = renderer
    }
}
