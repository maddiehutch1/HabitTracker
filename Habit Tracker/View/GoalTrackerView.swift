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

    @State private var displayAddEditSheet = false
    
    var body: some View {
        NavigationSplitView {
            List {
                Section(header: Text("GOALS")) {
                    NavigationLink(destination: goalsList(for: viewModel.goals, with: "All Goals")) {
                        Text("All Goals")
                    }
                }
                
                Section(header: Text("CATEGORIES")) {
                    
                }
            }
            .sheet(isPresented: $displayAddEditSheet) {
                AddEditGoalSheet()
            }
        } content: {
            goalsList(for: viewModel.goals, with: "Habit Tracker")
        } detail: {
            Text("Select a goal")
        }
    }

    private func goalsList(for goals: [Goal], with name: String) -> some View {
        List {
            ForEach(goals) { goal in
                NavigationLink(goal.name, destination:
                    GoalDetailView(goal: goal))
            }
        }
        .navigationTitle(name)
        .toolbar {
            ToolbarItem {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
                EditButton()
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            displayAddEditSheet = true
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            // NEEDSWORK
        }
    }
}

#Preview {
    GoalTrackerView()
        .modelContainer(for: Goal.self, inMemory: true)
}
