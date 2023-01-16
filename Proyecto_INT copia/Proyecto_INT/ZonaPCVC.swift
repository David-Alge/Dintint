//
//  ZonaPCVC.swift
//  Proyecto_INT
//
//  Created by  on 16/1/23.
//

import UIKit

class ZonaPCVC: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var PCTxt: UITextField!
    @IBOutlet weak var PCTableView: UITableView!
    var arrayDatos = ["Ordenador1", "Ordenador2", "Ordenador3", "Ordenador4"]
    
    override func viewDidLoad() {
        self.PCTableView.delegate = self
        self.PCTableView.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDatos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "miCeldaPC", for: indexPath) as! CeldaOrdenadores

        cell.PCLabel.text = arrayDatos [indexPath.row]
        cell.PCImage.image = UIImage(named:"PC")

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
    
    


}
class CeldaOrdenadores: UITableViewCell{
    @IBOutlet weak var PCLabel: UILabel!
    @IBOutlet weak var PCImage: UIImageView!
}

