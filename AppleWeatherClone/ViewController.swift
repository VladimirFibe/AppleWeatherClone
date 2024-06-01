import UIKit

class ViewController: UIViewController {
    private let skyView = UIImageView()
    private let cloudView = UIImageView()
    private let mainStackView = UIStackView()
    private let temperatureView = TemperatureView()
    private let dayView = DayView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSkyView()
        setupCloudView()
        setupMainStackView()
    }
    
    private func setupSkyView() {
        view.addSubview(skyView)
        skyView.image = .sky
        skyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skyView.topAnchor.constraint(equalTo: view.topAnchor),
            skyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            skyView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupCloudView() {
        view.addSubview(cloudView)
        cloudView.image = .cloud
        cloudView.alpha = 0.3
        cloudView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cloudView.topAnchor.constraint(equalTo: view.topAnchor),
            cloudView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cloudView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
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
