//
//  BaseCollectionViewCell.swift
//  BasicCompositionalLayoyut
//
//  Created by 쩡화니 on 2/9/24.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell, BaseViewConfigurable {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.prepare()
    self.configBase()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
  }
  
  func prepare() {}
  
  func configView() {}
  
  func configLayout() {}
  
  func configHierarchy() {}
}
