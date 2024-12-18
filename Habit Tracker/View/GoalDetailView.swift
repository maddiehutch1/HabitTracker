//
//  GoalDetailView.swift
//  Habit Tracker
//
//  Created by IS 543 on 12/18/24.
//

import SwiftUI

struct GoalDetailView: View {
    
    @Bindable var goal: Goal
    @Environment(HabitTrackerViewModel.self) private var viewModel
    
    @State var displayEditGoalSheet = false
    
    var body: some View {
        List {
            Text(goal.miniDescription)
            Text(goal.dateStarted, format: .dateTime.day().month().year())
            
            if let dateCompleted = goal.dateCompleted {
                Text(dateCompleted, format: .dateTime.day().month().year())
            } else {
                Text("Goal not yet completed")
            }

            Text(goal.timePeriodToComplete)
            Text(goal.categories)
        }
        .navigationTitle(goal.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: editGoal) {
                    Label("Edit Goal", systemImage: "pencil")
                }
            }
            
            ToolbarItem {
                // ChatGPT assistance - I originally used toggle to get the heart to work, but design was not bueno
                Button(action: toggleGoalIsAchieved ) {
                    Image(systemName: goal.isAchieved ? "checkmark.square.fill" : "square")
                }
            }
        }
        .sheet(isPresented: $displayEditGoalSheet) {
            AddEditGoalSheet(editSetGoal: goal)
        }
    }
    
    private func toggleGoalIsAchieved() {
        goal.isAchieved.toggle()
        if goal.isAchieved {
            goal.dateCompleted = Date()
        } else {
            goal.dateCompleted = nil
        }
    }
    
    private func editGoal() {
        withAnimation {
            displayEditGoalSheet = true
        }
    }
}
