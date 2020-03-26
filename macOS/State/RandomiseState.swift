import GameplayKit

final class RandomiseState: State {
    private weak var scene: PlayScene!
    private weak var base: SKShapeNode!
    private var x = 0
    
    override func didEnter(from: GKState?) {
        super.didEnter(from: from)
        let scene = GKScene(fileNamed: "PlayScene")!.rootNode as! PlayScene
        scene.delegate = view
        self.scene = scene
        view.presentScene(scene, transition: .fade(withDuration: 1.5))
        
        let base = SKShapeNode(rect: .init(x: -70, y: -20, width: 140, height: 40), cornerRadius: 6)
        base.fillColor = .init(white: 0, alpha: 0.9)
        base.strokeColor = .clear
        base.alpha = 0
        self.base = base
        
        let loading = SKLabelNode(attributedText: .init(string: .key("RandomiseState.loading"),
                                                        attributes: [.font: NSFont.systemFont(ofSize: 14, weight: .bold),
                                                                     .foregroundColor: NSColor.white]))
        loading.verticalAlignmentMode = .center
        base.addChild(loading)
        scene.camera!.addChild(base)
        base.run(.fadeIn(withDuration: 0.5))
    }
    
    override func update(deltaTime: TimeInterval) {
        guard x < scene.grid.gridWidth else {
            base.removeFromParent()
            stateMachine!.enter(PlayState.self)
            return
        }
        (0 ..< scene.grid.gridHeight).forEach {
            let node = scene.grid.node(atGridPosition: .init(.init(x), .init($0)))!
            node.scene = scene
            if scene.area.tileDefinition(atColumn: x, row: $0) == nil {
                node.state.enter(SeaState.self)
            } else {
                switch Int.random(in: 0 ..< 2) {
                case 1: node.state.enter(PrepareState.self)
                default: node.state.enter(DesertState.self)
                }
            }
        }
        x += 1
    }
}
