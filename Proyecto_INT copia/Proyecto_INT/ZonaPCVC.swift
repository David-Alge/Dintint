//
//  ZonaPCVC.swift
//  Proyecto_INT
//
//  Created by  on 16/1/23.
//

import UIKit

class ZonaPCVC: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var misDatosDecodificados:[Any]=[]


    @IBOutlet weak var PCTxt: UITextField!
    @IBOutlet weak var PCTableView: UITableView!
    var arrayDatos = ["Ordenador1", "Ordenador2", "Ordenador3", "Ordenador4"]
    
    override func viewDidLoad() {
        self.PCTableView.delegate = self
        self.PCTableView.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        llamadaAPI2()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return misDatosDecodificados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "miCeldaPC", for: indexPath) as! CeldaOrdenadores

        let item = misDatosDecodificados[indexPath.row] as! [String: Any]
        
        let precios = item["price"]  as! [String: Any]

        
        if let priceData = precios as? [String: Any] {
            if let formattedPrice = priceData["formatted_with_symbol"] as? String {
                print("Precio")
                print(formattedPrice)
                cell.miPrecio.text = formattedPrice
            }
        }
        
        cell.PCImage.image = UIImage(named:"PC")

        cell.PCLabel.text = item["name"] as? String
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.00
    }

    
    @IBAction func btnAniadir(_ sender: Any) {
        arrayDatos.insert(PCTxt.text!, at: 0)
        let indexPath = IndexPath(row:0, section: 0)
        PCTableView.insertRows(at: [indexPath], with: .fade)
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
        let miUrl = URL(string: "https://api.chec.io/v1/products?category_slug=ordenadores")!
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
                                    self.PCTableView.reloadData()
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
class CeldaOrdenadores: UITableViewCell{
    @IBOutlet weak var miPrecio: UILabel!
    @IBOutlet weak var miPC: UILabel!
    @IBOutlet weak var PCLabel: UILabel!
    @IBOutlet weak var PCImage: UIImageView!
}

