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
    //inputs
    @IBOutlet weak var SBP: UITextField!
    @IBOutlet weak var HR: UITextField!
    @IBOutlet weak var L: UITextField!
    @IBOutlet weak var PaO: UITextField!
    @IBOutlet weak var FIO2: UITextField!
    
    
    //verificar esta entre 0 e 100
    @IBAction func FIOChanged(_ sender: Any) {
        
        let value = Int(FIO2.text!)
        
        if( value != nil){
            print(value!)
            if( 0 <= value! &&  100 >= value!){
                print("Bom")
            }
            else{
                print("Mau")
            }
        }
        
    }
    
    //verificar esta entre 0 e 500
    @IBAction func PAOChanged(_ sender: Any) {
        let value = Int(PaO.text!)
        
        if( value != nil){
            print(value!)
            if( 0 <= value! &&  500 >= value!){
                print("Bom")
            }
            else{
                print("Mau")
            }
        }
    }
    
     //verificar esta entre 0 e 20
    @IBAction func LChanged(_ sender: Any) {
        
        let value = Int(L.text!)
        
        if( value != nil){
            print(value!)
            if( 0 <= value! &&  20 >= value!){
                print("Bom")
            }
            else{
                print("Mau")
            }
        }
        
    }
    
    
    //verificar esta entre 0 e 250
    @IBAction func HRChanged(_ sender: Any) {
        
        let value = Int(HR.text!)
        
        if( value != nil){
            print(value!)
            if( 0 <= value! &&  250 >= value!){
                print("Bom")
            }
            else{
                print("Mau")
            }
        }
        
    }
    
    
    
    //verificar esta entre 90 e 300
    @IBAction func SBPChanged(_ sender: Any) {
        
        let value = Int(SBP.text!)
        
        if( value != nil){
            print(value!)
            if( 90 <= value! &&  300 >= value!){
                print("Bom")
            }
            else{
                print("Mau")
            }
        }
    }
    
    
    @IBAction func naoET(_ sender: Any) {
    }
    
    @IBAction func simET(_ sender: Any) {
    }
    
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

