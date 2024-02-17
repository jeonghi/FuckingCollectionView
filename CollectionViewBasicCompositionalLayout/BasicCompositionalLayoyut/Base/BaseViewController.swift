//
//  BaseViewController.swift
//  BasicCompositionalLayoyut
//
//  Created by 쩡화니 on 2/9/24.
//

import UIKit
import Then

class BaseViewController: UIViewController {
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configBase()
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    configBase()
  }
}

extension BaseViewController: BaseViewConfigurable {
  func configView() {}
  func configLayout() {}
  func configHierarchy() {}
}

