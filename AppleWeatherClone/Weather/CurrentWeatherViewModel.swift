import Foundation
import WeatherKit

struct CurrentWeatherViewModel {
    private let model: CurrentWeather
    init(model: CurrentWeather) {
        self.model = model
    }
    
    public var condition: String {
        model.condition.description
    }
    
    public var temperature: String {
        "\(Int(model.temperature.converted(to: .celsius).value)) °C"
    }
    
    public var iconName: String {
        model.symbolName
    }
}
