import Foundation
import WeatherKit

struct DailyWeatherViewModel {
    private let model: DayWeather
    init(model: DayWeather) {
        self.model = model
    }
    
    static let formater: DateFormatter = {
        DateFormatter()
    }()
    
    public var iconName: String {
        model.symbolName
    }
    
    public var lowTemperature: String {
        string(for: model.lowTemperature)
    }
    
    public var highTemperature: String {
        string(for: model.highTemperature)
    }
    
    private func string(for temp: Measurement<UnitTemperature>) -> String {
        "\(Int(temp.converted(to: .celsius).value))°"
    }
    
    public var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        let calendar = Calendar.current
        let inputDateComponents = calendar.dateComponents([.day], from: model.date)
        let currentDateComponents = calendar.dateComponents([.day], from: Date())
        return inputDateComponents == currentDateComponents ? "Today" : dateFormatter.string(from: model.date)
    }
}
