import GameplayKit

final class PlayState: State {
    private weak var scene: PlayScene!
    private let tileDesert = SKTileGroup(tileDefinition: .init(texture: .init(imageNamed: "tile_desert")))
    private let tilePrepare = SKTileGroup(tileDefinition: .init(texture: .init(imageNamed: "tile_prepare")))
    
    override func didEnter(from: GKState?) {
        super.didEnter(from: from)
        if !(view.scene is PlayScene) {
            let scene = GKScene(fileNamed: "PlayScene")!.rootNode as! PlayScene
            scene.area.tileSet.tileGroups.append(tilePrepare)
            scene.area.tileSet.tileGroups.append(tileDesert)
            scene.delegate = view
            self.scene = scene
            
            (0 ..< scene.grid.gridWidth).forEach { x in
                (0 ..< scene.grid.gridHeight).forEach { y in
                    let node = scene.grid.node(atGridPosition: .init(.init(x), .init(y)))!
                    node.configure(self)
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
    
    override func control() {
        guard let press = self.press.popLast() else { return }
        scene.area.setTileGroup(tilePrepare, forColumn: scene.area.tileColumnIndex(fromPosition: press), row: scene.area.tileRowIndex(fromPosition: press))
    }
    
    func becomeDesert(_ node: vector_int2) {
        scene.area.setTileGroup(tileDesert, forColumn: .init(node.x), row: .init(node.y))
    }
    
    func becomePrepare(_ node: vector_int2) {
        scene.area.setTileGroup(tilePrepare, forColumn: .init(node.x), row: .init(node.y))
    }
}
