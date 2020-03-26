import GameplayKit

final class PlayScene: SKScene {
    private(set) weak var area: SKTileMapNode!
    private(set) var grid: GKGridGraph<Node>!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        grid = .init(fromGridStartingAt: .zero, width: 258, height: 160, diagonalsAllowed: false, nodeClass: Node.self)
        area = childNode(withName: "Area") as? SKTileMapNode
        
        let camera = SKCameraNode()
        camera.position = .init(x: 3500, y: 2500)
        addChild(camera)
        self.camera = camera
    }
}
