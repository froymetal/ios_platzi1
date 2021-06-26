//
//  ViewController.swift
//  platzi1
//
//  Created by Field Employee on 6/25/21.
//

import UIKit

class ViewController: UIViewController {
    //MARK: References UI
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    //Switch para recordar contrasena
    @IBOutlet weak var emailSwitch: UISwitch!
    
    
    @IBAction func loginButtonAction() {
        //1. Obtener valores de los TextField
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if email == "froy" && password == "123"{
            //print("Bienvenido")
            //Para el switch - guardar valores con llave
            if emailSwitch.isOn{
                storage.set(email, forKey: emailKey)
            } else {
                storage.removeObject(forKey: emailKey)
            }
            
            //vamos al home
            performSegue(withIdentifier: "home_segue", sender: nil)
            
        }else{
            print("usuario invalido")
        }
        
        
    }
    
    //Para switch
    private let emailKey = "email-key"
    private let storage = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Para el switch
        //Buscamos un string en los UserDefaults y lo asignamos
        if let storedEmail = storage.string(forKey: emailKey){
            emailTextField.text = storedEmail
            emailSwitch.isOn = true
        } else{
            
            emailSwitch.isOn = false
        }
    }


}

