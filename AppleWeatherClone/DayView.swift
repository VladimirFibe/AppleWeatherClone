import UIKit

final class DayView: UIView {
    private let titleLabel = UILabel()
    private let separatorView = UIView()
    private let hoursStackView = UIStackView()
    private let stackView = UIStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupStackView()
        setupTitleLabel()
        setupSeparatorView()
        setupHoursStackView()
    }
    
    private func setupView() {
        layer.cornerRadius = 15
        layer.borderColor = UIColor.white.withAlphaComponent(0.25).cgColor
        layer.borderWidth = 1
        backgroundColor = .white.withAlphaComponent(0.03)
    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 14
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleLabel() {
        stackView.addArrangedSubview(titleLabel)
        titleLabel.text = "Cloudy conditions from 1AM-9AM, with showers expected at 9AM."
        titleLabel.font = .systemFont(ofSize: 18)
        titleLabel.numberOfLines = 2
    }
    
    private func setupSeparatorView() {
        stackView.addArrangedSubview(separatorView)
        separatorView.backgroundColor = .secondarySystemFill
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    private func setupHoursStackView() {
        stackView.addArrangedSubview(hoursStackView)
        hoursStackView.distribution = .equalSpacing
        ["Now", "10PM", "11PM", "12AM", "1AM"].forEach {
            let hour = HourColumnView()
            hour.configure(with: $0)
            hoursStackView.addArrangedSubview(hour)
        }
    }
}

#Preview {
    ViewController()
}
