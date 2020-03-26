import GameplayKit

final class PlayScene: SKScene {
    private(set) var grid: GKGridGraph<Node>!
    private(set) weak var area: SKTileMapNode!
    private weak var nudge: SKShapeNode!
    private weak var message: SKShapeNode!
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
        
        let nudge = SKShapeNode(rect: .init(x: -100, y: -20, width: 200, height: 40), cornerRadius: 6)
        nudge.fillColor = .init(white: 0, alpha: 0.8)
        nudge.strokeColor = .clear
        nudge.alpha = 0
        self.nudge = nudge
        camera.addChild(nudge)

        let message = SKShapeNode(rect: .init(x: -300, y: 0, width: 600, height: 50), cornerRadius: 25)
        message.fillColor = .black
        message.strokeColor = .white
        message.lineWidth = 2
        message.alpha = 0
        self.message = message
        camera.addChild(message)
        
        reposition()
    }
    
    func reposition() {
        message.position.y = -((NSApp.mainWindow!.frame.height / 2) - 10)
    }
    
    func becomeDesert(_ node: vector_int2) {
        area.setTileGroup(tileDesert, forColumn: .init(node.x), row: .init(node.y))
    }
    
    func becomePrepare(_ node: vector_int2) {
        area.setTileGroup(tilePrepare, forColumn: .init(node.x), row: .init(node.y))
    }
    
    func showNudge(_ text: String) {
        nudge.children.forEach { $0.removeFromParent() }
        let text = SKLabelNode(attributedText: .init(string: text, attributes: [.font: NSFont.systemFont(ofSize: 14, weight: .bold), .foregroundColor: NSColor.white]))
        text.verticalAlignmentMode = .center
        nudge.addChild(text)
        nudge.run(.fadeIn(withDuration: 0.5))
    }
    
    func hideNudge() {
        nudge.run(.fadeOut(withDuration: 0.5))
    }
    
    func showMessage(_ text: String) {
        message.children.forEach { $0.removeFromParent() }
        let text = SKLabelNode(attributedText: .init(string: text, attributes: [.font: NSFont.systemFont(ofSize: 18, weight: .medium), .foregroundColor: NSColor.white]))
        text.verticalAlignmentMode = .center
        text.position.y = 25
        message.addChild(text)
        message.run(.fadeIn(withDuration: 0.5))
    }
    
    func hideMessage() {
        message.run(.fadeOut(withDuration: 0.5))
    }
}
