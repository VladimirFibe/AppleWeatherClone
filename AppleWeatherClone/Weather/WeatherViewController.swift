import UIKit

final class WeatherViewController: UIViewController {
    private var collectionView: UICollectionView!
    private var temperatureCell = TemperatureCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
}

extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 1: return 24
        case 2: return 10
        default: return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 1: 
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourCell.identifier, for: indexPath) as? HourCell
            else { fatalError() }
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCell.identifier, for: indexPath) as? DayCell
            else { fatalError() }
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TemperatureCell.identifier, for: indexPath) as? TemperatureCell else { fatalError() }
            return cell
        }
        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
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

#Preview {
    WeatherViewController()
}
