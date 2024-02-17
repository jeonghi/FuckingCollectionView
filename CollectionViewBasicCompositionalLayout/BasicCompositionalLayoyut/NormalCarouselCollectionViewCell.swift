//
//  NormalCarouselCollectionViewCell.swift
//  BasicCompositionalLayoyut
//
//  Created by 쩡화니 on 2/10/24.
//

import UIKit
import SnapKit
import Kingfisher

class NormalCarouselCollectionViewCell: BaseCollectionViewCell {
  
  private let mainImage = UIImageView()
  private let titleLabel = UILabel()
  private let subTitleLabel = UILabel()
  
  override func configView() {
    
  }
  
  override func configLayout() {
    mainImage.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalTo(80)
    }
    
    titleLabel.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
    }
    
    subTitleLabel.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
    }
  }
  
  override func configHierarchy() {
    self.addSubviews([mainImage, titleLabel, subTitleLabel])
  }
  
  func prepare(imageUrl: String?, title: String?, subTitle: String?) {
    mainImage.kf.setImage(with: URL(string: imageUrl ?? ""))
    titleLabel.text = title
    subTitleLabel.text = subTitle
  }
}
