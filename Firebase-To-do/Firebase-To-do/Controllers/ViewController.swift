//
//  ViewController.swift
//  Firebase-To-do
//
//  Created by Enrico Sousa Gollner on 28/03/23.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: - Properties
    
    let reuseIdentifier = "TodoCell"
    
    lazy var createNewButton: UIButton = {
        let button = UIButton()
        button.tintColor = .red
        button.backgroundColor = .green
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        
        button.addTarget(self, action: #selector(createNewToDo), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuteTableView()
    }
    
    // MARK: - Selectors
    
    @objc func createNewToDo() {
        let vc = CreateToDoController()
        self.present(vc, animated: true, completion: nil)
    }
    
    // MARK: - Helper Functions
    
    func configuteTableView() {
        tableView.backgroundColor = .lightGray
        
        tableView.register(TodoCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 75
        tableView.separatorColor = .systemRed
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        tableView.tableFooterView = UIView() // Blank UIView
        
        tableView.addSubview(createNewButton)
        createNewButton.anchor(bottom: tableView.safeAreaLayoutGuide.bottomAnchor, right: tableView.safeAreaLayoutGuide.rightAnchor, paddingBottom: 16, paddingRight: 16, width: 56, height: 56)
        createNewButton.layer.cornerRadius = 56 / 2
        createNewButton.alpha = 1
    }

}

// MARK: - : UITableViewDelegate/UITableViewDataSource

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? TodoCell else { return UITableViewCell() }
        
        return cell
    }
    
    // Update status of the cell (Incomplete -> Finished)
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
