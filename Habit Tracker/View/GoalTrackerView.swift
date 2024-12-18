//
//  GoalTrackerView.swift
//  Habit Tracker
//
//  Created by IS 543 on 12/18/24.
//

import SwiftUI
import SwiftData

struct GoalTrackerView: View {
    @Environment(HabitTrackerViewModel.self) private var viewModel

    var body: some View {
        NavigationSplitView {
            List {
                Section(header: Text("GOALS")) {
                    // NEEDS WORK
                }
                
                Section(header: Text("CATEGORIES")) {
                    
                }
            }
        } content: {
            
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            // NEEDSWORK
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                // NEEDSWORK
            }
        }
    }
}

#Preview {
    GoalTrackerView()
        .modelContainer(for: Goal.self, inMemory: true)
}
