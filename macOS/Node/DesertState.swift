import GameplayKit

final class DesertState: NodeState {
    override func didEnter(from: GKState?) {
        node.scene.becomeDesert(node.gridPosition)
    }
}
