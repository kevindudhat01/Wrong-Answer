import UIKit

class splashScreenViewController: UIViewController {
    @IBOutlet var brainGamesText: UILabel!
   
    func brainGamesAnimation(){
        brainGamesText.text = ""
        
        var charIndex = 0.0
        let nameText = "Brain Games"
        
        for letter in nameText{
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.brainGamesText.text?.append(letter)
            }
            charIndex += 1
        }
    }
    
    @IBOutlet var progressView: UIProgressView!
    var count : Float = 1
    var timer : Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brainGamesAnimation()
        navigationController?.isNavigationBarHidden = true
        setTimerForProgressView()
        }
    
    func setTimerForProgressView(){
        count = 1
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if count>10{
            timer.invalidate()

            navigationToHomeScreen()
        }else{
            count = count + 10
            progressView.progress = Float(count)/10
        }
    }
    
    func navigationToHomeScreen(){
        let home = self.storyboard?.instantiateViewController(withIdentifier: "homeScreenViewController") as! homeScreenViewController
        navigationController?.pushViewController(home, animated: true)
    }
}
