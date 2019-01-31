//
//  ViewController.swift
//  SHIeLD SCORE CALCULATOR
//
//  Created by NEEC on 30/01/2019.
//  Copyright © 2019 EBIMED. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var question1: UIButton!
    @IBOutlet weak var grafico: UIImageView!
    
    @IBAction func calculateTouch(_ sender: Any) {
        
     
        grafico.image = UIImage(named: "r")
        
    }
    
    @IBAction func question1Clicked(_ sender: Any) {
        
        
        
        let alertMessage = UIAlertController(title: "Exemplo", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        action.setValue(UIImage(named: "exemplo_com_medicoes.png")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), forKey: "image")
        alertMessage .addAction(action)
        self.present(alertMessage, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

