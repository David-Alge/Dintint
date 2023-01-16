//
//  ZonaElectrodomesticosVC.swift
//  Proyecto_INT
//
//  Created by Óscar Rabasco Molina on 16/1/23.
//

import UIKit

class ZonaElectrodomesticosVC: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var electroTxtAnadir: UITextField!
    @IBOutlet weak var electroTableView: UITableView!
    
    var arrayDatos = ["Electrodomestico1","Electrodomestico2","Electrodomestico3","Electrodomestico4"]
    
    override func viewDidLoad() {
        self.electroTableView.delegate = self
        self.electroTableView.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDatos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CeldaElectro", for: indexPath) as! CeldaElectro

        cell.electroLbl.text = arrayDatos [indexPath.row]
        cell.electroImg.image = UIImage(named:"electro")

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.00
    }

    @IBAction func btnAnadir(_ sender: Any) {
        arrayDatos.insert(electroTxtAnadir.text!, at: 0)
        let indexPath = IndexPath(row:0, section: 0)
        electroTableView.insertRows(at: [indexPath], with: .fade)
    }

}
class CeldaElectro: UITableViewCell {
    @IBOutlet weak var electroImg: UIImageView!
    @IBOutlet weak var electroLbl: UILabel!
}
