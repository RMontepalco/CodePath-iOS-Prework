//
//  ViewController.swift
//  Prework
//
//  Created by Ross Nikolai Montepalco on 8/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSliderLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var numPeopleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get number of people from text field input
        let numPeople = Int(numPeopleTextField.text!) ?? 1
        
        // Get Total tip by multiplying tip * tipPercentage / numPeople
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex] / Double(numPeople)
        let total = (bill / Double(numPeople)) + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func calculateTipSlider(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get number of people from text field input
        let numPeople = Int(numPeopleTextField.text!) ?? 1
        
        // Get Total tip by multiplying tip * tipPercentage / numPeople
        tipSliderLabel.text = String(format: "%.0f%%", tipSlider.value * 100)
        let tip = bill * Double(round(tipSlider.value * 100) / 100) / Double(numPeople)
        let total = (bill / Double(numPeople)) + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}
