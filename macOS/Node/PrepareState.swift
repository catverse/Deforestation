import GameplayKit

final class PrepareState: NodeState {
    override func didEnter(from: GKState?) {
        play.becomePrepare(node.gridPosition)
    }
}
