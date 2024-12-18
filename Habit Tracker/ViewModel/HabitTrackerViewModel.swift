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
    private(set) var categories: [String] = []
    
    func goalCategories(for category: String) -> [Goal] {
        return goals.filter {
            $0.categories.lowercased().contains(category.lowercased())
        }
    }
    
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
        gatherCategories()
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
    
    private func gatherCategories() {
        var listOfCategories: Set<String> = []
        
        goals.forEach { goal in
            let categoryPieces = goal.categories.split(separator: ",")
            
            categoryPieces.forEach { category in
                let canonicalCategory = category.trimmingCharacters(in: .whitespacesAndNewlines).capitalized
                
                if !listOfCategories.contains(canonicalCategory) {
                    listOfCategories.insert(canonicalCategory)
                }
            }
        }
        
        categories = Array(listOfCategories).sorted()
    }
    
    func saveAllChanges() {
        try? modelContext.save()
    }
}
