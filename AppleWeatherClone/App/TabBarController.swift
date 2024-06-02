import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let weather = UINavigationController(rootViewController: WeatherViewController())
        weather.tabBarItem = UITabBarItem(title: "Weather", image: UIImage(systemName: "cloud.sun"), tag: 0)
        let settings = UINavigationController(rootViewController: SettingsViewController())
        settings.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 1)
        setViewControllers([weather, settings], animated: true)
    }
}
