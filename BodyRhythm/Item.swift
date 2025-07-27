//
//  Item.swift
//  BodyRhythm
//
//  Created by Aziza Rahimova on 16/12/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
