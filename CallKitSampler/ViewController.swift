import UIKit
import CallKit

class ViewController: UIViewController {

    @IBOutlet weak var myNameTextField: UITextField! {
        didSet {
            myNameTextField.delegate = self
        }
    }
    
    let callKitController = CallKitController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callKitController.setDelegate()
    }
    
    @IBAction func didTapCallButton() {
        let myName = myNameTextField.text ?? ""
        callKitController.startCall(myName: myName)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
