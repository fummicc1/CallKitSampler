import UIKit
import CallKit

class ViewController: UIViewController {

    var callKitController = CallKitController(provider: CXProvider(configuration: CXProviderConfiguration(localizedName: "CallKitSampler")))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapCallButton() {
        
    }
}

