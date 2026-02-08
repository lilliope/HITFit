//  HistoryView.swift
//  HIITFit
//  Created by Loi Ton on 1/27/26.

import SwiftUI

struct HistoryView: View {
    @Binding var showHistory: Bool
    @EnvironmentObject var history: HistoryStore
    
    var headerView: some View {
        HStack {
            Spacer()
            Text("History")
                .font(.title)
            Spacer()
            Button {
                showHistory.toggle()
            }
            label: {
                Image(systemName:"xmark.circle")
            }
        .font(.title)
        }
    }
    
    func dayView(day: ExerciseDay) -> some View {
        ForEach(day.exercises, id: \.self) { exercise in
            Text(exercise)
        }
    }
    
    var body: some View {
        VStack {
            headerView
                .padding()
            Form {
                ForEach(history.exerciseDays) { day in
                    dayView(day: day)
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        let history = HistoryStore(preview: true)
        HistoryView(showHistory: .constant(true))
            .environmentObject(HistoryStore())
    }
}
