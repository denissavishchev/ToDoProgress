//
//  TaskRow.swift
//  ToDoProgress
//
//  Created by Devis on 21/11/2024.
//

import SwiftUI

struct TaskRow: View {
    
    @Binding var task: Task
    @State private var tapCount = 0
    @State private var tapTimer: Timer?
    
    var body: some View {
        HStack{
            Circle()
                .frame(width: 16, height: 16)
                .foregroundStyle(colorForStatus(task.status))
            Text(task.title)
                .padding()
            Spacer()
            Image(systemName: iconForStatus(task.status))
                .frame(width: 20, height: 20)
                .contentTransition(.symbolEffect)
        }
        .padding(.horizontal)
        .background(Color(.systemGray5))
        .clipShape(.rect(cornerRadius: 10))
        .contentShape(Rectangle())
        .onTapGesture {
            tapCount += 1
            tapTimer?.invalidate()
            tapTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false){_ in
                if tapCount == 1{
                    withAnimation{
                        cycleTaskStatus()
                    }
                }else if tapCount == 2{
                    withAnimation{
                        task.status = .done
                    }
                }
                tapCount = 0
            }
        }
    }
    
    private func colorForStatus(_ status: TaskType) -> Color{
        switch status {
        case .todo:
            return Color.gray.opacity(0.3)
        case .inProgress:
            return Color.yellow
        case .done:
            return Color.blue
        }
    }
    
    private func iconForStatus(_ status: TaskType) -> String{
        switch status {
        case .todo:
            return "zzz"
        case .inProgress:
            return "hourglass"
        case .done:
            return "checkmark"
        }
    }
    
    private func cycleTaskStatus(){
        switch task.status {
        case .todo:
            task.status = .inProgress
        case .inProgress:
            task.status = .done
        case .done:
            task.status = .todo
        }
    }
}

