import UIKit

class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // label & button style 객체생성
        let titleLabel = HomeStyle.titleLabel()
        let startButton = HomeStyle.actionButton(target: self, action: #selector(viewToDo))
        let completedToDoButton = HomeStyle.actionButton(target: self, action: #selector(viewCompletedToDo))
        
        //background 주입
        HomeStyle.background(to: view)

        // HomeLayout 주입
        HomeLayout.apply(titleLabel: titleLabel, startButton: startButton, completedToDoButton: completedToDoButton, in: view)
    }
    
    //MARK: TODO List 이동 액션
    @objc func viewToDo() {
        
        // 다음화면(todo) 네비게이트 컨트롤로 이동
        let toDoListController = ToDoListController()
        navigationController?.pushViewController(toDoListController, animated: true)
    }
    
    //MARK: Complete TODO List 이동 액션
    @objc func viewCompletedToDo() {
        
        // 다음화면(completed) 네비게이트 컨트롤로 이동
        let completedToDoListController = CompletedToDoListController()
        navigationController?.pushViewController(completedToDoListController, animated: true)
    }
}
