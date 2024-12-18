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
        fetchData()
    }
    
    // MARK: - Model Access
    
    private(set) var goals: [Goal] = []
    
    // MARK: - User Intents
    
    func refreshData() {
        fetchData()
    }
    
    func saveGoal(_ goal: Goal) {
        modelContext.insert(goal)
        fetchData()
    }
    
    func update(_ goal: Goal) {
        saveAllChanges()
        fetchData()
    }
    
    func delete(_ goal: Goal) {
        modelContext.delete(goal)
        fetchData()
    }
    
    // MARK: - Private Helpers
    
    private func fetchData() {
        saveAllChanges()
        
        fetchGoals()
    }
    
    private func fetchGoals() {
        saveAllChanges()
        
        let fetchDescriptor = FetchDescriptor<Goal>(sortBy: [SortDescriptor(\.name)])
        
        do {
            goals = try modelContext.fetch(fetchDescriptor)
        } catch {
            print("Failed to fetch goals: \(error)")
        }
    }
    
    func saveAllChanges() {
        try? modelContext.save()
    }
}
