//
//  ViewController.swift
//  dados
//
//  Created by Carlos M. Cardoza on 7/10/19.
//  Copyright © 2019 infinite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dado_izquierda: UIImageView!
    @IBOutlet weak var dado_derecha: UIImageView!
    var num_derecha : Int = 0
    var num_izquierda : Int = 0
    let imagen_dados :[String]
    
    let ncaras : UInt32
    required init?(coder aDecoder: NSCoder) {
        imagen_dados = ["d1", "d2", "d3", "d4", "d5", "d6"]
        ncaras = UInt32(imagen_dados.count)
        super.init(coder: aDecoder)
    }
    
    @IBAction func play_buttom(_ sender: Any) {
        generar_dados()
    }
    
    func generar_dados(){
       
        num_derecha = Int(arc4random_uniform(ncaras))
        num_izquierda = Int(arc4random_uniform(ncaras))
        dado_derecha.image = UIImage(named: imagen_dados[num_derecha])
        dado_izquierda.image = UIImage(named: imagen_dados[num_izquierda])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

