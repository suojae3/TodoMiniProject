
import Foundation



class ToDoListControllerVM {
    
    
    // 이런 친구들은 private 캡슐화
    // private(set) -> 외부에서 get은 가능한데 내부에서만 set 가능
    private(set) var toDoItems: [ToDoItem] = []
    
    //MARK: input
    
    //title 전달
    
    // 이런애들은 캡슐 x 뷰컨과 통신해야함
    func getToDoTitle(_ title :String) {
        let newItem = ToDoItem(title: title)
        self.toDoItems.append(newItem)
        self.saveToDoItems()
    }
    
    func load() {
        loadToDoItems()
    }
    
    
    
    
    
    func completedToDo(_ index: Int) {
                
        // Todo 아이템 complete
        let completedItem = toDoItems[index]
        
        // Todo 아이템 삭제
        toDoItems.remove(at: index)
        saveToDoItems()
        
        // 완료된 아이템에 추가하기
        var completedItems = loadCompletedToDoItems()
        completedItems.append(completedItem)
        saveCompletedToDoItems(items: completedItems)
        
    }
    
    

    
    
    
    
    //output
    
    
    
    //MARK: UserDefaults
        
    // UserDefaults로부터 todo아이템 가져오기(decode)
    private func loadToDoItems() {
        
        if let savedData = UserDefaults.standard.data(forKey: "toDoItems"),
           let decodedItems = try? JSONDecoder().decode([ToDoItem].self, from: savedData) {
            toDoItems = decodedItems
        }
    }
    
    
    // 외부로 꺼낼일 없으면 Priviate으로 막는 것이 좋음 -> 캡슐화
    // 결합도/응집도 -> 결합도는 최대한 낮추기 -> 캡슐화를 통해 -> 막을 수 있는 건 다막는게 좋음
    // UserDefaults에 todo 아이템 저장 (encode)
    private func saveToDoItems() {
        if let encodedData = try? JSONEncoder().encode(toDoItems) {
            UserDefaults.standard.set(encodedData, forKey: "toDoItems")
        }
    }
    
    // UserDefaults로 부터 Completed todo아이템 가져오기(decode)
    private func loadCompletedToDoItems() -> [ToDoItem] {
        if let savedData = UserDefaults.standard.data(forKey: "completedToDoItems"),
           let decodedItems = try? JSONDecoder().decode([ToDoItem].self, from: savedData) {
            return decodedItems
        }
        return []
    }
    
    // UserDefaults에 Completed todo 아이템 저장 (encode)
    private func saveCompletedToDoItems(items: [ToDoItem]) {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: "completedToDoItems")
        }
    }

    
    
}


