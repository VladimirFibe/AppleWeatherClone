import UIKit

class ViewController: UIViewController {
    private let mainStackView = UIStackView()
    private let temperatureView = TemperatureView()
    private let dayView = DayView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainStackView()
    }
    private func setupMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.spacing = 44
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(temperatureView)
        mainStackView.addArrangedSubview(dayView)
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            mainStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: mainStackView.trailingAnchor, multiplier: 1),
        ])
    }
    
}

#Preview {
    ViewController()
}
