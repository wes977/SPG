//
//  heroStats.swift
//  SPG
//
//  Created by Student on 2016-11-23.
//  Copyright © 2016 WestNet. All rights reserved.
//

import Foundation
import SpriteKit
class HeroStats {
    
    var currHealth = Double(0)
    var currAttack = Double(0)
    var currDefense = Double(0)
    

    
    var baseHealth = Double(0)
    var baseAttack = Double(0)
    var baseDefense = Double(0)
    
    var level = Double(0)
    var currEXP = Double(0)
    var needEXP = Double(0)
    
    var item1 = Items()
    var item2 = Items()
    var item3 = Items()
    
    init ()
    {
        baseHealth = 10
        baseAttack = 2
        baseDefense = 5
        
        level = 1
        currEXP = 0
        needEXP = 100
        
        currHealth = baseHealth
        currAttack = baseAttack
        currDefense = baseDefense
        
        let startItem1 = Items()
        let startItem2 = Items()
        let startItem3 = Items()
        
        startItem1.changeColor(nColor: UIColor.blue)
        startItem2.changeColor(nColor: UIColor.blue)
        startItem3.changeColor(nColor: UIColor.blue)
        
        startItem1.setStats(nName: "Shitty Sword", nHealth: 1, nAttack: 0, nDefense: 0)
        startItem2.setStats(nName: "Shitty Sword 2", nHealth: 0, nAttack: 1, nDefense: 0)
        startItem3.setStats(nName: "Shitty Sword 3", nHealth: 0, nAttack: 0, nDefense: 1)
        
        equipItem(whichSlot: 1, newItem: startItem1)
                equipItem(whichSlot: 2, newItem: startItem2)
                equipItem(whichSlot: 3, newItem: startItem3)
    }
    
    func equipItem (whichSlot:UInt32,newItem:Items)
    {
        if (whichSlot == 1)
        {
            item1 = newItem
        }
        if (whichSlot == 2)
        {
            item2 = newItem
        }
        if (whichSlot == 3)
        {
            item3 = newItem
        }
    }
    
    func updateStats ()
    {
        currHealth = item1.health + item2.health + item3.health + baseHealth
        currAttack = item1.attack + item2.attack + item3.attack + baseAttack
        currDefense = item1.defense + item2.defense + item3.defense + baseDefense
    }
    
    func gainEXP (EXPgained:Double)
    {
        currEXP = currEXP + EXPgained
        
        if (currEXP >= needEXP)
        {
            level = level + 1
            currEXP = currEXP - needEXP
        }
        
    }
    
    func gotAttacked (incAttack:Double)
    {
        currHealth =  currHealth - ( incAttack - (currDefense * 0.1))
    }
    
    
}