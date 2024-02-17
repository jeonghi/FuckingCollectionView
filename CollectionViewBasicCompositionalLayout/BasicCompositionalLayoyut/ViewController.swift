//
//  ViewController.swift
//  BasicCompositionalLayoyut
//
//  Created by 쩡화니 on 2/9/24.
//

import UIKit
import Then
import SnapKit

final class ViewController: BaseViewController {

  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
    
    $0.backgroundColor = .black
    
    // Do any additional setup after loading the view.
    $0.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.identifier)
//    $0.register(NormalCarouselCollectionViewCell.self, forCellWithReuseIdentifier: NormalCarouselCollectionViewCell.identifier)
    
    // collectionView에 layout 적용하기
    $0.setCollectionViewLayout(createLayout(), animated: true)
  }
  private var dataSource: UICollectionViewDiffableDataSource<Section, Item>?
  
  
  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configDataSource()
    configSnapShot()
  }
  
  // MARK: Action
  
  private func configDataSource() {
    dataSource = UICollectionViewDiffableDataSource<Section, Item>.init(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
      
      switch itemIdentifier {
      case .banner(let item):
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifier, for: indexPath) as? BannerCollectionViewCell else { return .init() }
        
        cell.prepare(title: item.title, url: item.imageUrl)
        return cell
//      case .normalCarousel(let item):
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NormalCarouselCollectionViewCell.identifier, for: indexPath) as? NormalCarouselCollectionViewCell else { return .init() }
//        
//        cell.prepare(imageUrl: item.imageUrl, title: item.title, subTitle: item.subTitle)
//        return cell
      default:
        return .init()
      }
    })
  }
  
  private func configSnapShot() {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    
    // ⚠️ snapshot에 같은 섹션은 하나만 넣을 수 있음.
    snapshot.appendSections([Section(id: "Banner")])
    
    let bannerItems = [
      Item.banner(HomeItem(title: "교촌 치킨", subTitle: "", imageUrl: "https://www.kyochon.com/uploadFiles/TB_ITEM/%EB%B8%94%EB%9E%99%EC%8B%9C%ED%81%AC%EB%A6%BF-%EC%98%A4%EB%A6%AC%EC%A7%80%EB%82%A0_list(1).png")),
      Item.banner(HomeItem(title: "굽네 치킨", subTitle: "", imageUrl: "https://www.kyochon.com/uploadFiles/TB_ITEM/%EB%B8%94%EB%9E%99%EC%8B%9C%ED%81%AC%EB%A6%BF-%EC%98%A4%EB%A6%AC%EC%A7%80%EB%82%A0_list(1).png")),
      Item.banner(HomeItem(title: "푸라닥 치킨", subTitle: "", imageUrl: "https://www.kyochon.com/uploadFiles/TB_ITEM/%EB%B8%94%EB%9E%99%EC%8B%9C%ED%81%AC%EB%A6%BF-%EC%98%A4%EB%A6%AC%EC%A7%80%EB%82%A0_list(1).png"))
    ]
    
    snapshot.appendItems(bannerItems, toSection: Section(id: "Banner"))
    
//    snapshot.appendSections([Section(id: "NormalCarousel")])
//    let normalItems = [
//      Item.normalCarousel(HomeItem(title: "", subTitle: "", imageUrl: ""))
//    ]
    
    dataSource?.apply(snapshot)
  }
  
  private func createLayout() -> UICollectionViewCompositionalLayout {
    
    // escaping에서 순환참조 주의! ⚠️
    return UICollectionViewCompositionalLayout(sectionProvider: { [weak self] sectionIndex, env in
      switch sectionIndex {
      case 0:
        return self?.createBannerSection()
//      case 1:
//        return self?.createNormalCarouselSection()
      default:
        return self?.createBannerSection()
      }
    }, configuration: .init())
  }
  
  private func createBannerSection() -> NSCollectionLayoutSection {

    // item < group < section 순
    
    // item
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize) // ⭐️ -> 아래 레이아웃 그룹의 subitem으로 넣어줄 예정
    
    // group
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item]) // ⭐️ <- 그룹에 item 넣어줌
    
    // section
    let section = NSCollectionLayoutSection(group: group) // ‼️ <- 섹션에 그룹을 넣어줌.
    section.orthogonalScrollingBehavior = .groupPaging // 수직 스크롤 행위 설정
    return section
  }
  
  private func createNormalCarouselSection() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .absolute(100))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .continuous
    return section
  }
  
}

extension ViewController {
  override func configLayout() {
    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  override func configHierarchy() {
    view.addSubviews([collectionView])
  }
}

// 2)
// 2.1. 컬렉션 뷰 cell UI 등록
// 2.2. 레이아웃 구현
// 2.3. dataSource -> cellProvider
// 2.4. snapshot -> datasource.apply(snapshot)

@available(iOS 17.0, *)
#Preview {
  ViewController()
}
