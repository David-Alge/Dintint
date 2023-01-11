//
//  Cesta.swift
//  Proyecto_INT
//
//  Created by David Alge Balaguer on 10/11/22.
//

import UIKit

class Cesta: UITableViewController {
    
    @IBOutlet weak var miEtiqueta: UILabel!
    var arrayDatos = ["articulo1","articulo2","articulo3","articulo5"]
    
    override func viewDidLoad() {
        


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let optBorrar = UIContextualAction(style: .normal, title: "Borrar") {
            action, view, completion in self.arrayDatos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        optBorrar.image = UIImage(systemName: "info")
        optBorrar.backgroundColor = UIColor.red
        
        
        let config = UISwipeActionsConfiguration(actions: [optBorrar])
        
        config.performsFirstActionWithFullSwipe = false
        
        return config
        }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "miCeldaCesta", for: indexPath) as! miCelda
        
        cell.miEtiqueta.text = arrayDatos [indexPath.row]
        cell.miImagen.image = UIImage(named:"descarga")
    

        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 181
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
}
class miCelda: UITableViewCell{
    @IBOutlet weak var miEtiqueta: UILabel!
    @IBOutlet weak var miImagen: UIImageView!
    
    
}
