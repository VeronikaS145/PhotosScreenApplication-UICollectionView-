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
        [CompositionalModel(image: "recents", title: "Recents", subtitle: 655),
         CompositionalModel(image: "instagram", title: "Instagram", subtitle: 7),
          CompositionalModel(image: "favourites", title: "Favourites", subtitle: 28),
          CompositionalModel(image: "polar", title: "Polar", subtitle: 2),
          CompositionalModel(image: "fltr", title: "FLTR", subtitle: 1),
          CompositionalModel(image: "dream", title: "Dream", subtitle: 1),
          CompositionalModel(image: "pinterest", title: "Pinterest", subtitle: 3),
          CompositionalModel(image: "vn", title: "VN", subtitle: 2)],
        
        [CompositionalModel(sharedImage: "police2", image: "police", title: "The Police", subtitle: 46),
         CompositionalModel(sharedImage: "led2", image: "led", title: "Led Zeppelin", subtitle: 23),
         CompositionalModel(sharedImage: "megadeth2", image: "megadeth", title: "Megadeth", subtitle: 21),
         CompositionalModel(sharedImage: "red2", image: "red", title: "Red Hot Chili Peppers", subtitle: 30)],
        
        [CompositionalModel(image: "video", title: "Videos", subtitle: 655),
         CompositionalModel(image: "person.crop.rectangle", title: "Selfies", subtitle: 7),
          CompositionalModel(image: "livephoto", title: "Live Photos", subtitle: 28),
          CompositionalModel(image: "cube", title: "Portrait", subtitle: 2),
          CompositionalModel(image: "timelapse", title: "Time-lapse", subtitle: 1),
          CompositionalModel(image: "camera.viewfinder", title: "Screenshots", subtitle: 1),
          CompositionalModel(image: "record.circle", title: "Screen Recordings", subtitle: 3)],

        [CompositionalModel(image: "square.and.arrow.down", title: "Imports", subtitle: 23),
         CompositionalModel(image: "square.on.square", title: "Dublicates", subtitle: 6),
          CompositionalModel(image: "eye.slash", title: "Hidden", subtitle: 9),
          CompositionalModel(image: "trash", title: "Recently Deleted", subtitle: 10)]
    ]
}
