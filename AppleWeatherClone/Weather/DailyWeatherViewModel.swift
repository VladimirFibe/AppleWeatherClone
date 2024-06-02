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
        let day = Calendar.current.component(.weekday, from: model.date)
        return string(from: day)
    }
    
    private func string(from day: Int) -> String {
        switch (day) {
        case 1:
            return "Mon"
        case 2:
            return "Tue"
        case 3:
            return "Wed"
        case 4:
            return "Thu"
        case 5:
            return "Fri"
        case 6:
            return "Sat"
        case 7:
            return "Sun"
        default:
            return "Unavailable"
        }
    }
}
