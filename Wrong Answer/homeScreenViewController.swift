import UIKit

class homeScreenViewController: UIViewController {
    
    @IBOutlet var playButton: UIButton!
    @IBOutlet var quitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playButtonstyle()
        quitButtonStyle()
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        showAlert()
    }
    
    func playButtonstyle(){
        playButton.layer.cornerRadius = 15
        playButton.layer.masksToBounds = true
    }
    
    func quitButtonStyle(){
        quitButton.layer.cornerRadius = 15
        quitButton.layer.masksToBounds = true
    }
    
    @IBAction func btnQuitPressed(_ sender: UIButton) {
        quitApp()
    }
    
    func quitApp(){
        DispatchQueue.main.asyncAfter(deadline:.now()){
            UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
        }
    }
    
    func showAlert(){
        let alert : UIAlertController = UIAlertController(title: "Rules", message: "\n1.There will be One Math Equation\n\n2.if Equation is Right,Press 'FALSE'\n\n3.if Equation is Wrong,Press 'TRUE'", preferredStyle: .alert)
        let playButton : UIAlertAction = UIAlertAction(title: "PLAY NOW", style: .default){_ in 
            self.playNowButtonToSelectLevel()
        }
        alert.addAction(playButton)
        present(alert, animated: true, completion: nil)
    }
    
    func playNowButtonToSelectLevel(){
        let selectLevel = self.storyboard?.instantiateViewController(withIdentifier: "selectLevelViewController") as! selectLevelViewController
        navigationController?.pushViewController(selectLevel, animated: true)
    }
}
