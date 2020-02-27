import GameplayKit

final class PlayState: State {
    private weak var scene: PlayScene!
    
    override func didEnter(from: GKState?) {
        super.didEnter(from: from)
        if !(view.scene is PlayScene) {
            let scene = GKScene(fileNamed: "PlayScene")!.rootNode as! PlayScene
            view.presentScene(scene, transition: .fade(withDuration: 1.5))
            self.scene = scene
        }
    }
    
    override func control() {
        guard let press = self.press.popLast() else { return }
//        scene.area.tilede
//        
//        let group = SKTileGroup(tileDefinition: .init(texture: .init(imageNamed: "tile_desert")))
//        area.tileSet.tileGroups.append(group)
//        area.setTileGroup(group, forColumn: 258 / 2, row: 80)
    }
}
