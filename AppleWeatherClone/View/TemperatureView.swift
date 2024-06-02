import UIKit

final class TemperatureView: UIView {
    private let stackView = UIStackView()
    private let cityLabel = UILabel()
    private let temperatureLabel = UILabel()
    private let cloudLabel = UILabel()
    private let bottomLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        setupCityLabel()
        setupTemperatureLabel()
        setupCloudLabel()
        setupBottomLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupCityLabel() {
        stackView.addArrangedSubview(cityLabel)
        cityLabel.text = "Seongnam-si"
        cityLabel.font = .systemFont(ofSize: 37)
    }
    
    private func setupTemperatureLabel() {
        stackView.addArrangedSubview(temperatureLabel)
        temperatureLabel.text = "21°"
        temperatureLabel.font = .systemFont(ofSize: 102, weight: .thin)
    }
    
    private func setupCloudLabel() {
        stackView.addArrangedSubview(cloudLabel)
        cloudLabel.text = "Partly Cloudy"
        cloudLabel.font = .systemFont(ofSize: 24)
    }
    
    private func setupBottomLabel() {
        stackView.addArrangedSubview(bottomLabel)
        bottomLabel.text = "H:29°  L:15°"
        bottomLabel.font = .systemFont(ofSize: 21, weight: .medium)
    }
}

#Preview {
    TemperatureView()
}
