import GameplayKit

final class Node: GKGridGraphNode {
    private(set) var state: GKStateMachine!
    
    func configure(_ play: PlayState) {
        state = .init(states: [
            DesertState(self, play: play),
            ForestState(self, play: play),
            GreenState(self, play: play),
            PrepareState(self, play: play),
            SeaState(self, play: play)])
    }
}
