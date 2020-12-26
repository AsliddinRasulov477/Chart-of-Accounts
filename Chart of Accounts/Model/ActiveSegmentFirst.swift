//
//  FileOne.swift
//  Ish
//
//  Created by Asliddin Rasulov on 9/14/20.
//  Copyright © 2020 Asliddin Rasulov. All rights reserved.
//

import Foundation

class ActiveSegmentFirstModel {
    
    func getActiveSegmentFirstRows() -> [[String]] {
        
        var activeSegmentFirstRows: [[String]] = []
        activeSegmentFirstRows = [["0110", "0111", "0112", "0120", "0130", "0140", "0150", "0160", "0170", "0180", "0190", "0199"], ["0211", "0212", "0220", "0230", "0240", "0250", "0260", "0270", "0280", "0290", "0299"], ["0310"], ["0410", "0420", "0430", "0440", "0460", "0470", "0480", "0490"], ["0510", "0520", "0530", "0540", "0560", "0570", "0590"], ["0610", "0620", "0630", "0640", "0690"], ["0710", "0720"], ["0810", "0820", "0830", "0840", "0850", "0860", "0890"], ["0910", "0920", "0930", "0940", "0950", "0960", "0990"]]
        
        return activeSegmentFirstRows
        
    }
        
    func getActiveSegmentFirstSections() -> [String] {
        
        var activeSegmentFirstSections: [String] = []
        activeSegmentFirstSections = ["0100", "0200", "0300", "0400", "0500", "0600", "0700", "0800", "0900"]
        
        return activeSegmentFirstSections
        
    }
    
}
