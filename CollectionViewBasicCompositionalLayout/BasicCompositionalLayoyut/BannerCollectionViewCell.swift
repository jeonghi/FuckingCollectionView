//
//  BannerCollectionViewCell.swift
//  BasicCompositionalLayoyut
//
//  Created by 쩡화니 on 2/9/24.
//

import UIKit
import SnapKit
import Then
import Kingfisher

final class BannerCollectionViewCell: BaseCollectionViewCell {
  
  let titleLabel = UILabel().then {
    $0.text = "타이틀"
  }
  
  let backgroundImage = UIImageView(frame: .zero)
  
  override func prepare() {
    
  }
  
  func prepare(title: String?, url: String?){
    titleLabel.text = title
    backgroundImage.kf.setImage(with: URL(string: url ?? ""))
  }
  
  override func configView() {
    backgroundColor = .blue
  }
  
  override func configLayout() {
    titleLabel.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
    
    backgroundImage.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  override func configHierarchy() {
    self.addSubviews([backgroundImage, titleLabel])
  }
}

@available(iOS 17.0, *)
#Preview {
  BannerCollectionViewCell()
}
