import UIKit

class selectLevelViewController: UIViewController {
    
    @IBOutlet var easyButton: UIButton!
    @IBOutlet var mediumButton: UIButton!
    @IBOutlet var hardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ButtonCustomisation()
    }

    func ButtonCustomisation(){
        easyButton.layer.cornerRadius = 15
        easyButton.layer.masksToBounds = true
        mediumButton.layer.cornerRadius = 15
        mediumButton.layer.masksToBounds = true
        hardButton.layer.cornerRadius = 15
        hardButton.layer.masksToBounds = true
    }
    
    @IBAction func easyButtonTapped(_ sender: UIButton) {
        let easyButton = navigationController?.storyboard?.instantiateViewController(withIdentifier: "easyModeViewController") as! easyModeViewController
        navigationController?.pushViewController(easyButton, animated: true)
    }
    
    @IBAction func mediumButtonTapped(_ sender: UIButton) {
        let mediumButton = navigationController?.storyboard?.instantiateViewController(withIdentifier: "mediumModeViewController") as! mediumModeViewController
        navigationController?.pushViewController(mediumButton, animated: true)
    }
    
    @IBAction func hardButtonTapped(_ sender: UIButton) {
        let hardButton = navigationController?.storyboard?.instantiateViewController(withIdentifier: "hardModeViewController") as! hardModeViewController
        navigationController?.pushViewController(hardButton, animated: true)
    }
    
    @IBAction func backToHome(_ sender: UIButton) {
        let homeButton = navigationController?.storyboard?.instantiateViewController(withIdentifier: "homeScreenViewController") as! homeScreenViewController
        navigationController?.pushViewController(homeButton, animated: true)
    }
}
