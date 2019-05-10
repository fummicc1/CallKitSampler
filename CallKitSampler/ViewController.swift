import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myNameTextField: UITextField! {
        didSet {
            myNameTextField.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapCallButton() {
        let myName = myNameTextField.text ?? ""
        VoipController.shared.startCall(myName: myName)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
