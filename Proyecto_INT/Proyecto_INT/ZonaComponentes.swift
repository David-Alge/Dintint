//
//  ZonaComponentes.swift
//  Proyecto_INT
//
//  Created by Óscar Rabasco Molina on 11/1/23.
//

import UIKit

class ZonaComponentes: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtAniadir: UITextField!
    var arrayDatos = ["Componentes1", "Componentes2", "Componentes3", "Componentes4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDatos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "miCeldaCompo", for: indexPath) as! CeldaComponente

        cell.miLabel.text = arrayDatos [indexPath.row]
        cell.miImagen.image = UIImage(named:"compo")

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.00
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let optInfo = UIContextualAction(style: .normal, title: "Descripción"){ action, view, completion in
        }
        optInfo.image = UIImage(systemName: "info")
        let config = UISwipeActionsConfiguration(actions: [optInfo])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
    @IBAction func btnAniadir(_ sender: Any) {
        arrayDatos.insert(txtAniadir.text!, at: 0)
        let indexPath = IndexPath(row:0, section: 0)
        tableView.insertRows(at: [indexPath], with: .fade)
    }
    
    


}
class CeldaComponente: UITableViewCell {
    @IBOutlet weak var miImagen: UIImageView!
    @IBOutlet weak var miLabel: UILabel!
}
