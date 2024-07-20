import UIKit

final class SettingsViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!

    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var delegate: SettingsViewControllerProtocol!
    var currentMainColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redLabel.text = string(from: sender)
        case greenSlider:
            greenLabel.text = string(from: sender)
        default:
            blueLabel.text = string(from: sender)
        }
    }
    
    @IBAction func doneButtonPressed() {
        delegate.transferColor(for: colorView.backgroundColor!)
        dismiss(animated: true)
    }
}

// MARK: - private methods
extension SettingsViewController {
    private func updateUI() {
        colorView.layer.cornerRadius = 15
        setColor()
        setColorFromMain()
        setValue(for: redLabel, greenLabel, blueLabel)
    }
    
    private func setColorFromMain() {
        colorView.backgroundColor = currentMainColor
        
        redSlider.value = Float(currentMainColor.redValue)
        blueSlider.value = Float(currentMainColor.blueValue)
        greenSlider.value = Float(currentMainColor.greenValue)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                redLabel.text = string(from: redSlider)
            case greenLabel:
                greenLabel.text = string(from: greenSlider)
            default:
                blueLabel.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
