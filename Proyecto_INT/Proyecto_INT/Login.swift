//
//  Login.swift
//  Proyecto_INT
//
//  Created by David Alge Balaguer on 2/11/22.
//

import UIKit

class Login: UIViewController {

    @IBOutlet weak var txtContra: UITextField!
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var lblalert: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Notificaciones()
    }
    private func Notificaciones(){
        NotificationCenter.default.addObserver(self, selector: #selector(Login.validate(notification:)), name: NSNotification.Name("Alerta"), object: nil)
        
        
    }
    
    @IBAction func btnIniciar(_ sender: Any) {
        let text = txtUsuario.text
        if ((text?.isEmpty) != nil)  {
            NotificationCenter.default.post(name: NSNotification.Name("Alerta"), object: nil)


        }
    }
    
    @objc func validate(notification: NSNotification){
        lblalert.textColor = .red
    }
    

}
