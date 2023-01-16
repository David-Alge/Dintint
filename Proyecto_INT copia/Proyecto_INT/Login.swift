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
        
        if txtUsuario.text == ""  || txtContra.text == "" {
            NotificationCenter.default.post(name: NSNotification.Name("Alerta"), object: nil)
        }else{
            let miStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let view = miStoryboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
            
            view.modalPresentationStyle = .fullScreen
            view.modalTransitionStyle = .flipHorizontal
            
            self.navigationController?.pushViewController(view, animated: true)
            
        }
    }
    
    @objc func validate(notification: NSNotification){
        lblalert.textColor = .red
    }
    

}
