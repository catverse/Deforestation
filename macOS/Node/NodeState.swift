import GameplayKit

class NodeState: GKState {
    private(set) weak var node: Node!
    
    init(_ node: Node) {
        super.init()
        self.node = node
    }
}
