//
//  ViewController.swift
//  Actions and Outlets Form
//
//  Created by Kate Zhang on 5/4/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var submitDisplay: UIButton!
    
    @IBOutlet weak var clearDisplay: UIButton!
    
    @IBOutlet weak var messageDisplay: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitDisplay.layer.cornerRadius = 5
        clearDisplay.layer.cornerRadius = 5
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    

    @IBOutlet weak var nameField: UITextField!
    
    
    @IBOutlet weak var genderSelect: UISegmentedControl!
    
    
    @IBOutlet weak var ageDisplay: UILabel!
    
    
    var currentValue = 0
    
    @IBAction func ageSelect(_ sender: UISlider) {
        currentValue = Int(sender.value)
        ageDisplay.text = "\(currentValue)"
    }
    
    
    @IBOutlet weak var ageSlider: UISlider!
    
    
    @IBAction func submitButton(_ sender: UIButton) {
        
        let title = genderSelect.titleForSegment(at: genderSelect.selectedSegmentIndex)
        
        if nameField.text == ""{
            messageDisplay.text = ""
            
        }else if let nameTitle = nameField.text{
            if (title == "Female" || title == "Other") && currentValue <= 18 && currentValue >= 13{
                messageDisplay.text = "Congrats, \(nameTitle)! You are eligible to apply for a Kode with Klossy scholarship!"
            }else{
                messageDisplay.text = "I'm sorry, \(nameTitle). I'm afraid you are not eligible to apply for a Kode with Klossy scholarship. "
            }
        }
    }
    
    
    @IBAction func clearButton(_ sender: UIButton) {
        nameField.text = ""
        ageSlider.setValue(0, animated: true)
        ageDisplay.text = ""
        messageDisplay.text = ""
        genderSelect.selectedSegmentIndex = 0
    }
    
}
