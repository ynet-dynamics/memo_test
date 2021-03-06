import UIKit

class TextInputViewController: UIViewController {
    @IBOutlet weak var editText: UITextField!
    
    @IBAction func onBtnBackTap(_ sender: Any) {
        let text = editText.text ?? ""
        PlatformTextInput.instance.sendText(text)
        dismiss(animated: true, completion: nil)
    }
}
