import UIKit

class mediumModeViewController: UIViewController {
    
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet weak var scoreCounterLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    var highScor: Int = 0
    var timeOfProgressView : Float = 7
    var time : Timer = Timer()
    var currentIndex = 0
    var addCount = 0
    // MARK: - Questions and Answer Array
    
    var arrQuestion: NSMutableArray = ["1 + 1 = 2","2 + 2 = 5","5 + 5 = 10","8 + 8 = 17","34 + 8 = 42","68 - 12 = 55","81 - 35 = 46","(-20) + 18 = -3","16 - 39 = -23","0 - 1 = 0","8 * 12 = 96","55 * 2 = 111","48 * 4 = 180","68 * 3 = 203","89 * 2 = 178","180 / 3 = 62","12 / 20 = 0.6","147 / 7 = 36.5","189 / 9 = 21","87 / 10 = 8.10"]
    
    var arrAnswer: [Bool] = [true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false]
    // MARK: - in ViewDidLoad calling Some Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTimerForProgressView()
        setRandomQuestion()
        scoreCounterLabel.text = "0"
    }
    // MARK: - Set Index Of Answer and Random the Question

    func setRandomQuestion(){
        questionLabel.text = "\(arrQuestion[Int.random(in: 0...19)])"
        currentIndex = arrQuestion.index(of: questionLabel.text!)
    }
    // MARK: - Easy Mode 07 Second Timing Setting
    
    func setTimerForProgressView(){
        timeOfProgressView = 7
        
        time = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer),userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if timeOfProgressView < 0{
            time.invalidate()
            showAlert()
        }else{
            timeOfProgressView = timeOfProgressView - 0.01
            progressView.progress = Float(timeOfProgressView)/7
        }
    }
    // MARK: - Alert Or Pop-Up with Score and High Score
    
    func showAlert(){
        let alert : UIAlertController = UIAlertController(title: "Game Over", message: "Score : \(addCount)\nHighest Score : \(highScor)", preferredStyle: .alert)
        
        let home : UIAlertAction = UIAlertAction(title: "Home", style: .default){_ in
            self.homeTapped()
        }
        let replay : UIAlertAction = UIAlertAction(title: "Replay", style: .default){_ in
            self.time.invalidate()
            self.setTimerForProgressView()
            self.setRandomQuestion()
        }
        let share : UIAlertAction = UIAlertAction(title: "Share", style: .default)
        
        alert.addAction(home)
        alert.addAction(replay)
        alert.addAction(share)
        
        present(alert, animated: true, completion: nil)
    }
    // MARK: - All Navigations Of some Button Tapped
    
    func homeTapped(){
        let homeButton = navigationController?.storyboard?.instantiateViewController(withIdentifier: "homeScreenViewController") as! homeScreenViewController
        navigationController?.pushViewController(homeButton, animated: true)
    }
    
    func replayTapped(){
        let replayButton = navigationController?.storyboard?.instantiateViewController(withIdentifier: "mediumModeViewController") as! mediumModeViewController
        navigationController?.pushViewController(replayButton, animated: false)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func shareButtonTapped(){
    }
    // MARK: - Action when True Or False Button Tapped
    
    @IBAction func trueButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if arrAnswer[currentIndex] == true {
                addCount = addCount + 1
                if addCount >= highScor {
                    highScor = addCount
                }
                scoreCounterLabel.text = String(addCount)
                setRandomQuestion()
                time.invalidate()
                setTimerForProgressView()
            } else{
                showAlert()
                addCount = 0
            }
        case 1:
            if arrAnswer[currentIndex] == false {
                addCount = addCount + 1
                if addCount >= highScor {
                    highScor = addCount
                }
                scoreCounterLabel.text = String(addCount)
                setRandomQuestion()
                time.invalidate()
                setTimerForProgressView()
            }else{
                showAlert()
                addCount = 0
            }
        default:
            break
        }
    }
}
