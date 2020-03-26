import SpriteKit

final class StartScene: SKScene {
    required init?(coder: NSCoder) { nil }
    override init() {
        super.init(size: .zero)
        backgroundColor = .black
        anchorPoint = .init(x: 0.5, y: 0.5)
        scaleMode = .resizeFill
        
        let press = SKLabelNode(text: NSLocalizedString("StartScene.press", comment: ""))
        press.alpha = 0
        press.fontColor = .white
        press.fontSize = 16
        press.verticalAlignmentMode = .center
        addChild(press)
        press.run(.repeatForever(.sequence([.fadeIn(withDuration: 0.5), .wait(forDuration: 1), .fadeOut(withDuration: 0.5)])))
    }
}
