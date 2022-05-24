
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    let CalculateBMI = calculateBMI()
    var height: Float = 0.0
    var weight: Float = 0.0
    var bmi: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSlider(_ sender: UISlider) {
         height = sender.value

        heightLabel.text = "\( String(format: "%.2f", height)) m"
        
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
         weight = sender.value
        
        weightLabel.text = "\(String(format: "%.0f", weight)) kg"
    }
    
    
    @IBAction func caculateButton(_ sender: UIButton) {
        
        let result = CalculateBMI.calculate(height: height, weight: weight)
        
        bmi = result

        performSegue(withIdentifier: "GoToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let second = segue.destination as! ResultViewController
        if (bmi != nil) {
        second.bmiResult = bmi!
        }
    }

}
