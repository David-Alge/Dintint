//
//  Comprar.swift
//  Proyecto_INT
//
//  Created by David Alge Balaguer on 12/1/23.
//

import UIKit

class Almacen: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    var misDatosDecodificados:[ProductData]=[]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var pickerVista: UIPickerView!
    

    let arrayVistas = ["Telefono", "Complementos", "Ordenadores", "Componentes", "Electro"]
    
    @IBAction func irVista(_ sender: Any) {
        let miStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let view = miStoryboard.instantiateViewController(identifier: arrayVistas[pickerVista.selectedRow(inComponent: 0)])
        
        view.modalPresentationStyle = .fullScreen
        view.modalTransitionStyle = .flipHorizontal
        
        self.navigationController?.pushViewController(view, animated: true)
        
        
        
        
        
    }
    
    func loadDataFromRemote(){
        // accedemos a un JSON remoto
        guard let miUrl = URL(string: "https://jpod.es/commits.json")
        else{
            print("No se encuetntra el archivo JSON")
            return
        }
        
        decodeJSON(url: miUrl)

    }
    
    
    
    func decodeJSON(url: URL){
        do{
            let miDecodificador = JSONDecoder()
            let misDatos = try Data(contentsOf: url)
            self.misDatosDecodificados = try miDecodificador.decode([ProductData].self, from: misDatos)
            
        }catch {
            print("Erroraco al decodificar JSON")
        }
    }
    
    
    
    
    func getAPI(){
        //creamos la llamada a la peticion GET
        let miUrl = URL(string: "https://api.chec.io/v1/")!
        var miRequest = URLRequest(url: miUrl)
        
        let token = "pk_503841a195de9cab99e68a69dac2f4761ab6bb69b3117"
        miRequest.addValue(token, forHTTPHeaderField: "X-Authentication")
        
        //parametrizamos la peticion
        miRequest.httpMethod = "GET" //GET,POST,PUT
        
        //lanzamos la peticion
        let miTarea = URLSession.shared.dataTask(with: miRequest){
            data, response, error in
            guard let data = data, error == nil else {
                print("Erroraco en la llamada")
                return
            }
            print("Respuesta: \(response)")

        }
        miTarea.resume()
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayVistas.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return arrayVistas[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
}
