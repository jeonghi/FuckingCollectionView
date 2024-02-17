//
//  MyCollectionViewCell.swift
//  SupplementView
//
//  Created by 쩡화니 on 2/17/24.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.backgroundColor = .systemBlue
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}
