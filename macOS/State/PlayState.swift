import GameplayKit

final class PlayState: State {
    
    override func didEnter(from: GKState?) {
        super.didEnter(from: from)
    }
    
    override func control() {
        guard let press = self.press.popLast() else { return }
//        scene.area.setTileGroup(tilePrepare, forColumn: scene.area.tileColumnIndex(fromPosition: press), row: scene.area.tileRowIndex(fromPosition: press))
    }
    
    
}
