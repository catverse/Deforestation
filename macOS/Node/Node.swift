import GameplayKit

final class Node: GKGridGraphNode {
    weak var scene: PlayScene!
    private(set) var state: GKStateMachine!
    
    required init?(coder: NSCoder) { nil }
    override init(gridPosition: vector_int2) {
        super.init(gridPosition: gridPosition)
        state = .init(states: [
            DesertState(self),
            ForestState(self),
            GreenState(self),
            PrepareState(self),
            SeaState(self)])
    }
}
