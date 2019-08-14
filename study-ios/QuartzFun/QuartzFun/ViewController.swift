//
//  ViewController.swift
//  QuartzFun
//
//  Created by yang on 2019/4/22.
//  Copyright © 2019 yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func changeColor(_ sender: UISegmentedControl) {
        let drawingColorSelection = DrawingColor(rawValue: sender.selectedSegmentIndex)
        if let drawingColor = drawingColorSelection {
            let funView = view as! QuartzFunView
            switch drawingColor {
            case .red:
                funView.currentColor = UIColor.red
                funView.useRandomColor = false
            case .green:
                funView.currentColor = UIColor.green
                funView.useRandomColor = false
            case .yelllow:
                funView.currentColor = UIColor.yellow
                funView.useRandomColor = false
            case .blue:
                funView.currentColor = UIColor.blue
                funView.useRandomColor = false
            case .random:
                funView.useRandomColor = true
            }
        }
        
    }
    
    @IBAction func changeShape(_ sender: UISegmentedControl) {
        let shapeSelection = Shape(rawValue: sender.selectedSegmentIndex)
        if let shape = shapeSelection {
            let funView = view as! QuartzFunView
            funView.shape = shape
            colorControl.isHidden = shape == Shape.image
        }
    }
}

