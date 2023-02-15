//
//  ZonaComponentes.swift
//  Proyecto_INT
//
//  Created by Óscar Rabasco Molina on 11/1/23.
//

import UIKit

class ZonaComponentes: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var misDatosDecodificados:[Any]=[]

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtAniadir: UITextField!
    var arrayDatos = ["Componentes1", "Componentes2", "Componentes3", "Componentes4"]
    
    override func viewDidLoad() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        llamadaAPI2()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return misDatosDecodificados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "miCeldaComponente", for: indexPath) as! CeldaComponente

        let item = misDatosDecodificados[indexPath.row] as! [String: Any]
        
        cell.miImagen.image = UIImage(named:"compo")

        cell.miLabel.text = item["name"] as? String

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
    
   
    func decodeJSON(url:URL) {
        do{
            let miDecodificador = JSONDecoder()
            let misDatos = try Data(contentsOf: url)
            self.misDatosDecodificados = try miDecodificador.decode([ProductData].self, from: misDatos)
            
        }catch {
            print("Erroraco al decodificar JSON")
        }
    }
    
   
    
    func llamadaAPI2(){
        
        
        //creamos la llamada a la peticion
        let miUrl = URL(string: "https://api.chec.io/v1/products?category_slug=componentes")!
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
                            print ("RESPUESTA: \(response)")
                            let responseJSON = try? JSONSerialization.jsonObject(with: responseData,options: [])
                            
                            if let responseJSON = responseJSON as? [String: Any], let dataArray = responseJSON["data"] {
                                self.misDatosDecodificados = dataArray as! [Any]
                                
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                            }
                            
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
class CeldaComponente: UITableViewCell {
    @IBOutlet weak var miPrecio: UILabel!
    @IBOutlet weak var miImagen: UIImageView!
    @IBOutlet weak var miLabel: UILabel!
}
