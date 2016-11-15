//
//  ViewController.swift
//  TicTacToe
//
//  Created by Sagitova Gulnaz on 15.11.16.
//  Copyright © 2016 Sagitova Gulnaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var a11: UIImageView!
    @IBOutlet var a12: UIImageView!
    @IBOutlet var a13: UIImageView!
    @IBOutlet var a21: UIImageView!
    @IBOutlet var a22: UIImageView!
    @IBOutlet var a23: UIImageView!
    @IBOutlet var a31: UIImageView!
    @IBOutlet var a32: UIImageView!
    @IBOutlet var a33: UIImageView!
    
    @IBOutlet var msg: UILabel!
    
    var images = [UIImageView]()
    
    func tappedView(sender: UIGestureRecognizer){
        let image = sender.view as? UIImageView
        msg.text = "You tapped the box!"
        let n = (image?.tag)! as Int
        msg.text = "tag \(n)"
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        msg.text = "New Game!"
    }
    @IBAction func resetGame(_ sender: AnyObject) {
        msg.text = "reset"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        images = [a11, a12, a13, a21, a22, a23, a31, a32, a33]
//        var tag = 0
        for image in images {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tappedView))
            image.isUserInteractionEnabled = true
            image.addGestureRecognizer(tapGestureRecognizer)
//            image.tag = tag
//            tag += 1
        }
        
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

