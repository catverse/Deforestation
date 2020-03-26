import GameplayKit

final class PlayScene: SKScene {
    private(set) var grid: GKGridGraph<Node>!
    private(set) weak var area: SKTileMapNode!
    private let tileDesert = SKTileGroup(tileDefinition: .init(texture: .init(imageNamed: "tile_desert")))
    private let tilePrepare = SKTileGroup(tileDefinition: .init(texture: .init(imageNamed: "tile_prepare")))
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        grid = .init(fromGridStartingAt: .zero, width: 258, height: 160, diagonalsAllowed: false, nodeClass: Node.self)
        area = childNode(withName: "Area") as? SKTileMapNode
        area.tileSet.tileGroups.append(tilePrepare)
        area.tileSet.tileGroups.append(tileDesert)
        
        let camera = SKCameraNode()
        camera.position = .init(x: 3500, y: 2500)
        addChild(camera)
        self.camera = camera
    }
    
    func becomeDesert(_ node: vector_int2) {
        area.setTileGroup(tileDesert, forColumn: .init(node.x), row: .init(node.y))
    }
    
    func becomePrepare(_ node: vector_int2) {
        area.setTileGroup(tilePrepare, forColumn: .init(node.x), row: .init(node.y))
    }
}
