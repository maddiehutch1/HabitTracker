//
//  HabitTrackerViewModel.swift
//  Habit Tracker
//
//  Created by IS 543 on 12/18/24.
//

import Foundation
import SwiftData

@Observable
class HabitTrackerViewModel {
    
    // MARK: - Properties
    
    private var modelContext: ModelContext
    
    // MARK: - Initialization
    
    init(_ modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    // MARK: - Model Access
    
    private(set) var goals: [Goal] = []
    
    // MARK: - User Intents
    
    
    // MARK: - Private Helpers
    
    private func fetchGoals() {
        
    }
}
