import GameplayKit

final class RandomiseState: State {
    private weak var scene: PlayScene!
    private var x = 0
    
    override func didEnter(from: GKState?) {
        super.didEnter(from: from)
        let scene = GKScene(fileNamed: "PlayScene")!.rootNode as! PlayScene
        scene.delegate = view
        self.scene = scene
        view.presentScene(scene, transition: .fade(withDuration: 1.5))
        
        let base = SKShapeNode(rect: .init(x: -100, y: -50, width: 200, height: 100), cornerRadius: 4)
        let loading = SKLabelNode(attributedText: .init(string: .key("RandomiseState.loading"),
                                                        attributes: [.font: NSFont.systemFont(ofSize: 14, weight: .bold),
                                                                     .foregroundColor: NSColor.white]))
        loading.alpha = 0
        loading.verticalAlignmentMode = .center
        scene.camera!.addChild(loading)
        loading.run(.repeatForever(.sequence([.fadeIn(withDuration: 0.5), .wait(forDuration: 1), .fadeOut(withDuration: 0.5)])))
    }
    
    override func update(deltaTime: TimeInterval) {
        guard x < scene.grid.gridWidth else {
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
