//
//  MealTimeViewController.swift
//  MealTimeCoreData
//
//  Created by Станислав Лемешаев on 08.03.2021.
//

import UIKit
import CoreData

class MealTimeViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var context: NSManagedObjectContext!
    private var array = [Date]()
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    // MARK: - Actions
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let date = Date()
        array.append(date)
        tableView.reloadData()
    }
    
    // MARK: - Helpers

}

// MARK: - UITableViewDataSource

extension MealTimeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Время приема пищи"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else { return UITableViewCell() }
        let date = array[indexPath.row]
        cell.textLabel?.text = dateFormatter.string(from: date)
        return cell
    }
    
    
}
