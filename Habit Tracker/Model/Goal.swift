//
//  Goal.swift
//  Habit Tracker
//
//  Created by IS 543 on 12/18/24.
//

import Foundation
import SwiftData

@Model
final class Goal {
    var name: String
    var miniDescription: String
    var dateStarted: Date
    var dateCompleted: Date?
    var timePeriodToComplete: String
    var isAchieved: Bool
    var categories: String
    var notes: String?
    
    init(name: String, miniDescription: String, dateStarted: Date, dateCompleted: Date? = nil, timePeriodToComplete: String, isAchieved: Bool, categories: String, notes: String? = nil) {
        self.name = name
        self.miniDescription = miniDescription
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
        self.timePeriodToComplete = timePeriodToComplete
        self.isAchieved = isAchieved
        self.categories = categories
        self.notes = notes
    }
}
