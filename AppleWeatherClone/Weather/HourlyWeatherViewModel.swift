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
        let hour = Calendar.current.component(.hour, from: model.date)
        return "\(hour):00"
    }
}
