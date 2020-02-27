import GameplayKit

final class DesertState: NodeState {
    override func didEnter(from: GKState?) {
        play.becomeDesert(node.gridPosition)
    }
}
