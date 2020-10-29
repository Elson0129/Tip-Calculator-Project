

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var peopleTextField: UITextField!
    @IBOutlet weak var percentageTextField: UITextField!
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Loaded")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
   func showErrorMessage(message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
       
        
    }
    
    @IBAction func calculateClicked(_ sender: UIButton) {
      
        
        let total = Double(totalTextField.text!)
        if total == nil {
            showErrorMessage(message: "WARNING: Total value entered is not valid.")
            return
        }
        
        var percent = Double(percentageTextField.text!)
        if percent == nil {
            showErrorMessage(message: "WARNING: Tip value entered is not valid.")
            return
        }
        
        percent = percent! / 100
        
        let people = Double(peopleTextField.text!)
        if people == nil {
            showErrorMessage(message: "Amount of people entered is not valid.")
        }
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        nf.roundingMode = .halfUp
        let grandTotal = (percent! * total! + total!) / people!
        let displayPrice = nf.string(for: grandTotal)
        
        showErrorMessage(message: "Each person owes " + "$" + displayPrice! + ".")
        
        self.view.endEditing(true)
        
    }
    
    @IBAction func clearCalculator(_ sender: UIButton) {
        totalTextField.text = ""
        peopleTextField.text = ""
        percentageTextField.text = ""
    }
    
    
    
}





