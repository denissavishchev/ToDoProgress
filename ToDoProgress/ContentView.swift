import SwiftUI

struct Task: Identifiable{
    let id = UUID()
    let title: String
    var status: TaskType = .todo
}

struct ContentView: View {
    
    @State var text = ""
    @State var selectedTask: TaskType? = .todo
    @State private var tasks: [Task] = [
        Task(title: "Set up Xcode"),
        Task(title: "Create a new project"),
    ]
    
    var body: some View {
        ZStack{
            if tasks.isEmpty{
                VStack{
                    Text("No tasks")
                        .foregroundColor(.gray)
                        .font(.headline)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }else{
                ScrollView{
                    VStack{
                        HalfCircleProgressView(tasks: tasks)
                            .frame(height: 250)
                            .padding(.top, 70)
                        ForEach(tasks.indices, id: \.self){index in
                            HStack{
                                TaskRow(task: $tasks[index])
                                Button{
                                    deleteTask(at: IndexSet(integer: index))
                                }label: {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            .padding(.leading, 8)
                            }
                                
                        }
                    }
                }
                .safeAreaPadding(.bottom, 100)
                .scrollIndicators(.hidden)
            }
            NewTaskView(text: $text, selectedTask: $selectedTask){
                newTask in
                tasks.append(newTask)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .safeAreaPadding()
    }
    
    func deleteTask(at offsets: IndexSet) {
        guard let index = offsets.first else { return }
            if tasks.indices.contains(index) {
                tasks.remove(atOffsets: offsets)
            }
        }
}

#Preview {
    ContentView()
}
