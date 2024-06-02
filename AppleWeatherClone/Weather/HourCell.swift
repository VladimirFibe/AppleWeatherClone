import UIKit

final class HourCell: UICollectionViewCell {
    static let identifier = "HourCell"
    private let stackView = UIStackView()
    private let timeLabel = UILabel()
    private let imageView = UIImageView()
    private let temperatureLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        setupTimeLabel()
        setupImageView()
        setupTemperatureLabel()
    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 24
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupTimeLabel() {
        stackView.addArrangedSubview(timeLabel)
        timeLabel.font = .systemFont(ofSize: 17, weight: .medium)
    }
    
    private func setupImageView() {
        stackView.addArrangedSubview(imageView)
        imageView.contentMode = .scaleAspectFit
    }
    
    private func setupTemperatureLabel() {
        stackView.addArrangedSubview(temperatureLabel)
        temperatureLabel.font = .systemFont(ofSize: 22, weight: .medium)
    }
    
    func configure(with weather: HourlyWeatherViewModel) {
        temperatureLabel.text = weather.temperature
        imageView.image = UIImage(systemName: "\(weather.iconName).fill",
                                  withConfiguration: UIImage.SymbolConfiguration.preferringMulticolor())
        timeLabel.text = weather.hour
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
