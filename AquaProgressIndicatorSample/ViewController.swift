

import UIKit
import SpriteKit
import GameplayKit

class ViewController: UIViewController {


    @IBAction func levelSliderAction(_ sender: UISlider) {

        aquaProgressIndicator.changeWaterLevel(to: CGFloat(sender.value))

    }
    @IBOutlet weak var levelSlider: UISlider!

    @IBOutlet weak var aquaProgressIndicator: AquaProgressIndicator!

    override func viewDidLoad() {
        super.viewDidLoad()
        levelSlider.setValue(0.0, animated: false)
        aquaProgressIndicator.addAquaScene()

    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }


}

