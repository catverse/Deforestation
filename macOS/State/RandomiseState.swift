import GameplayKit

final class RandomiseState: State {
    private weak var scene: PlayScene!
    private var x = 0
    
    override func didEnter(from: GKState?) {
        super.didEnter(from: from)
        let scene = GKScene(fileNamed: "PlayScene")!.rootNode as! PlayScene
        scene.delegate = view
        view.presentScene(scene, transition: .fade(withDuration: 1.5))
        scene.showNudge(.key("RandomiseState.loading"))
        self.scene = scene
    }
    
    override func update(deltaTime: TimeInterval) {
        guard x < scene.grid.gridWidth else {
            scene.hideNudge()
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
