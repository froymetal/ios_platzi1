//
//  ViewController.swift
//  platzi1
//
//  Created by Field Employee on 6/25/21.
//

import UIKit
import PopupDialog

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
            //print("usuario invalido")
            showErrorDialog()
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

    private func showErrorDialog(){
        // Prepare the popup assets
        let title = "Error"
        let message = "Credenciales inválidas"
        let image = UIImage(named: "pexels-photo-103290")

        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image)

        // Create buttons
        let buttonOne = CancelButton(title: "CANCEL") {
            print("You canceled the car dialog.")
        }

        // This button will not the dismiss the dialog
        //let buttonTwo = DefaultButton(title: "ADMIRE CAR", dismissOnTap: false) {
         //   print("What a beauty!")
        //}

        //let buttonThree = DefaultButton(title: "BUY CAR", height: 60) {
        //    print("Ah, maybe next time :)")
        //}

        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne])

        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }
}

