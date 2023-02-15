//
//  ZonaTelefono.swift
//  Proyecto_INT
//
//  Created by Óscar Rabasco Molina on 20/1/23.
//

import UIKit



class ZonaTelefono: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var misDatosDecodificados:[ProductData]=[]

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtAniadir: UITextField!
    var arrayDatos = ["Telefono1", "Telefono2", "Telefono3", "Telefono4"]
    
    override func viewDidLoad() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        super.viewDidLoad()
        loadDataFromRemote()
        // Do any additional setup after loading the view.
        llamadaAPI()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return misDatosDecodificados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "miCeldaTelefono", for: indexPath) as! CeldaTelefono

        cell.miLabel.text = misDatosDecodificados[indexPath.row].name
        cell.miImagen.image = UIImage(named:"movil")

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.00
    }

    
    @IBAction func btnAniadir(_ sender: Any) {
        arrayDatos.insert(txtAniadir.text!, at: 0)
        let indexPath = IndexPath(row:0, section: 0)
        tableView.insertRows(at: [indexPath], with: .fade)
    }
    
    //Zona APi
    
   
    

    func loadDataFromRemote(){
        // accedemos a un JSON remoto
        let key = "pk_503841a195de9cab99e68a69dac2f4761ab6bb69b3117"
        guard  let miUrl = URL(string: "https://api.chec.io/v1/products?category_slug=moviles")
                
                
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
    
    func codeJSON (dataToCode:[ProductData]) -> Data{
        let miCodificador = JSONEncoder()
        if let jsonCodificado = try? miCodificador.encode(dataToCode)
        {
            if let cadenaJSON = String(data: jsonCodificado, encoding: .utf8){
                print(cadenaJSON)
                return jsonCodificado
            }
        }
        return Data()
    }
    
    
    
    func llamadaAPI(){
        //creamos la llamada a la peticion
        let miUrl = URL(string: "https://api.chec.io/v1/products?category_slug=moviles")!
        var miRequest = URLRequest(url: miUrl)
        miRequest.httpMethod = "GET"

        
        let key = "pk_503841a195de9cab99e68a69dac2f4761ab6bb69b3117"
        miRequest.addValue(key, forHTTPHeaderField: "X-Authorization")
        
        
        let session = URLSession.shared

        
        
        //lanzamos la peticion
        let task = session.dataTask(with: miRequest) { (data, response, error) in
                // Handle the response data
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        if let responseData = data {
                            // Process the response data
                            print(String(data: responseData, encoding: .utf8) ?? "No response data")
                        } else {
                            print("No response data")
                        }
                    } else {
                        print("Error: HTTP status code \(httpResponse.statusCode)")
                    }
                } else {
                    print("Unexpected response")
                }
            }
            task.resume()
        
    }
    
    


}
class CeldaTelefono: UITableViewCell {
    @IBOutlet weak var miImagen: UIImageView!
    @IBOutlet weak var miLabel: UILabel!
}
