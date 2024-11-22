//
//  HalfCircleProgressView.swift
//  ToDoProgress
//
//  Created by Devis on 21/11/2024.
//

import SwiftUI

struct HalfCircleProgressView: View {
    
    var tasks: [Task]
    
    var body: some View {
        
        let totalTasks = tasks.count
        let doneTasks = tasks.filter {$0.status == .done}.count
        let inProgressTasks = tasks.filter {$0.status == .inProgress}.count
        let donePercentage = CGFloat(doneTasks) / CGFloat(totalTasks)
        let inProgressPercentage = CGFloat(inProgressTasks) / CGFloat(totalTasks)
        
        return ZStack{
            ProgressCircle(trimFrom: 0, trimTo: 0.5, color: Color(.systemGray5), lineWidth: 20)
            ProgressCircle(trimFrom: donePercentage * 0.5, trimTo: (donePercentage + inProgressPercentage) * 0.5, color: .yellow, lineWidth: 20)
            ProgressCircle(trimFrom: 0, trimTo: donePercentage * 0.5, color: .blue, lineWidth: 20)
            VStack(spacing: 44){
                Text("\(Int(donePercentage * 100))%")
                    .font(.largeTitle)
                    .bold()
                HStack(spacing: 30){
                    Scircle(title: "Todo", color: Color(.systemGray5))
                    Scircle(title: "In progress", color: Color(.yellow))
                    Scircle(title: "Done", color: Color(.blue))
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}


struct ProgressCircle: View {
    
    var trimFrom: CGFloat
    var trimTo: CGFloat
    var color: Color
    var lineWidth: CGFloat
    
    var body: some View {
        Circle()
            .trim(from: trimFrom, to: trimTo)
            .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round ,lineJoin: .round))
            .rotationEffect(.degrees(180))
            .foregroundStyle(color)
    }
}

struct Scircle: View {
    
    var title: String
    var color: Color
    
    var body: some View {
        HStack{
            Circle()
                .frame(width: 10, height: 10)
                .foregroundStyle(color)
            Text(title)
                .font(.subheadline)
        }
    }
}


