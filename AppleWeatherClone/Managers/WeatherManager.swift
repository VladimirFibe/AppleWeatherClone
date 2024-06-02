import Foundation
import WeatherKit
import CoreLocation

final class WeatherManager {
    static let shared = WeatherManager()
    let service = WeatherService.shared
    private(set) var currentWeather: CurrentWeather?
    private(set) var hourlyWeather: [HourWeather] = []
    private(set) var dailyWeather: [DayWeather] = []
    private init() {}
    
    public func getWeather(for location: CLLocation) async throws {
                let result = try await service.weather(for: location)
                self.currentWeather = result.currentWeather
                self.dailyWeather = result.dailyForecast.forecast
                self.hourlyWeather = result.hourlyForecast.forecast
    }
}
