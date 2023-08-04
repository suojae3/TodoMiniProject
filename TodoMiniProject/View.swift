
import UIKit

struct HomeStyle {
    
    static func background(to view: UIView) {
        view.backgroundColor = .white
    }
    
    static func titleLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }
    
    static func actionButton(target: Any?, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(target, action: action, for: .touchUpInside)
        return button
    }
}

struct HomeLayout {
    
    static func apply(titleLabel: UILabel, startButton: UIButton, completedToDoButton: UIButton, in view: UIView) {
        titleLabel.text = "My First ToDo App"
        startButton.setTitle("ToDo list", for: .normal)
        completedToDoButton.setTitle("Completed ToDo", for: .normal)
        
        view.addSubview(titleLabel)
        view.addSubview(startButton)
        view.addSubview(completedToDoButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            completedToDoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            completedToDoButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 20)
        ])
    }
}

