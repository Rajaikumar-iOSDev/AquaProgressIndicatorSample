

import Foundation
import SpriteKit
public class AquaProgressIndicator:SKView
{
    var aquaScene : AquaProgressIndicatorScene!
    func changeWaterLevel(to level:CGFloat) {
        aquaScene.changeWaterLevel(to: level)
    }
    func addAquaScene() {

        let Scene = AquaProgressIndicatorScene(size: CGSize(width: self.bounds.width, height: self.bounds.height))
        self.ignoresSiblingOrder = true
        Scene.scaleMode = .aspectFill
        Scene.backgroundColor = .white
        self.layer.borderWidth = 3.0;
        self.layer.borderColor = UIColor.white.cgColor
        self.dropShadow()
        self.presentScene(Scene)
        aquaScene = Scene

        self.roundingUIView(aView: self, cornerRadiusParam: self.bounds.height/2)
        
    }

    private func roundingUIView(aView: UIView!, cornerRadiusParam: CGFloat!) {
        aView.clipsToBounds = true
        aView.layer.cornerRadius = cornerRadiusParam
    }
}

extension UIView {

    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1

        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1

    }
}
