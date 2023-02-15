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
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var lblAlert: UILabel!
    @IBOutlet weak var txtApellidos: UITextField!
    @IBOutlet weak var txtntlfn: UITextField!
    @IBOutlet weak var txtConfirmarContrasena: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func btnRegistrar(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.set( txtUsuario.text, forKey: "Usuario")
        defaults.set( txtNombre.text, forKey: "Nombre")
        defaults.set( txtApellidos.text, forKey: "Apellidos")
        defaults.set( txtEmail.text, forKey: "Email")
        defaults.set( txtntlfn.text, forKey: "Número de telefono")
        defaults.set( txtContraseña.text, forKey: "Contraseña")
        defaults.set( txtConfirmarContrasena.text, forKey: "Confirmar contraseña")
    }
    @objc func validate(notification: NSNotification){
        lblAlert.textColor = .red
    }
    
}
