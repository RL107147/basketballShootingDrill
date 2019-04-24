import UIKit

class TableViewController2: UITableViewController {
    let defaults2 = UserDefaults.standard
    var assignments2: [String] = [] {
        didSet {
            defaults2.set(assignments2, forKey: "Assignment2")
        }
    }
override func viewDidLoad() {
        super.viewDidLoad()
        if let savedAssignments2 = defaults2.object(forKey: "Assignment2") as? [String]{
            assignments2 = savedAssignments2
        }
    }
override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return assignments2.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = assignments2[indexPath.row]

        return cell
    }
   
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
       
        return true
    }
    

  
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            assignments2.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }    
    }
    @IBAction func addShootingData(_ sender: UIBarButtonItem) {
        let alert2 = UIAlertController(title: "Name-made/total/fieldgoal", message: nil, preferredStyle: .alert)
        alert2.addTextField { (textField)in
            textField.placeholder = "Add here"
            self.tableView.reloadData()
        }
        let cancel2 = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert2.addAction(cancel2)
        let append = UIAlertAction(title: "add", style: .default) {(action) in
            let assignmentTextField = alert2.textFields![0] as UITextField
            let assignment = assignmentTextField.text
            self.assignments2.append(assignment!)
            self.tableView.reloadData()
            
        }
        alert2.addAction(append)
        present(alert2, animated: true, completion: nil)
    }
    }
    

  


