//
//  HeaderCollectionReusableView.swift
//  SupplementView
//
//  Created by 쩡화니 on 2/17/24.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .red
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
}

class FooterCollectionReusableView: UICollectionReusableView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .blue
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
}
