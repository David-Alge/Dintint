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
    
    
    

    override func viewDidLoad() {
        self.CestaTableView.delegate = self
        self.CestaTableView.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDatos.count
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
        
        
        
        print(arrayDatos [indexPath.row])
        
        cell.miLabel.text = arrayDatos [indexPath.row]
        
        if arrayDatos [indexPath.row] == "Ordenador" {
            cell.miImagen.image = UIImage(named:"PC")
        }
        if arrayDatos [indexPath.row] == "Componente" {
            cell.miImagen.image = UIImage(named:"compo")
        }
        if arrayDatos [indexPath.row] == "Electrodomestico" {
            cell.miImagen.image = UIImage(named:"electro")
        }
        if arrayDatos [indexPath.row] == "Telefono" {
            cell.miImagen.image = UIImage(named:"movil")
        }
        if arrayDatos [indexPath.row] == "Complementos" {
            cell.miImagen.image = UIImage(named:"accesorio")
        }
        

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.00
    }
    

    
    
}
class CeldaCesta: UITableViewCell{
    
    @IBOutlet weak var miImagen: UIImageView!
    @IBOutlet weak var miLabel: UILabel!
    
    
}



