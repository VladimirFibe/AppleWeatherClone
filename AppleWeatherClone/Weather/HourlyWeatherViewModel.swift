import Foundation
import WeatherKit

struct HourlyWeatherViewModel {
    private let model: HourWeather
    init(model: HourWeather) {
        self.model = model
    }
    
    public var iconName: String {
        model.symbolName
    }
    
    public var temperature: String {
        return "\(Int(model.temperature.converted(to: .celsius).value))°"
    }
    
    public var hour: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ha"
        let calendar = Calendar.current
        let inputDateComponents = calendar.dateComponents([.day, .hour], from: model.date)
        let currentDateComponents = calendar.dateComponents([.day, .hour], from: Date())
        return inputDateComponents == currentDateComponents ? "Now" : dateFormatter.string(from: model.date)
    }
    
    func hourFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ha"
        let calendar = Calendar.current
        let inputDateComponents = calendar.dateComponents([.day, .hour], from: date)
        let currentDateComponents = calendar.dateComponents([.day, .hour], from: Date())
        return inputDateComponents == currentDateComponents ? "Now" : dateFormatter.string(from: date)
    }
}
