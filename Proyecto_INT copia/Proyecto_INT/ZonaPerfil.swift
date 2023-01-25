//
//  ZonaPerfil.swift
//  Proyecto_INT
//
//  Created by Óscar Rabasco Molina on 25/1/23.
//

import UIKit

class ZonaPerfil: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    


    @IBAction func sliderAction(_ sender: UISlider) {
        let scale = sender.value
        let transform = CGAffineTransform.init(scaleX: CGFloat(scale), y: CGFloat(scale))
        image.transform = transform
        
    }
    
}
