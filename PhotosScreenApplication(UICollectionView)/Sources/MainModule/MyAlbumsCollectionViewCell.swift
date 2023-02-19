//
//  PhotoCollectionViewCell.swift
//  PhotosScreenApplication(UICollectionView)
//
//  Created by Nika Semenkova on 19.02.2023.
//

import UIKit
import SnapKit

class MyAlbumsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyAlbumsCollectionViewCell"
    
    // MARK: - Outlets
    
    private lazy var image : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "TitleLabel", size: 15)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "SubitleLabel", size: 10)
        return label
    }()
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("ERROR")
    }
    
    // MARK: - Ovveride methods
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
    }
    
    // MARK: - Setups
    
    private func setupHierarchy() {
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
    }
    
    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.left.right.top.equalTo(contentView)
            make.bottom.equalTo(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView)
            make.width.equalTo(contentView)
            make.top.equalTo(image).offset(3)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView)
            make.width.equalTo(contentView)
            make.top.equalTo(titleLabel).offset(3)
        }
    }
}
