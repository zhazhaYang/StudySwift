//
//  DoubleComponentPickerViewController.swift
//  Pickers
//
//  Created by yang on 2019/3/28.
//  Copyright © 2019 yang. All rights reserved.
//

import UIKit

class DoubleComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    private let fruitComponent = 0
    private let colourComponent = 1
    private let fruit = ["Apple", "Banana", "Tomato", "Watermelon", "Grape", "Lemon", "Orange", "Mango"]
    private let colour = ["red", "blue", "green", "purple", "yellow", "orange", "pink"]
    @IBOutlet weak var doublePickerview: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let selectedFruit = fruit[doublePickerview.selectedRow(inComponent: fruitComponent)]
        let selectedColour = colour[doublePickerview.selectedRow(inComponent: colourComponent)]
        let alert = UIAlertController(title: "Fruit and Colour Matching", message: "You think the \(selectedFruit) is \(selectedColour)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes, I think so", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //MARK: - Data Source and Delegate
    //MARK: Pivker Data Source Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == fruitComponent {
            return fruit.count
        } else {
            return colour.count
        }
    }
    
    //MARK: Picker Delegate Methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == fruitComponent {
            return fruit[row]
        } else {
            return colour[row]
        }
    }
}
