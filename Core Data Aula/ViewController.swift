//
//  View.swift
//  Core Data Aula
//
//  Created by Lucas Dias on 28/05/19.
//  Copyright © 2019 lucasdias13. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var ageField: UITextField!
    
    @IBOutlet weak var loginField: UITextField!

    @IBOutlet weak var passField: UITextField!
    
    
  
    @IBAction func clearFields(_ sender: Any) {
        limparCampos()
        mostrarConsole()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addBanco(_ sender: UIButton) {
       
        if(checkFields() == true){
            if(salvarStr() == true){
                 self.performSegue(withIdentifier: "signupFlag", sender: self)
                
            } else{
                let alert = UIAlertController(title: "Data Base problem", message: "Please contact us so we can fix it soon as possible", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        } else {
            let alert = UIAlertController(title: "Did you fill all the fields?", message: "You must have filled all the required fields so you can sign up!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
        
        
        
        
      /*      if(salvarStr() == true && checkFields() == true){
                self.performSegue(withIdentifier: "signupFlag", sender: self)
            } else{
                let alert = UIAlertController(title: "Did you fill all the fields?", message: "You must have filled all the required fields so you can sign up!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        } */

    
    func limparCampos(){
        nameField.text = ""
        ageField.text = ""
        loginField.text = ""
        passField.text = ""
    }
    
    func salvarStr() -> Bool{
       
        let banco = CoreDataFunc()
        if let age = Int16(ageField.text!){
            banco.salvar(nome: nameField.text!, idade: age, login: loginField.text!, senha: passField.text!)
            return true
        }else{
            return false
        }
        
    }
    
   /* func salvarInt(){
        let bancoInt = CoreDataFunc()
        if let age = Int16(ageField.text!){
            bancoInt.salvarInt(texto: age, table: "idade")
            
        }
    } */
    
    
    func mostrarConsole(){
        let show = CoreDataFunc()
        show.requisicaoAll()
    }
    
    func checkFields() -> Bool{
        if(nameField.text == "" ||
            ageField.text == "" ||
            loginField.text == "" ||
            passField.text == ""
            ){
             return false
        }
        return true
            
        }
        
    

    
}
