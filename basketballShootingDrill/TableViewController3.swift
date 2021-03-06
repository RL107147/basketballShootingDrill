import UIKit

class TableViewController3: UITableViewController {
    
    let defaults3 = UserDefaults.standard
    var assignments3: [String] = [] {
        didSet {
            defaults3.set(assignments3, forKey: "Assignment3")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedAssignments = defaults3.object(forKey: "Assignment3") as? [String]{
            assignments3 = savedAssignments
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return assignments3.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = assignments3[indexPath.row]
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            assignments3.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
    
    @IBAction func onAddButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Name-made/total/fieldgoal", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField)in
            textField.placeholder = "Add here"
            self.tableView.reloadData()
        }
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        let append = UIAlertAction(title: "add", style: .default) {(action) in
            let assignmentTextField = alert.textFields![0] as UITextField
            let assignment = assignmentTextField.text
            self.assignments3.append(assignment!)
            self.tableView.reloadData()
            
        }
        alert.addAction(append)
        present(alert, animated: true, completion: nil)
    }
    
}

