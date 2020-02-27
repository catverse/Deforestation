import GameplayKit

final class PlayState: State {
    override func didEnter(from: GKState?) {
        super.didEnter(from: from)
        if !(view.scene is PlayScene) {
            view.presentScene(GKScene(fileNamed: "PlayScene")!.rootNode as! PlayScene, transition: .fade(withDuration: 1.5))
        }
    }
}
