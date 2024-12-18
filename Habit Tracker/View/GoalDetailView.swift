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
    
    var body: some View {
        List {
            Text(goal.miniDescription)
        }
        .navigationTitle(goal.name)
    }
}
