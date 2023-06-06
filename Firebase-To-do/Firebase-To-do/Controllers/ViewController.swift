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
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuteTableView()
    }
    
    // MARK: - Helper Functions
    
    func configuteTableView() {
        tableView.backgroundColor = .lightGray
        
        tableView.register(TodoCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 75
        tableView.separatorColor = .systemRed
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        tableView.tableFooterView = UIView() // Blank UIView
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
