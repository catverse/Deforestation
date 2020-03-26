import GameplayKit

final class PrepareState: NodeState {
    override func didEnter(from: GKState?) {
        node.scene.becomePrepare(node.gridPosition)
    }
}
