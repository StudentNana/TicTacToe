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
    enum move:String {
        case x = "x"
        case o = "o"
    }
    let player1 = Player(name: "First", way: move.x.rawValue)
    let player2 = Player(name: "Second", way: move.o.rawValue)
    var currentPlayer = Player(name: "dummyPlayer", way: move.x.rawValue)

    
    func tappedView(sender: UIGestureRecognizer){
        
        if currentPlayer  === player1 {
            msg.text = "The first Player turn!"
            let image = sender.view as? UIImageView
            image?.image = UIImage(named: "x")
            let n = (image?.tag)! as Int
            print("tag \(n)")
            splitTag(value: n)
//            checkForWin(value: n)
            currentPlayer = player2
        } else if currentPlayer === player2{
            msg.text = "The second player turn!"
            let image = sender.view as? UIImageView
            image?.image = UIImage(named: "o")
            let n = (image?.tag)! as Int
            print("tag \(n)")
            splitTag(value: n)
//            checkForWin(value: n)
            currentPlayer = player1
        }
    }
    
    func splitTag(value:Int) -> (x:Int, y:Int){
        let x:Int = value % 10
        print(x)
        let y:Int = (value - x) / 10
        print(y)
        return (x, y)
    }
    
//    func checkForWin(value:Int) -> String{
//        print(n)
//        if drawX {
//            
//            msg.text = "the first player won!!!"
//        } else {
//            msg.text = "the second player won!!!"
//        }
//    }
    @IBAction func newGame(_ sender: UIButton) {
        msg.text = "New Game!"
        for image in images {
            image.image = nil
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPlayer = player1
        images = [a11, a12, a13, a21, a22, a23, a31, a32, a33]
        for image in images {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tappedView))
            image.isUserInteractionEnabled = true
            image.addGestureRecognizer(tapGestureRecognizer)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    class Player{
        var name:String = ""
        var way = move.x
        
        init(name:String, way:String){
            self.name = name
            self.way = move.x
        }
    }
    
}

