//
//  AddEditGoalSheet.swift
//  Habit Tracker
//
//  Created by IS 543 on 12/18/24.
//

import SwiftUI

struct AddEditGoalSheet: View {
    @Environment(HabitTrackerViewModel.self) private var viewModel
    @Environment(\.presentationMode) var presentationMode

    @State private var goal: Goal = Goal(
        name: "",
        miniDescription: "",
        dateStarted: Date(),
        dateCompleted: nil,
        timePeriodToComplete: "",
        isAchieved: false,
        categories: [],
        notes: ""
    )
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Goal Details")) {
                    TextField("Goal Name", text: $goal.name)
                    TextField("Description", text: $goal.miniDescription)
                    DatePicker("Date Started", selection: $goal.dateStarted, displayedComponents: .date)
                    DatePicker("Date Completed",
                               selection: Binding<Date>(
                                   get: { goal.dateCompleted ?? Date() },
                                   set: { newValue in goal.dateCompleted = newValue }
                               ),
                               displayedComponents: .date)
                    TextField("Time Period", text: $goal.timePeriodToComplete)
                    Toggle("Is Achieved", isOn: $goal.isAchieved)
                    TextField("Notes", text: Binding<String>(
                        get: { goal.notes ?? "" },
                        set: { newValue in goal.notes = newValue.isEmpty ? nil : newValue })
                    )
                }
            }
            .navigationTitle("Set Goal")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: saveGoal) {
                        Text("Save")
                    }
                }
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button
//                }
            }
        }
    }
    
    private func saveGoal() {
        viewModel.saveGoal(goal)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    AddEditGoalSheet()
}
