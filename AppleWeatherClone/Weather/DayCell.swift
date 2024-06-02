import UIKit

final class DayCell: UICollectionViewCell {
    static let identifier = "DayCell"
    private let stackView = UIStackView()
    private let timeLabel = UILabel()
    private let imageView = UIImageView()
    private let lowLabel = UILabel()
    private let highLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        setupTimeLabel()
        setupImageView()
        setupTemperatureLabel()
        setupHighLabel()
    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 24
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            timeLabel.widthAnchor.constraint(equalToConstant: 60),
            imageView.widthAnchor.constraint(equalToConstant: 30),
            lowLabel.widthAnchor.constraint(equalToConstant: 40),
            highLabel.widthAnchor.constraint(equalToConstant: 40)
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
        stackView.addArrangedSubview(lowLabel)
        lowLabel.font = .systemFont(ofSize: 22, weight: .medium)
    }
    
    private func setupHighLabel() {
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(highLabel)
        highLabel.textAlignment = .right
        highLabel.font = .systemFont(ofSize: 22, weight: .medium)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with weather: DailyWeatherViewModel) {
        lowLabel.text = weather.lowTemperature
        highLabel.text = weather.highTemperature
        imageView.image = UIImage(systemName: "\(weather.iconName).fill", withConfiguration: UIImage.SymbolConfiguration.preferringMulticolor())
        timeLabel.text = weather.day
    }
}
