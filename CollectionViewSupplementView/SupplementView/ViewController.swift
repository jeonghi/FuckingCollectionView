//
//  ViewController.swift
//  SupplementView
//
//  Created by 쩡화니 on 2/17/24.
//

import UIKit
import Then

class ViewController: UIViewController {
  
  private let collectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewFlowLayout().then {
      $0.scrollDirection = .vertical
    }
  )

  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.do {
      
      // 셀 등록
      $0.register(
        MyCollectionViewCell.self,
        forCellWithReuseIdentifier: MyCollectionViewCell.identifier
      )
      
      // 보충 뷰 등록
      $0.register(
        HeaderCollectionReusableView.self,
        forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
        withReuseIdentifier: HeaderCollectionReusableView.identifier
      )
      $0.register(
        FooterCollectionReusableView.self,
        forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
        withReuseIdentifier: FooterCollectionReusableView.identifier
      )
      
      $0.delegate = self
      $0.dataSource = self
    }
    
    view.addSubview(
      collectionView
    )
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.frame = view.bounds
  }
}

extension ViewController: UICollectionViewDataSource {
  
  /// 섹션 갯수 설정, 미 구현시에는 collectionView 는 1을 기본값으로 가짐.
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    3
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    8
  }
  
  /// 셀 만들기
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: MyCollectionViewCell.identifier,
      for: indexPath
    )
    return cell
  }
  
  /// 보충 뷰 배치하기
  func collectionView(
    _ collectionView: UICollectionView,
    viewForSupplementaryElementOfKind kind: String,
    at indexPath: IndexPath
  ) -> UICollectionReusableView {
    
    // Header
    if kind == UICollectionView.elementKindSectionHeader {
      return collectionView.dequeueReusableSupplementaryView(
        ofKind: kind,
        withReuseIdentifier: HeaderCollectionReusableView.identifier,
        for: indexPath
      )
    } else { // Footer
      return collectionView.dequeueReusableSupplementaryView(
        ofKind: kind,
        withReuseIdentifier: FooterCollectionReusableView.identifier,
        for: indexPath
      )
    }
  }
  
}

extension ViewController: UICollectionViewDelegate {
  
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  
  /// 특정 섹션에서 line spacing (Flowlayout은 한 축에 최대한 많이 배치함)
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    1
  }
  
  /// 특정 섹션에서 아이템간 최소 spacing 설정
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    1
  }
  
  /// 섹션당 edge로부터의 inset 설정
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    return CGSize(
      width: view.frame.size.width/3 - 3,
      height: view.frame.size.width/3 - 3
    )
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    referenceSizeForHeaderInSection section: Int
  ) -> CGSize {
    return CGSize(
      width: view.frame.size.width,
      height: view.frame.size.width/2
    )
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    referenceSizeForFooterInSection section: Int
  ) -> CGSize {
    
    if section != collectionView.numberOfSections - 1 {
      return .zero
    }
    
    return CGSize(
      width: view.frame.size.width,
      height: view.frame.size.width/2
    )
  }
}

@available(iOS 17.0, *)
#Preview {
  ViewController()
}
