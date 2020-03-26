import GameplayKit

final class RandomiseState: State {
    override func didEnter(from: GKState?) {
        super.didEnter(from: from)
        if !(view.scene is PlayScene) {
            let scene = GKScene(fileNamed: "PlayScene")!.rootNode as! PlayScene
            scene.delegate = view
            
            (0 ..< scene.grid.gridWidth).forEach { x in
                (0 ..< scene.grid.gridHeight).forEach { y in
                    let node = scene.grid.node(atGridPosition: .init(.init(x), .init(y)))!
                    node.scene = scene
                    if scene.area.tileDefinition(atColumn: x, row: y) == nil {
                        node.state.enter(SeaState.self)
                    } else {
                        switch Int.random(in: 0 ..< 2) {
                        case 1: node.state.enter(PrepareState.self)
                        default: node.state.enter(DesertState.self)
                        }
                    }
                }
            }
            
            view.presentScene(scene, transition: .fade(withDuration: 1.5))
        }
    }
}
