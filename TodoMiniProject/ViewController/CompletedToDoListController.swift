
import UIKit

class CompletedToDoListController: UITableViewController {
    
    
    var completedToDoListVM = CompletedToDoListControllerVM()
    
    //==========================================================================================
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UserDefaults로부터 완료된 todo 가져오기
        completedToDoListVM.loadCompletedToDoItems()
        
        // 테이블 뷰 셋팅
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    //==========================================================================================
    
    // MARK: 테이블 뷰 data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completedToDoListVM.completedToDoItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = completedToDoListVM.completedToDoItems[indexPath.row].title
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // editing style이 "delete"인지 체크
        if editingStyle == .delete {
            // data source로 부터 아이템 삭제
            completedToDoListVM.completedToDoItems.remove(at: indexPath.row)
            
            //UserDefaults의 업데이트 사항 저장
            completedToDoListVM.saveCompletedToDoItems()
            
            //animation을 적용하여 테이블뷰 row 삭제
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
