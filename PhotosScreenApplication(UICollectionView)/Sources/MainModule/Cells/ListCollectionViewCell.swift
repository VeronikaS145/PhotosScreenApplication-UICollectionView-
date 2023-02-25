//
//  ListCollectionViewCell.swift
//  PhotosScreenApplication(UICollectionView)
//
//  Created by Nika Semenkova on 25.02.2023.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ListCollectionViewCell"
    
    // MARK: - Outlets
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.tintColor = .systemBlue
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var acessoryImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.tintColor = .systemGray
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lockImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.tintColor = .systemGray
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        self.image.image = nil
    }
    
    // MARK: - Setups
    
    private func setupHierarchy() {
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(acessoryImage)
        contentView.addSubview(separatorView)
        contentView.addSubview(lockImage)
    }
    
    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(14)
            make.width.height.equalTo(25)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(image.snp.right).offset(10)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-30)
        }
        
        acessoryImage.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-10)
            make.width.height.equalTo(15)
        }
        
        separatorView.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(1)
            make.right.equalTo(self).offset(0)
            make.height.equalTo(0.5)
            make.width.equalTo(325)
        }
        
        lockImage.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-30)
            make.width.height.equalTo(15)
        }
    }
    
    // MARK: - Private methods
    
    private func setLockImage() {
        if titleLabel.text == "Hidden" || titleLabel.text == "Recently Deleted" {
            subtitleLabel.isHidden = true
            lockImage.image = UIImage(systemName: "lock.fill")
        } else {
            lockImage.isHidden = true
        }
    }
    
    // MARK: - Configuration
    
    func configuration(model: CompositionalModel) {
        self.image.image = UIImage(systemName: model.image)
        self.titleLabel.text = model.title
        self.subtitleLabel.text = "\(model.subtitle)"
        self.acessoryImage.image = UIImage(systemName: "chevron.right")
        
        setLockImage()
    }
}
