import GameplayKit

class NodeState: GKState {
    private(set) weak var node: Node!
    private(set) weak var play: PlayState!
    
    init(_ node: Node, play: PlayState) {
        super.init()
        self.node = node
        self.play = play
    }
}
