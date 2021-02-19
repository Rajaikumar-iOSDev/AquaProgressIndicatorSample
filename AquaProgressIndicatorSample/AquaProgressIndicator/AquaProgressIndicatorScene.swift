
import SpriteKit

class AquaProgressIndicatorScene: SKScene {
    var WaterNode: DynamicWaterNode!
    var scoreLabel: SKLabelNode!

    var score = 0 {
        didSet {
            scoreLabel.text = "\(score)%"
        }
    }
    private let WaterColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.5)
    static var surfaceHeight: CGFloat = 200
    let fixedTimeStep: TimeInterval = 1.0 / 500
    //Override Init function
    override init(size: CGSize) {



        super.init(size: size)
        scoreLabel = SKLabelNode(fontNamed: "HelveticaNeue")
        scoreLabel.text = "0%"
        scoreLabel.fontColor = .darkGray
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.position = CGPoint(x: 140, y: 100 )
        self.addChild(scoreLabel)
        prepareWaterNode()
        let shader = prepareWaterReflectionShader()
        WaterNode.effectNode.shader = shader

        WaterDisturbanceAction()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func changeWaterLevel(to level:CGFloat) {
        let temp = level*100
        score = Int(temp)
        let scale = SKAction.scaleY(to: level, duration: 1)
        self.WaterNode.run(scale)
    }
    private func prepareWaterNode(with joints: Int = 100) {

        WaterNode = DynamicWaterNode(width: Float(self.size.width), numJoints: joints, surfaceHeight: Float(AquaProgressIndicatorScene.surfaceHeight), fillColour: WaterColor)
        let scale = SKAction.scaleY(to: 0, duration: 0)
        self.WaterNode.run(scale)
        WaterNode.position = CGPoint(x: self.size.width / 2, y: 0)
        WaterNode.zPosition = 20

        self.addChild(WaterNode)
    }

    private func prepareWaterReflectionShader() -> SKShader {
        let size = getSceneResolution()
        let iterations: Float = 4

        let shader = SKShader(fileNamed: "CausticDroplet.fsh")
        shader.uniforms = [
            SKUniform(name: "size", vectorFloat3: size),
            SKUniform(name: "iterations", float: iterations),
            SKUniform(name: "u_color", vectorFloat4: WaterColor.toVector4())
        ]
        return shader

    }

    fileprivate func getSceneResolution(multiplier: CGFloat = 1.0) -> SIMD3<Float> {
        let width = Float(self.frame.size.width * multiplier)
        let height = Float(self.frame.size.height * multiplier)
        let size = SIMD3<Float>([width, height, 0])
        return size
    }

    private func WaterDisturbanceAction() {
        let width = self.frame.size.width
        let duration = fixedTimeStep

        let perdiodicUpdate = SKAction.customAction(withDuration: duration) { [unowned self] (node, elapsedTime) in

            let xPoint = Float.random(min: 0, max: Float(width))
            let disturbanceWidth = Float.random(min: 20, max: 300)

            let force = CGFloat.random(min: 0.3, max: 0.5)

            self.WaterNode.disturbance(xPoint, force: -force, width: disturbanceWidth)
        }

        let waitAction = SKAction.wait(forDuration: 0.5)
        let actionSequence = SKAction.sequence([perdiodicUpdate, waitAction])

        let foreverAction = SKAction.repeatForever(actionSequence)
        self.run(foreverAction, withKey:"periodicUpdate")
    }

}
