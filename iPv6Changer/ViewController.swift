//
//  ViewController.swift
//  iPv6Changer
//
//  Created by 冯奕琦 on 2018/10/29.
//  Copyright © 2018年 冯奕琦. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:IBOutlet
    
    @IBOutlet weak var inputAddress: UITextField!
    @IBOutlet weak var switchButton: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        inputAddress.delegate = self
    }
    
    @IBAction func SwitchChange(_ sender: UISwitch) {
        print(inputAddress.text ?? "None Text")
    }
    
}

//MARK:UITextFieldDelegate

extension ViewController :UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //格式检查问题
        textField.resignFirstResponder()
        return true
    }
    
}
