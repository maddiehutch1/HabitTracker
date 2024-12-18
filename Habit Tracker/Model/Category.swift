//
//  Category.swift
//  Habit Tracker
//
//  Created by IS 543 on 12/18/24.
//

import Foundation
import SwiftData

@Model
final class Category {
    var name: String
    var miniDescription: String
    
    init(name: String, miniDescription: String) {
        self.name = name
        self.miniDescription = miniDescription
    }
}
