import Foundation
import WeatherKit
import CoreLocation

enum WeatherEvent {
    case updateUI(Weather)
}

enum WeatherAction {
    case fetch(CLLocation)
}

final class WeatherStore: Store<WeatherEvent, WeatherAction> {
    override func handleActions(action: WeatherAction) {
        switch action {
        case .fetch(let location):
            statefulCall {[weak self] in
                try await self?.getWeather(for: location)
            }
        }
    }
    
    private func getWeather(for location: CLLocation) async throws {
        let weather = try await WeatherService.shared.weather(for: location)
        sendEvent(.updateUI(weather))
    }
}
