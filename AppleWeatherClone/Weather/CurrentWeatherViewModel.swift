import Foundation
import WeatherKit

struct CurrentWeatherViewModel {
    private let model: Weather
    init(model: Weather) {
        self.model = model
    }
    
    public var condition: String {
        model.currentWeather.condition.description
    }
    
    public var temperature: String {
        "\(Int(model.currentWeather.temperature.converted(to: .celsius).value))°"
    }
    
    public var iconName: String {
        model.currentWeather.symbolName
    }
    
    public var city: String {
        "Almaty"
    }
    
    public var dailyHighLow: String {
        "H:\(Int(model.dailyForecast.forecast[0].highTemperature.converted(to: .celsius).value))°  L:\(Int(model.dailyForecast.forecast[0].lowTemperature.converted(to: .celsius).value))°"
    }
}
