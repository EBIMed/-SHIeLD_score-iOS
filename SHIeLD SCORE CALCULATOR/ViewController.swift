//
//  ViewController.swift
//  SHIeLD SCORE CALCULATOR
//
//  Created by NEEC on 30/01/2019.
//  Copyright © 2019 EBIMED. All rights reserved.
//

import UIKit
import Foundation //Generic

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}



class ViewController: UIViewController {

    
    // Index Calculators
    @IBOutlet weak var ShockIndex: UILabel!
    @IBOutlet weak var PAOIndex: UILabel!
    @IBOutlet weak var tabela: UIImageView!
    
    //Shock Index
    var SHIndex:Double = 0.0
    var Hypoxaemia:Double = 0.0
    
    
    @IBOutlet weak var question1: UIButton!
    @IBOutlet weak var grafico: UIImageView!
    //inputs
    @IBOutlet  var SBP: UITextField!
    @IBOutlet  var HR: UITextField!
    @IBOutlet  var L: UITextField!
    @IBOutlet  var PaO: UITextField!
    @IBOutlet  var FIO2: UITextField!
    
    //imagens
    @IBOutlet weak var SBPImage: UIImageView!
    @IBOutlet weak var HRImage: UIImageView!
    @IBOutlet weak var LImage: UIImageView!
    @IBOutlet weak var PAOImage: UIImageView!
    @IBOutlet weak var FIOImage: UIImageView!
    
    
    //Yes and No button
    @IBOutlet  var ETYES: UIButton!
    @IBOutlet  var ETNO: UIButton!
    @IBOutlet  var ENTYES: UIButton!
    @IBOutlet  var ENTNo: UIButton!
    @IBOutlet  var RVYES: UIButton!
    @IBOutlet  var RVNo: UIButton!
    
    //Selected Options
    var ETChoice = false
    var ENTChoice = true
    var RVLVChoice = false
    
    //Mostrar texto finak
    @IBOutlet weak var TextResult: UILabel!
    
    func ClickedYes( ButtonYes: UIButton , ButtonNo: UIButton ){
        
        ButtonYes.backgroundColor  = self.view.tintColor
        ButtonYes.setTitleColor(UIColor.white,  for: [] )
        
        ButtonNo.backgroundColor  = UIColor.white
        ButtonNo.setTitleColor( self.view.tintColor,  for: [] )
        
        
    }
    
    func ClickedNo( ButtonYes: UIButton , ButtonNo: UIButton ){

        ButtonNo.backgroundColor  = self.view.tintColor
        ButtonNo.setTitleColor(UIColor.white,  for: [] )
        
        ButtonYes.backgroundColor  = UIColor.white
        ButtonYes.setTitleColor( self.view.tintColor,  for: [] )
        
    }
    
    
    @IBAction func RVYesClicked(_ sender: Any) {
        if(RVLVChoice == false){
            
            RVLVChoice = true
            ClickedYes(ButtonYes: RVYES , ButtonNo: RVNo)
        }
    }
    
    @IBAction func RVNoCliccked(_ sender: Any) {
        if(RVLVChoice == true){
            RVLVChoice = false
            ClickedNo(ButtonYes: RVYES , ButtonNo: RVNo)
            
        }
    }
    
    @IBAction func ENTNoCliked(_ sender: Any) {
        if(ENTChoice == true){
            ENTChoice = false
            ClickedNo(ButtonYes: ENTYES , ButtonNo: ENTNo)
            
        }
    }
    
    @IBAction func ENTYesClicked(_ sender: Any) {
        if(ENTChoice == false){
            
            ENTChoice = true
            ClickedYes(ButtonYes: ENTYES , ButtonNo: ENTNo)
        }
    }
    
    @IBAction func ETNoClicked(_ sender: Any) {
        
        if(ETChoice == true){
            ETChoice = false
            ClickedNo(ButtonYes: ETYES , ButtonNo: ETNO)
            
        }
    }
    @IBAction func ETYesClicked(_ sender: Any) {
        
        
        if(ETChoice == false){
           
            ETChoice = true
            ClickedYes(ButtonYes: ETYES , ButtonNo: ETNO)
        }
        

        
    }
    
    
    func CheckValue( field:UITextField , leftBond: Int , RightBond: Int) -> Bool{
        
        let value = Int(field.text!)
        if(value != nil){
            if( leftBond <= value! &&  RightBond >= value!){
                return true
            }
            else{
                return false
            }
        }
        else{
             return false
        }
    }
    
  
    func CalcHypoxaemia(){
        
        if( CheckValue( field: FIO2 ,  leftBond: 0 , RightBond: 100) && CheckValue( field: PaO ,  leftBond: 0 , RightBond: 500)){
            
            let fio:Double = Double( FIO2.text!)!
            let pao:Double = Double( PaO.text!)!
            Hypoxaemia = 100.0 *   pao  / fio
            PAOIndex.text = "PaO2/FiO2 = " + String(Hypoxaemia).prefix(8)
        }
    }
    
    
    //verificar esta entre 0 e 500
    @IBAction func FIOChanged(_ sender: Any) {
        
        if( CheckValue( field: FIO2 ,  leftBond: 0 , RightBond: 100) ){
                FIOImage.image = UIImage(named: "correct")
                CalcHypoxaemia()
            }
            else{
                FIOImage.image = UIImage(named: "wrong")
            }
        
    }
    
    

    
    @IBAction func PAOChanged(_ sender: Any) {
  
            if( CheckValue( field: PaO ,  leftBond: 0 , RightBond: 500) ){
                PAOImage.image = UIImage(named: "correct")
                CalcHypoxaemia()
            }
            else{
                PAOImage.image = UIImage(named: "wrong")
            }
        
    }
    
    
    
    
     //verificar esta entre 0 e 20
    @IBAction func LChanged(_ sender: Any) {
       
            if( CheckValue( field: L ,  leftBond: 0 , RightBond: 20) ){
                LImage.image = UIImage(named: "correct")
            }
            else{
                LImage.image = UIImage(named: "wrong")
            }
        
    
    }
    
    
  
