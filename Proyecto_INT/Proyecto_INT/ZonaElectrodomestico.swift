//
//  ZonaElectrodomestico.swift
//  Proyecto_INT
//
//  Created by David Alge Balaguer on 15/12/22.
//

import UIKit

class ZonaElectrodomestico: UITableViewController {
    let arrayDatos = ["Electrodomestico1","Electrodomestico2","Electrodomestico3","Electrodomestico4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

       }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayDatos.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "miCeldaElectrodomestico", for: indexPath) as! CeldaElectrodomestico

        cell.miLabel.text = arrayDatos [indexPath.row]
        cell.miImagen.image = UIImage(named:"electro")

        return cell
    }

  

}
class CeldaElectrodomestico: UITableViewCell{
    @IBOutlet weak var miImagen: UIImageView!
    @IBOutlet weak var miLabel: UILabel!
    @IBOutlet weak var miBoton: UIButton!
    
    
}
