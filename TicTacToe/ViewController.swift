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
    
    let tapGestureRecognizer11 = UITapGestureRecognizer()
    let tapGestureRecognizer12 = UITapGestureRecognizer()
    let tapGestureRecognizer13 = UITapGestureRecognizer()
    let tapGestureRecognizer21 = UITapGestureRecognizer()
    let tapGestureRecognizer22 = UITapGestureRecognizer()
    let tapGestureRecognizer23 = UITapGestureRecognizer()
    let tapGestureRecognizer31 = UITapGestureRecognizer()
    let tapGestureRecognizer32 = UITapGestureRecognizer()
    let tapGestureRecognizer33 = UITapGestureRecognizer()
    
    var player:Dictionary = ["first":1,"second":2]
    
    
    
    func tappedView(){
        print("image tapped")
        msg.text = "You tapped the box!"
    }
    
    @IBAction func newGame(_ sender: AnyObject) {
        msg.text = "New Game!"
        
    }
    @IBAction func resetGame(_ sender: AnyObject) {
        msg.text = "reset"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        a11.isUserInteractionEnabled = true;
        a12.isUserInteractionEnabled = true;
        a13.isUserInteractionEnabled = true;
        a21.isUserInteractionEnabled = true;
        a22.isUserInteractionEnabled = true;
        a23.isUserInteractionEnabled = true;
        a31.isUserInteractionEnabled = true;
        a32.isUserInteractionEnabled = true;
        a33.isUserInteractionEnabled = true;

        
        tapGestureRecognizer11.addTarget(self, action: #selector(ViewController.tappedView))
        tapGestureRecognizer12.addTarget(self, action: #selector(ViewController.tappedView))
        tapGestureRecognizer13.addTarget(self, action: #selector(ViewController.tappedView))
        tapGestureRecognizer21.addTarget(self, action: #selector(ViewController.tappedView))
        tapGestureRecognizer22.addTarget(self, action: #selector(ViewController.tappedView))
        tapGestureRecognizer23.addTarget(self, action: #selector(ViewController.tappedView))
        tapGestureRecognizer31.addTarget(self, action: #selector(ViewController.tappedView))
        tapGestureRecognizer32.addTarget(self, action: #selector(ViewController.tappedView))
        tapGestureRecognizer33.addTarget(self, action: #selector(ViewController.tappedView))

        a11.addGestureRecognizer(tapGestureRecognizer11)
        a12.addGestureRecognizer(tapGestureRecognizer12)
        a13.addGestureRecognizer(tapGestureRecognizer13)
        a21.addGestureRecognizer(tapGestureRecognizer21)
        a22.addGestureRecognizer(tapGestureRecognizer22)
        a23.addGestureRecognizer(tapGestureRecognizer23)
        a31.addGestureRecognizer(tapGestureRecognizer31)
        a32.addGestureRecognizer(tapGestureRecognizer32)
        a33.addGestureRecognizer(tapGestureRecognizer33)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