    func CalcShockIndex(){
        
        if(CheckValue( field: HR ,  leftBond: 0 , RightBond: 250) && CheckValue( field: SBP ,  leftBond: 90 , RightBond: 300)){
            
            let hr:Double = Double(HR.text!)!
            let sbp:Double = Double(SBP.text!)!
            SHIndex = hr / sbp
            ShockIndex.text = "Shock index (HR/SBP)  = " + String(SHIndex).prefix(4)
        }
    }
    
    //verificar esta entre 0 e 250
    @IBAction func HRChanged(_ sender: Any) {
        
  
            if( CheckValue( field: HR ,  leftBond: 0 , RightBond: 250)){
                HRImage.image = UIImage(named: "correct")
                CalcShockIndex()
            }
            else{
                HRImage.image = UIImage(named: "wrong")
            }
        
    }
    
    
    
    //verificar esta entre 90 e 300
    @IBAction func SBPChanged(_ sender: Any) {
        
      
            if( CheckValue( field: SBP ,  leftBond: 90 , RightBond: 300)){
                SBPImage.image = UIImage(named: "correct")
                CalcShockIndex()
            }
            else{
                SBPImage.image = UIImage(named: "wrong")
            }
        
    }
    
    
 
    
    @IBAction func calculateTouch(_ sender: Any) {
        
        //Verifica se um dos parametros esta vazio
        if( SBP.text == "" || HR.text == "" || L.text == "" || PaO.text == "" || FIO2.text == ""){
            let alert = UIAlertController(title: "Aviso", message: "Os campos têm de estar preenchidos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            self.present(alert, animated: true, completion: nil)
        }
        
            //Veririca se os valores estao bem
        else if( CheckValue( field: SBP ,  leftBond: 90 , RightBond: 300) &&
            CheckValue( field: HR ,  leftBond: 0 , RightBond: 250) &&
            CheckValue( field: L ,  leftBond: 0 , RightBond: 20) &&
            CheckValue( field: PaO ,  leftBond: 0 , RightBond: 500) &&
            CheckValue( field: FIO2 ,  leftBond: 0 , RightBond: 100) ){
            
            //Calcular
            var cvd = 0.0
            
            
            if( ETChoice && ENTChoice && RVLVChoice){
                cvd = 1.0
            }
            
            let l:Double = Double(L.text!)!
            var formula =  1.734 * cvd  +  0.321 * l  - 0.008 * self.Hypoxaemia - 2.383
           
            
            
            if(self.SHIndex >= 1.00){
                formula += 1.204 * self.SHIndex
            }
            
            //Probability of event
            let prob = (exp(Double(formula)) / (1 + exp(Double(formula))))*100
            
            
            
            var percentile:String
            var risk:String
            
            if(prob <= 1.00) {
                percentile = "1st percentile" ;
                risk = "lowest risk subgroup";
            }
            else if(prob <= 3.33){
                percentile = "2nd percentile";
                risk = "intermediate risk subgroup";
            }
            else {
                percentile = "3rd percentile";
                risk = "highest risk subgroup";
            }
            
            //Mostrar Texto
            
            TextResult.text = "SHIeLD score: " + String(prob).prefix(5) + "%\n" +
                "A patient with a " + String(prob).prefix(5) + "% of predicted risk of PE-related mortality and/or rescue trombolisis at 30-days would integrate the " +
                percentile + " which corresponds to the " + risk
            
    
            //Mostrar imagem
            
            tabela.isHidden = false
            
            if(prob <= 1.00){
              grafico.image = UIImage(named: "green")
            }
            else if(prob <= 3.33){
               grafico.image = UIImage(named: "Amarelo")
            }
          
            else{
               grafico.image = UIImage(named: "red")
            }
          
            
            
        }
        
        else{
            
            let alert = UIAlertController(title: "Aviso", message: "Um dos parâmetros não está correcto", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            self.present(alert, animated: true, completion: nil)
            
        }
        
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
        self.hideKeyboardWhenTappedAround()
        tabela.isHidden = true
        
    }
    
    
  
    
  


}

