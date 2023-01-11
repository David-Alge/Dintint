//
//  ZonaPC.swift
//  Proyecto_INT
//
//  Created by David Alge Balaguer on 15/12/22.
//

import UIKit

class ZonaPC: UITableViewController {
    let arrayDatos = ["Ordenador1","Ordenador2","Ordenador3","Ordenador4"]
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "miCeldaPC", for: indexPath) as! CeldaPC

        cell.miLabel.text = arrayDatos [indexPath.row]
        cell.miImagen.image = UIImage(named:"PC")

        return cell
    }


    

}


class CeldaPC: UITableViewCell {
    @IBOutlet weak var miImagen: UIImageView!
    @IBOutlet weak var miBoton: UIButton!
    @IBOutlet weak var miLabel: UILabel!
    
}
