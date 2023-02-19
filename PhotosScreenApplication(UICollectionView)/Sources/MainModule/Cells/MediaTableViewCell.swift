//
//  MediaTableViewCell.swift
//  PhotosScreenApplication(UICollectionView)
//
//  Created by Nika Semenkova on 20.02.2023.
//

import UIKit
import SnapKit

class MediaTableViewCell: UITableViewCell {
    
    static let identifier = "DefaultTableViewCell"
    
    var cells: CompositionalModel? {
        didSet {
            icon.image = UIImage(systemName: cells?.image ?? "")
            titleLabel.text = cells?.title ?? ""
            subtitleLabel.text = "\(String(describing: cells?.subtitle))"
            
        }
    }
    
    // MARK: - UI Elements
    
    private lazy var view: UIView = {
        let view = UIView()
        view.addSubview(icon)
        view.backgroundColor = .black
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    // MARK: - Override methods
//
//    override func prepareForReuse() {
//        icon = nil
//    }
    
    // MARK: - Setups
    
    private func setupHierarchy() {
        addSubview(icon)
        addSubview(view)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    private func setupLayout() {
        view.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(10)
            make.width.height.equalTo(35)
        }
        
        icon.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(14)
            make.width.height.equalTo(25)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(icon.snp.right).offset(10)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-40)
        }
    }
}
