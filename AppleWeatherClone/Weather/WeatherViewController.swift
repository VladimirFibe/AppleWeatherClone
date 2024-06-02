import UIKit
import CoreLocation
import WeatherKit

final class WeatherViewController: UIViewController {
    private var viewModel: [WeatherViewModel] = []
    private let store = WeatherStore()
    private var bag = Bag()
    private var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupObservers()
        LocationManager.shared.getCurrentLocation { location in
            self.store.sendAction(.fetch(location))
        }
    }
    
    private func setupObservers() {
        store
            .events
            .receive(on: DispatchQueue.main)
            .sink { [weak self] event in
                guard let self else { return }
                switch event {
                case .updateUI(let weather): self.updateUI(with: weather)
                }
            }.store(in: &bag)
    }
    
    private func updateUI(with weather: Weather) {
        viewModel = [
            .current(.init(model: weather.currentWeather)),
            .hourly(weather.hourlyForecast.forecast.compactMap { .init(model: $0)}),
            .daily(weather.dailyForecast.forecast.compactMap { .init(model: $0)})
        ]
        collectionView.reloadData()
    }
}

extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch viewModel[section] {
        case .current: return 1
        case .hourly(let viewModels): return viewModels.count
        case .daily(let viewModels): return viewModels.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch viewModel[indexPath.section] {
        case .current(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TemperatureCell.identifier, for: indexPath) as? TemperatureCell
            else { fatalError() }
            cell.configure(with: viewModel)
            return cell
        case .daily(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCell.identifier, for: indexPath) as? DayCell
            else { fatalError() }
            cell.configure(with: viewModels[indexPath.item])
            return cell
        case .hourly(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourCell.identifier, for: indexPath) as? HourCell else { fatalError() }
            cell.configure(with: viewModels[indexPath.item])
            return cell
        }
        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.count
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TemperatureCell.self, forCellWithReuseIdentifier: TemperatureCell.identifier)
        collectionView.register(HourCell.self, forCellWithReuseIdentifier: HourCell.identifier)
        collectionView.register(DayCell.self, forCellWithReuseIdentifier: DayCell.identifier)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            switch sectionIndex {
            case 1: return self.createDaySection()
            default: return self.createTemperatureSection()
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 50
        layout.configuration = config
        return layout
    }
      
    private func createTemperatureSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitems: [layoutItem])
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.interGroupSpacing = 10
        return layoutSection
    }
    
    private func createDaySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .estimated(100))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitems: [layoutItem])
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .continuous
        layoutSection.interGroupSpacing = 10
        return layoutSection
    }
}
//
//#Preview {
//    WeatherViewController()
//}
