//
//  ViewController.swift
//  scCal
//
//  Created by 이승철 on 2017. 11. 26..
//  Copyright © 2017년 이승철. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let calculator = Calculate()
    
    @IBOutlet weak var displayView: UITextView!
    
    @IBAction func numberClick(_ sender : RoundButton) {
        setNumber(numberStr: sender.currentTitle!)
    }
    
    @IBAction func oneOperatorClick(_ sender : RoundButton) {
        displayView.text = setOneOperator(operatorStr: sender.currentTitle!)
    }
    
    @IBAction func twoOperatorClick(_ sender : RoundButton) {
        displayView.text = setTwoOperator(operatorStr: sender.currentTitle!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setNumber(numberStr: String) {
        displayView.text = calculator.setNumberModel(numberStr: numberStr)
    }
    
    func setOneOperator(operatorStr: String) -> String {
        return calculator.setOneOperatorModel(operatorStr: operatorStr)
    }
    
    func setTwoOperator(operatorStr: String) -> String {
        return calculator.setTwoOperatorModel(operatorStr: operatorStr)
    }


}

