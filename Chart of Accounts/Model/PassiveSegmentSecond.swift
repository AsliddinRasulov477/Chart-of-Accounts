//
//  FileOne.swift
//  Ish
//
//  Created by Asliddin Rasulov on 9/14/20.
//  Copyright © 2020 Asliddin Rasulov. All rights reserved.
//

import Foundation

class PassiveSegmentSecondModel {
    
    func getPassiveSegmentSecondRows() -> [[String]] {
        
        var passiveSegmentSecondRows: [[String]] = []
        
        passiveSegmentSecondRows = [["8310", "8320", "8330"], ["8410", "8420"], ["8510", "8520", "8530"], ["8610", "8620"], ["8710", "8720"], ["8810", "8820", "8830", "8840", "8890"], ["8910"]]
        
        return passiveSegmentSecondRows
    }
    
    func getPassiveSegmentSecondSections() -> [String] {
        
        var passiveSegmentSecondSections: [String] = []
        
        passiveSegmentSecondSections = ["8300", "8400", "8500", "8600", "8700", "8800", "8900"]
        
        return passiveSegmentSecondSections
        
    }
    
}
