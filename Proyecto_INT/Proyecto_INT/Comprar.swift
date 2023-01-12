//
//  Comprar.swift
//  Proyecto_INT
//
//  Created by David Alge Balaguer on 12/1/23.
//

import UIKit

class Comprar: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    let arrayVistas = ["Moviles", "Accesorios Moviles", "Ordenadores", "Componentes", "Electrodomesticos"]
    
    
    
    
    
    
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayVistas.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return arrayVistas[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
}
