//
//  Game.swift
//  Bullsye
//
//  Created by Samba NGOM on 06/12/2022.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score : Int = 0
    var round : Int = 1
    var gain = 0
    
   func points(sliderValue: Int) -> Int{
        var difference : Int
        difference = abs(target - sliderValue)
        var bonus: Int
        if difference == 0 {
            bonus = 100
        }
        else if difference <= 2 {
            bonus = 50
        }
        else{
            bonus = 0
        }
        return 100 - difference + bonus
    }
    
    mutating func setGain(sliderValue: Int){
        var difference : Int
        difference = abs(target - sliderValue)
        var bonus: Int
        if difference == 0 {
            bonus = 100
        }
        else if difference <= 2 {
            bonus = 50
        }
        else{
            bonus = 0
        }
        gain = 100 - difference + bonus
    }
    
    mutating func startsNewRound(points: Int){
        score+=points
        round+=1
        target = Int.random(in: 1...100)
    }
    
    mutating func restartGame(){
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
