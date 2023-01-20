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
    
    var datos = [String]()
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
            let miTextoAGuardar = txtUsuario.text ?? "No hay texto"
            
            let miFileManager = FileManager.default
            
            leerDatos()
            
            
            guardarDatos()
            
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
    
    func getDocumentPath()-> URL{
        
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first ?? URL(string: "")!
    }
    
    func miRutaArchivo() -> URL {
        let miPath = getDocumentPath()
        let miFicheroURL = miPath.appendingPathComponent("Datos.json")
        
        return miFicheroURL
    }
    func guardarDatos(){
        do
        {
            let misDatosSerializados = try JSONSerialization.data(withJSONObject: datos)
            
            try misDatosSerializados.write(to: miRutaArchivo())
        }
        catch _ {
            print("ERROR FATAL DE LECTURA,SIN DATOS")
        }
        }
        
    @IBAction func Recu(_ sender: Any) {
        leerDatos()
        txtUsuario.text = datos.description
    }
    
    func leerDatos(){
        do{
            let misDatosLeidos = try Data(contentsOf: miRutaArchivo())
            
            datos = try JSONSerialization.jsonObject(with: misDatosLeidos) as! [String] ?? []
        }
        catch _ {
            print("ERROR FATAL DE LECTURA,SIN DATOS")
        }
        }
    

}
