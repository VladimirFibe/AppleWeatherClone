import Foundation
import WeatherKit

enum WeatherViewModel {
    case current(CurrentWeatherViewModel)
    case hourly([HourlyWeatherViewModel])
    case daily([DailyWeatherViewModel])
}
