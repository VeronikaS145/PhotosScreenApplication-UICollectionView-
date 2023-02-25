//
//  SharedCollectionViewCell.swift
//  PhotosScreenApplication(UICollectionView)
//
//  Created by Nika Semenkova on 19.02.2023.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotosCollectionViewCell"
    
    // MARK: - Outlets
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var littleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 19
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private lazy var heartImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("ERROR")
    }
    
    // MARK: - Ovveride methods
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.littleImage.image = nil
        self.image.image = nil
        self.heartImage.image = nil
    }
    
    // MARK: - Setups
    
    private func setupHierarchy() {
        contentView.addSubview(image)
        contentView.addSubview(littleImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(heartImage)
    }
    
    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.left.top.right.equalTo(self)
            make.height.equalTo(170)
        }
        
        littleImage.snp.makeConstraints { make in
            make.height.width.equalTo(38)
            make.right.bottom.equalTo(image).offset(-7)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(5)
            make.left.equalTo(self).offset(2)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(self).offset(2)
        }
        
        heartImage.snp.makeConstraints { make in
            make.top.equalTo(image.snp.top).offset(145)
            make.left.equalTo(self).offset(10)
            make.height.width.equalTo(18)
        }
    }
    
    // MARK: - Private methods
    
    private func hideUIElements() {
        if littleImage.image != nil {
            littleImage.isHidden = false
        } else {
            littleImage.isHidden = true
        }
        
        if titleLabel.text == "Favourites" {
            heartImage.image = UIImage(systemName: "heart.fill")
        } else {
            heartImage.isHidden = true
        }
    }
    
    // MARK: - Configuration
    
    func configuration(model: CompositionalModel) {
        self.littleImage.image = UIImage(named: model.sharedImage ?? "")
        self.image.image = UIImage(named: model.image)
        self.titleLabel.text = model.title
        self.subtitleLabel.text = "\(model.subtitle)"
        
        hideUIElements()
    }
}
