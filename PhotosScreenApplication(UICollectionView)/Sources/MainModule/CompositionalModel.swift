//
//  CompositionalModel.swift
//  PhotosScreenApplication(UICollectionView)
//
//  Created by Nika Semenkova on 19.02.2023.
//

import Foundation

struct CompositionalModel: Hashable {
    var sharedImage: String?
    var image: String
    var title: String
    var subtitle: Int
}

extension CompositionalModel {
    static let photoArray = [
        [CompositionalModel(image: "", title: "Recents", subtitle: 655),
         CompositionalModel(image: "", title: "Instagram", subtitle: 7),
          CompositionalModel(image: "", title: "Favourites", subtitle: 28),
          CompositionalModel(image: "", title: "Polar", subtitle: 2),
          CompositionalModel(image: "", title: "FLTR", subtitle: 1),
          CompositionalModel(image: "", title: "Dream", subtitle: 1),
          CompositionalModel(image: "", title: "Pinterest", subtitle: 3),
          CompositionalModel(image: "", title: "VN", subtitle: 2)],
        
        [CompositionalModel(sharedImage: "", image: "", title: "The Police", subtitle: 46),
         CompositionalModel(sharedImage: "", image: "", title: "Led Zeppelin", subtitle: 23),
         CompositionalModel(sharedImage: "", image: "", title: "Megadeth", subtitle: 21),
         CompositionalModel(sharedImage: "", image: "", title: "Red Hot Chili Peppers", subtitle: 30)]
    ]
}
