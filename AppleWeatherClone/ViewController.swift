import UIKit

class ViewController: UIViewController {
    private let mainStackView = UIStackView()
    private let temperatureView = TemperatureView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainStackView()
        setupTemperatureView()
    }
    private func setupMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            mainStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: mainStackView.trailingAnchor, multiplier: 1),
        ])
    }
    
    private func setupTemperatureView() {
        mainStackView.addArrangedSubview(temperatureView)
    }
}

#Preview {
    ViewController()
}
