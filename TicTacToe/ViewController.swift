//
//  ViewController.swift
//  TicTacToe
//
//  Created by Sagitova Gulnaz on 15.11.16.
//  Copyright © 2016 Sagitova Gulnaz. All rights reserved.
//

import UIKit
import AVFoundation

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
    var number = (x: 0, y: 0)
    enum BoardValue:String{
        case x = "x"
        case o = "o"
        case empty = "empty"
    }
    var board = [[BoardValue]]()
    enum Move:String {
        case x = "x"
        case o = "o"
    }
    let player1 = Player(name: "Player One", way: Move.x)
    let player2 = Player(name: "Player Two", way: Move.o)
    var currentPlayer = Player(name: "dummyPlayer", way: Move.x) //TODO: make constructor
    var stopGame:Bool = false
    var audioPlayerNewGame = AVAudioPlayer()
    var audioPlayerWin = AVAudioPlayer()
    var audioPlayerWay = AVAudioPlayer()
    
    
    func updateMsg(){
        msg.text = "The \(currentPlayer.name) turn!"
    }
    
    func getAssetName() -> String {
        if currentPlayer.way == Move.x {
            return "x"
        } else {
            return "o"
        }
    }
    
    func changePlayer(){
        if currentPlayer === player1{
            currentPlayer = player2
        } else {
            currentPlayer = player1
        }
    }
    
    func tappedView(sender: UIGestureRecognizer){
        let imageView = sender.view as? UIImageView
        audioPlayerWay.play()
        if imageView?.image == nil && !stopGame {
            imageView?.image = UIImage(named: getAssetName())
            let n = (imageView?.tag)! as Int
            updateBoard(tag: n)
            if (checkForWin()) {
                msgWin()
                audioPlayerWin.play()
                stopGame = true
            } else {
                changePlayer()
                updateMsg()
            }
        }
    }
    
    func updateBoard(tag:Int){
        // print("tag \(tag)")
        number = splitTag(value: tag)
        print("number \(number)")
        updateArray(x: number.x, y: number.y)
    }
    
    func splitTag(value:Int) -> (x:Int, y:Int){
        let y:Int = value % 10
        print(y)
        let x:Int = (value - y) / 10
        print(x)
        return (x-1, y-1)
    }
    
    func clearBoard(){
        board = Array(repeating: Array(repeating: BoardValue.empty, count: 3), count: 3)
    }
    
    func updateArray(x:Int, y:Int){
        board[x][y] = currentPlayer.way == Move.x ? BoardValue.x : BoardValue.o
        for i in 0 ..< 3 {
            for j in 0 ..< 3 {
                print("board \(i+1) \(j+1)] \(board[i][j])")
            }
        }
    }
    
    func delayMsg(){
        let delayInSeconds = 0.5
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            self.updateMsg()
        }
    }
    
    func msgWin(){
        msg.text = "\(currentPlayer.name) WON !!!"
    }
    
    func checkForWin() -> Bool{
        // Rows
        if (board[0][0] != BoardValue.empty && board[0][0] == board[0][1] && board[0][1] == board[0][2]) ||
           (board[1][0] != BoardValue.empty && board[1][0] == board[1][1] && board[1][1] == board[1][2]) ||
           (board[2][0] != BoardValue.empty && board[2][0] == board[2][1] && board[2][1] == board[2][2]) ||
        //Cols
           (board[0][0] != BoardValue.empty && board[0][0] == board[1][0] && board[1][0] == board[2][0]) ||
           (board[1][1] != BoardValue.empty && board[0][1] == board[1][1] && board[1][1] == board[2][1]) ||
           (board[0][2] != BoardValue.empty && board[0][2] == board[1][2] && board[1][2] == board[2][2]) ||
        // Diag
           (board[0][0] != BoardValue.empty && board[0][0] == board[1][1] && board[1][1] == board[2][2]) ||
           (board[2][0] != BoardValue.empty && board[2][0] == board[1][1] && board[1][1] == board[0][2]) {
            return true
        } else {
            return false
        }
    }

    @IBAction func newGame(_ sender: UIButton) {
        msg.text = "New Game!"
        stopGame = false
        for image in images {
            image.image = nil
        }
        clearBoard()
        delayMsg()
        audioPlayerNewGame.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPlayer = player1
        updateMsg()
        clearBoard()
        images = [a11, a12, a13, a21, a22, a23, a31, a32, a33]
        for image in images {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tappedView))
            image.isUserInteractionEnabled = true
            image.addGestureRecognizer(tapGestureRecognizer)
        }
        do {
            audioPlayerNewGame = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "TTC_newGame", ofType: "wav")!))
            audioPlayerWin = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "TTCwin", ofType: "wav")!))
            audioPlayerWay = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "TTC_way", ofType: "mp3")!))
            audioPlayerNewGame.prepareToPlay()
            audioPlayerWin.prepareToPlay()
            audioPlayerWay.prepareToPlay()
        }
        catch {
            print("error")
        }
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    class Player{
        var name:String = ""
        var way: Move
        
        init(name:String, way:Move){
            self.name = name
            self.way = way
        }
    }
    
}

