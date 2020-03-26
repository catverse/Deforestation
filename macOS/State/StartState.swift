import GameplayKit

final class StartState: State {
    override func didEnter(from: GKState?) {
        super.didEnter(from: from)
        let scene = StartScene()
        scene.delegate = view
        view.presentScene(scene, transition: .fade(withDuration: 3))
    }
    
    override func control() {
        guard let _ = press.popLast() else { return }
        stateMachine!.enter(PlayState.self)
    }
}
