//
//  Item.swift
//  BasicCompositionalLayoyut
//
//  Created by 쩡화니 on 2/9/24.
//

// 1) 섹션과 아이템 정의
struct Section: Hashable {
  let id: String
}

enum Item: Hashable {
  case banner(HomeItem)
  case normalCarousel(HomeItem)
  case listCarousel(HomeItem)
}

struct HomeItem: Hashable {
  let title: String
  let subTitle: String?
  let imageUrl: String
}
