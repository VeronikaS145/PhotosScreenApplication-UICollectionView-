//
//  AlbumCellHeader.swift
//  PhotosScreenApplication(UICollectionView)
//
//  Created by Nika Semenkova on 25.02.2023.
//

import UIKit

class AlbumCellHeader: UICollectionReusableView {
    
    static let identifier = "AlbumCellHeader"
    
    // MARK: - Outlets
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }
    
    // MARK: - Ovveride methods
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(separatorView)
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(-3)
            make.left.equalTo(self).offset(8)
        }
        
        separatorView.snp.makeConstraints { make in
            make.left.equalTo(self).offset(8)
            make.right.equalTo(self).offset(0)
            make.top.equalTo(self).offset(10)
            make.height.equalTo(0.5)
        }
    }
}
