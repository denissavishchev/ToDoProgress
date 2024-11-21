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
            ScrollView{
                VStack{
                    HalfCircleProgressView(tasks: tasks)
                        .frame(height: 250)
                        .padding(.top, 70)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
