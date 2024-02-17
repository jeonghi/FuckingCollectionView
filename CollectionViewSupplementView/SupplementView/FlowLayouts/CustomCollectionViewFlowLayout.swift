//
//  CustomCollectionViewFlowLayout.swift
//  SupplementView
//
//  Created by 쩡화니 on 2/17/24.
//

import UIKit

class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {
  
  /// 확장가능한 섹션 헤더의 섹션 인덱스
  var expandableSectionIndex: Int { 0 }
  
  override init() {
    super.init()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  /// 뷰의 bounds가 변경될 때, 레이아웃을 무효화할지 여부를 결정함.
  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    
    /// bounds가 변경될 때마다 레이아웃을 무효화하고 재계산하도록함.
    /// 스크롤이 발생할 때마다 `layoutAttributesForElements(in:)`를 호출하여 섹션 헤더의 높이를 동적으로 조정할 수 있도록 해줌.
    return true
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    
    guard let offset = collectionView?.contentOffset, let layoutAttributes = super.layoutAttributesForElements(in: rect) else {
      return nil
    }
    
    if offset.y < 0 {
      layoutAttributes.forEach {
        
        /// 섹션 헤더에 대하여 적용
        if let elementKind = $0.representedElementKind, elementKind == UICollectionView.elementKindSectionHeader {
          if $0.indexPath.section == expandableSectionIndex {
            let diffValue = abs(offset.y)
            var frame = $0.frame
//            frame.size.height = max(0, headerReferenceSize.height + diffValue)
            frame.size.height += diffValue
            frame.origin.y = frame.minY - diffValue
            $0.frame = frame
          }
        }
      }
    }
    
    return layoutAttributes
  }
  

}
