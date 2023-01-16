//
//  Registro.swift
//  Proyecto_INT
//
//  Created by David Alge Balaguer on 2/11/22.
//

import UIKit

class Registro: UIViewController {

    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtContraseña: UITextField!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func btnRegistrar(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.set( txtUsuario.text, forKey: "Usuario")
        defaults.set( txtContraseña.text, forKey: "Contraseña")
        defaults.set( txtEmail.text, forKey: "Email")
        
    }
    
    

}
