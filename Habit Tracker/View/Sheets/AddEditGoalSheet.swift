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

    let editSetGoal: Goal?
    
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
    
    init(editSetGoal: Goal?) {
        self.editSetGoal = editSetGoal
        
        if let goalToEdit = editSetGoal {
            goal.name = goalToEdit.name
            goal.miniDescription = goalToEdit.miniDescription
            goal.dateStarted = goalToEdit.dateStarted
            goal.dateCompleted = goalToEdit.dateCompleted
            goal.timePeriodToComplete = goalToEdit.timePeriodToComplete
            goal.isAchieved = goalToEdit.isAchieved
            goal.categories = goalToEdit.categories
            goal.notes = goalToEdit.notes
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Goal Details")) {
                    TextField("Goal Name", text: $goal.name)
                    
                    TextField("Description", text: $goal.miniDescription)
                    
                    DatePicker("Date Started", selection: $goal.dateStarted, displayedComponents: .date)
                    
                    // do this only when you are editing your goal
                    if isEditMode {
                        Toggle("Is Achieved", isOn: $goal.isAchieved)
                        DatePicker("Date Completed",
                                   selection: Binding<Date>(
                                       get: { goal.dateCompleted ?? Date() },
                                       set: { newValue in
                                           goal.dateCompleted = isEditMode ? newValue : nil
                                       }
                                   ),
                                   displayedComponents: .date)
                    }
                    
                    TextField("Time Period", text: $goal.timePeriodToComplete)
                    
                    TextField("Notes", text: Binding<String>(
                        get: { goal.notes ?? "" },
                        set: { newValue in goal.notes = newValue.isEmpty ? nil : newValue })
                    )
                }
            }
            .navigationTitle("\(isEditMode ? "Edit" : "Set") Goal")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
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
    
    private var isEditMode: Bool {
        editSetGoal != nil
    }
    
    private func saveGoal() {
        if isEditMode {
            if let goalToEdit = editSetGoal {
                goalToEdit.name = goal.name
                goalToEdit.miniDescription = goal.miniDescription
                goalToEdit.dateStarted = goal.dateStarted
                goalToEdit.dateCompleted = goal.dateCompleted
                goalToEdit.timePeriodToComplete = goal.timePeriodToComplete
                goalToEdit.isAchieved = goal.isAchieved
                goalToEdit.categories = goal.categories
                goalToEdit.notes = goal.notes
            }
            
            viewModel.update(goal)
        } else {
            viewModel.saveGoal(goal)
        }
        presentationMode.wrappedValue.dismiss()
    }
}
