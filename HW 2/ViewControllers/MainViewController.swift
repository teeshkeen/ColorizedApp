import UIKit

protocol SettingsViewControllerProtocol {
    func transferColor(for color: UIColor)
}

class MainViewController: UIViewController {
    var currentBackgroundColor = UIColor.systemRed
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .random()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.currentMainColor = view.backgroundColor!
        settingsVC.delegate = self
    }
}

// MARK: - private methods

extension MainViewController: SettingsViewControllerProtocol {
    func transferColor(for color: UIColor) {
        view.backgroundColor = color
    }
}
