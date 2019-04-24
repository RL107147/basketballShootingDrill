import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var shotMadeLabel: UILabel!
    
    @IBOutlet weak var shotMissedLabel: UILabel!
    
    @IBOutlet weak var totalShotsLabel: UILabel!
    
    @IBOutlet weak var fieldGoalLabel: UILabel!
    
    var shotMade: Int = 0 {
        didSet {
            shotMadeLabel.text = "\(shotMade)"
        }
    }
    var shotMissed: Int = 0 {
        didSet{
            shotMissedLabel.text = "\(shotMissed)"
        }
    }
    var totalShots: Int = 0 {
        didSet{
            totalShotsLabel.text = "\(totalShots)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        shotMade = 0
        shotMissed = 0
        totalShots = 0
//        if let x = UserDefaults.standard.object(forKey: "shotMade") as? String{
//            shotMadeLabel.text = x
//
//
//        }
//        if let y = UserDefaults.standard.object(forKey: "shotMissed") as? String{
//            shotMissedLabel.text = y
//        }
    }
        
    
    func fieldGoalPerecntage(){
        let fieldGoal: Double = Double(shotMade) / Double(totalShots).rounded() * 100
        fieldGoalLabel.text = "\(fieldGoal.rounded()).%"
        //print(fieldGoal)
    }
    func saveLabelData(){
        
    }
    @IBAction func shotMadeAddButton(_ sender: UIButton) {
        shotMade += 1
        totalShots += 1
        fieldGoalPerecntage()
//        UserDefaults.standard.set(shotMadeLabel.text, forKey: "shotMade")
        
        
        
    }
    @IBAction func shotMadeSubtractButton(_ sender: UIButton) {
        shotMade -= 1
        totalShots -= 1
        fieldGoalPerecntage()
//        UserDefaults.standard.set(shotMadeLabel.text, forKey: "shotMade")
//
        
    }
    @IBAction func clearShotMade(_ sender: UIButton) {
        shotMadeLabel.text = "0"
        shotMade = 0
        totalShots = shotMissed
        fieldGoalPerecntage()
//        UserDefaults.standard.set(shotMadeLabel.text, forKey: "shotMade")
        
    }
    @IBAction func shotMissedAddButton(_ sender: UIButton) {
        shotMissed += 1
        totalShots += 1
        fieldGoalPerecntage()
//        UserDefaults.standard.set(shotMissedLabel.text, forKey: "shotMissed")
//
        
    }
    @IBAction func shotMissedSubtractButton(_ sender: UIButton) {
        shotMissed -= 1
        totalShots -= 1
        fieldGoalPerecntage()
//       UserDefaults.standard.set(shotMissedLabel.text, forKey: "shotMissed")
        
        
    }
    @IBAction func shotMissedClearButton(_ sender: UIButton) {
        shotMissedLabel.text = "0"
        shotMissed = 0
        totalShots = shotMade
        fieldGoalPerecntage()
//        UserDefaults.standard.set(shotMissedLabel.text, forKey: "shotMissed")
    }
}

