//  BarChartDayView.swift
//  HIITFit
//  Created by Loi Ton on 2/8/26.

import SwiftUI
import Charts

struct BarChartDayView: View {
    let day: ExerciseDay
    
    var body: some View {
        Chart {
            ForEach(Exercise.names, id: \.self) { name in
                BarMark(
                    x: .value(name, name),
                    y: .value("Total Count", day.countExercise(exercise: name)))
                .foregroundStyle(Color("history-bar"))
            }
            RuleMark(y: .value("Exercise", 1))
                .foregroundStyle(.red)
        }
        .padding()
    }
}

struct BarChartDayView_Previews: PreviewProvider {
    static var previews: some View {
        let history = HistoryStore(preview: true)
        return BarChartDayView(day: history.exerciseDays[0])
            .environmentObject(history)
    }
}
