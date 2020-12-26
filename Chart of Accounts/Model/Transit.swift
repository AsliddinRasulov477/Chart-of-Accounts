//
//  FileOne.swift
//  Ish
//
//  Created by Asliddin Rasulov on 9/14/20.
//  Copyright © 2020 Asliddin Rasulov. All rights reserved.
//

import Foundation

class TransitModel {
    func getTransitRows() -> [[String]] {
        
        var transitRows: [[String]] = []
        
        transitRows = [["9010", "9020", "9030", "9040", "9050"], ["9110", "9120", "9130", "9140", "9150"], ["9210", "9220"], ["9310", "9320", "9330", "9340", "9350", "9360", "9370", "9380", "9390"], ["9410", "9420", "9430"], ["9510", "9520", "9530", "9540", "9550", "9560", "9590"], ["9610", "9620", "9630", "9690"], ["9710", "9720"], ["9810", "9820"], ["9910"]]
        
        return transitRows
    }
    
    func getTransitSections() -> [String] {
        
        var transitSections: [String] = []
        
        transitSections = ["9000", "9100", "9200", "9300", "9400", "9500", "9600", "9700", "9800", "9900"]
        
        return transitSections
    }
    
}
