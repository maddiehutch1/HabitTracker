//
//  Habit_TrackerApp.swift
//  Habit Tracker
//
//  Created by IS 543 on 12/18/24.
//

import SwiftUI
import SwiftData

@main
struct Habit_TrackerApp: App {
    
    // set up container and view model
    let container: ModelContainer
    let viewModel: HabitTrackerViewModel

    var body: some Scene {
        WindowGroup {
            GoalTrackerView()
        }
        .modelContainer(container)
        .environment(viewModel)
    }
    
    init() {
        do {
            container = try ModelContainer(for: Goal.self)
        } catch {
            fatalError("""
                Failed to create ModelContainer for Recipe. If you made a change
                to the Model, then uninstall the app and restart it from XCode.
                """)
        }
        
        // sets viewModel equal to container's main Context
        viewModel = HabitTrackerViewModel(container.mainContext)
    }
}
