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
        
      
        UIView.animate(withDuration: 0.3, animations: {
            self.dado_derecha.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: -100, y: 100))
            
            self.dado_izquierda.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: 100, y: 100))
            self.dado_derecha.alpha = 0.0
            self.dado_izquierda.alpha = 0.0
            
            
        }, completion: (({ (completed) in
            self.dado_derecha.transform = CGAffineTransform.identity
             self.dado_izquierda.transform = CGAffineTransform.identity
            self.dado_izquierda.image = UIImage(named: self.imagen_dados[self.num_izquierda])
            self.dado_derecha.image = UIImage(named: self.imagen_dados[self.num_derecha])
            self.dado_derecha.alpha = 1.0
            self.dado_izquierda.alpha = 1.0
        })))
    }
    
    
    
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            generar_dados()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

