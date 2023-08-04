import UIKit

class ToDoListController: UITableViewController {
    
    //==========================================================================================
    
    var toDoListVM = ToDoListControllerVM()
    
    //==========================================================================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UserDefaults로 부터 TODO 아이템 받아오기
        // 로직, 자료구조를 분리해서 객체 주입 (냉장고가 행동방식까지 알고 있는 상황 방지 - 로직 위임 ㅇㅅㅇ)
        toDoListVM.load()
        
        // 네비게이션 바 버튼(+) 설정
        // 만약 로직이 조금이라도 들어가면 바로 VM으로 위임
        // 바뀔 일이 없으면 그냥 VC에서
        navigationItem.title = "ToDo List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToDoItem))
        
        // 테이블 뷰 셀에 등록하기
        // UIKit 써야하면 VC에
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    //==========================================================================================
    
    // MARK: 테이블 뷰 data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListVM.toDoItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = toDoListVM.toDoItems[indexPath.row].title
        return cell
    }
    
    
    // MARK: TODO 아이템 추가하기
    
    @objc func addToDoItem() {
        
        // Alert창 객체 생성
        let alert = UIAlertController(title: "Add ToDo", message: "오늘 해야할 일을 입력해주세요", preferredStyle: .alert)
        
        
        // "Cancel" action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // Alert창에 text field 추가
        alert.addTextField()
        
        // "Add" action
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            if let title = alert.textFields?.first?.text, !title.isEmpty {
                
                //VM으로, 클로저 안에 self 쓰면 일반적으로 메모리누수 처리해주기 (모든 경우는 아님)
                self?.toDoListVM.getToDoTitle(title)
                self?.tableView.reloadData()
            }
        }
        
        // alert 창에 Add actions 추가
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        // alert 창 띄우기
        present(alert, animated: true)
    }
    
    
    // MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            toDoListVM.completedToDo(indexPath.row)
            
            // 테이블뷰 삭제 사항 업데이트
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

