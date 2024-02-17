//
//  BaseViewConfigurable.swift
//  BasicCompositionalLayoyut
//
//  Created by 쩡화니 on 2/9/24.
//

import Foundation

@objc
protocol BaseViewConfigurable {
  @objc optional func configView()
  @objc optional func configHierarchy()
  @objc optional func configLayout()
}

extension BaseViewConfigurable {
  func configBase(){
    configView?()
    configHierarchy?()
    configLayout?()
  }
}
