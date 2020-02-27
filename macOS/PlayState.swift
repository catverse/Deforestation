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
            view.presentScene(scene, transition: .fade(withDuration: 1.5))
            self.scene = scene
        }
    }
    
    override func control() {
        guard let press = self.press.popLast() else { return }
        scene.area.setTileGroup(tilePrepare, forColumn: scene.area.tileColumnIndex(fromPosition: press), row: scene.area.tileRowIndex(fromPosition: press))
    }
}
