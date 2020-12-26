//
//  FileOne.swift
//  Ish
//
//  Created by Asliddin Rasulov on 9/14/20.
//  Copyright © 2020 Asliddin Rasulov. All rights reserved.
//

import Foundation

class PassiveSegmentFirstModel {
    
    func getPassiveSegmentFirstRows() -> [[String]] {
        
        var passiveSegmentFirstRows: [[String]] = []
        
        passiveSegmentFirstRows = [["6010", "6020"], ["6110", "6120"], ["6210", "6220", "6230", "6240", "6250", "6290"], ["6310", "6320", "6390"], ["6410"], ["6510", "6520"], ["6610", "6620", "6630"], ["6710", "6720"], ["6810", "6820", "6830", "6840"], ["6910", "6920", "6930", "6940", "6950", "6960", "6970", "6990"], ["7010", "7020"], ["7110", "7120"], ["7210", "7220", "7230", "7240", "7250", "7290"], ["7810", "7820", "7830", "7840"], ["7910", "7920"]]
        
        return passiveSegmentFirstRows
        
    }
    
    func getPassiveSegmentFirstSections() -> [String] {
        
        var passiveSegmentFirstSections: [String] = []
        
        passiveSegmentFirstSections = ["6000", "6100", "6200", "6300", "6400", "6500", "6600", "6700", "6800", "6900", "7000", "7100", "7200", "7800", "7900"]
        
        return passiveSegmentFirstSections
        
    }
}

