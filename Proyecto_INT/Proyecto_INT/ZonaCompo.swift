//
//  ZonaCompo.swift
//  Proyecto_INT
//
//  Created by David Alge Balaguer on 15/12/22.
//

import UIKit

class ZonaCompo: UITableViewController {
    let arrayDatos = ["Componente1","Componente2","Componente3","Componente4"]
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "miCeldaCompo", for: indexPath) as! CeldaCompo

        cell.miLabel.text = arrayDatos [indexPath.row]
        cell.miImagen.image = UIImage(named:"compo")

        return cell
    }


}


class CeldaCompo: UITableViewCell {
    @IBOutlet weak var miBoton: UIButton!
    @IBOutlet weak var miLabel: UILabel!
    @IBOutlet weak var miImagen: UIImageView!
    
}
