
import Foundation

class CompletedToDoListControllerVM {
    
    var completedToDoItems: [ToDoItem] = []
    
    // MARK: UserDefaults
    
    // UserDefaults로 부터 완료된 todo 가져오기
    func loadCompletedToDoItems() {
        if let savedData = UserDefaults.standard.data(forKey: "completedToDoItems"),
           let decodedItems = try? JSONDecoder().decode([ToDoItem].self, from: savedData) {
            completedToDoItems = decodedItems
        }
    }
    func saveCompletedToDoItems() {
        if let encodedData = try? JSONEncoder().encode(completedToDoItems) {
            UserDefaults.standard.set(encodedData, forKey: "completedToDoItems")
        }
    }
    
}
