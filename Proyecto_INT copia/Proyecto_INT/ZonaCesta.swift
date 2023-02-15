//
//  ZonaCesta.swift
//  Proyecto_INT
//
//  Created by David Alge Balaguer on 25/1/23.
//

import UIKit

class ZonaCesta: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var btnElectro: UIButton!
    @IBOutlet weak var btnMovil: UIButton!
    @IBOutlet weak var btnComponente: UIButton!
    @IBOutlet weak var btnPC: UIButton!
    @IBOutlet weak var btnAccesorio: UIButton!
    
    @IBOutlet weak var CestaTableView: UITableView!
    var arrayDatos = ["Ordenador", "Componente", "Electrodomestico", "Telefono","Complementos"]
    
    var filtro = ""
    
    
    var misDatosDecodificados:[Any]=[]


    override func viewDidLoad() {
        self.CestaTableView.delegate = self
        self.CestaTableView.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        llamadaAPI2()

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return misDatosDecodificados.count
    }
    @IBAction func filtroAcce(_ sender: Any) {
        
        filtro = "Complementos"
        
        var filtracion = arrayDatos.filter { $0.contains(filtro) }
        arrayDatos = filtracion
        
        self.CestaTableView.reloadData()
    }
    
    @IBAction func filtroPC(_ sender: Any) {
       
        filtro = "Ordenador"
        
        var filtracion = arrayDatos.filter { $0.contains(filtro) }
        arrayDatos = filtracion
        
        self.CestaTableView.reloadData()
    }
    @IBAction func filtroCompo(_ sender: Any) {
        
        filtro = "Componente"
        
        var filtracion = arrayDatos.filter { $0.contains(filtro) }
        arrayDatos = filtracion
        
        self.CestaTableView.reloadData()
    }
    
    @IBAction func filtroMovil(_ sender: Any) {
        
        filtro = "Telefono"
        
        var filtracion = arrayDatos.filter { $0.contains(filtro) }
        arrayDatos = filtracion
        
        self.CestaTableView.reloadData()
    }
    @IBAction func filtroElectro(_ sender: Any) {
        
        filtro = "Electrodomestico"
        
        var filtracion = arrayDatos.filter { $0.contains(filtro) }
        arrayDatos = filtracion
        
        self.CestaTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "miCeldaCesta", for: indexPath) as! CeldaCesta
        
        
        
        let item = misDatosDecodificados[indexPath.row] as! [String: Any]
        
        let name = item["name"] as? String
        
        
        cell.miImagen.image = UIImage(named:"PC")

        cell.miLabel.text = name
        
        let categoria = item["categories"]  as! [String: Any]

        if let categoriaData = categoria as? [String: Any] {
            if let name = categoriaData["name"] as? String {
                print("//////////////")

                print("Categoria")
                print(name)
                
            }
        }
        
                if name == "Ordenador" {
                    cell.miImagen.image = UIImage(named:"PC")
                }
                if name ==  "Componente" {
                    cell.miImagen.image = UIImage(named:"compo")
                }
                if name == "Electrodomestico" {
                    cell.miImagen.image = UIImage(named:"electro")
                }
                if name ==  "Telefono" {
                    cell.miImagen.image = UIImage(named:"movil")
                }
                if name ==  "Complementos" {
                    cell.miImagen.image = UIImage(named:"accesorio")
                }
        
        
        return cell

        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.00
    }
    
    //Zona API
    
    func llamadaAPI2(){
        
        
        //creamos la llamada a la peticion
        let miUrl = URL(string: "https://api.chec.io/v1/products")!
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
                                    self.CestaTableView.reloadData()
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
class CeldaCesta: UITableViewCell{
    
    @IBOutlet weak var miImagen: UIImageView!
    @IBOutlet weak var miLabel: UILabel!
    
    
}



