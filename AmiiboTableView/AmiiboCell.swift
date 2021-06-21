//
//  AmiiboCell.swift
//  AmiiboTableView
//
//  Created by Дмитрий Геращенко on 02.02.2021.
//  Copyright © 2021 Дмитрий Геращенко. All rights reserved.
//

import UIKit

class AmiiboCell: UITableViewCell {
  
  var safeArea: UILayoutGuide!
  let imageIV = CustomImageView()
  let nameLabel = UILabel()
  let gameSeriesLabel = UILabel()
  let owningCountLabel = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Setup
  
  func setupView() {
    safeArea = layoutMarginsGuide
    setupOwningCountLabel()
    setupImageView()
    setupNameLabel()
    setupGameSeriesLabel()
    
  }
  
  func setupOwningCountLabel() {
    addSubview(owningCountLabel)
    
    owningCountLabel.translatesAutoresizingMaskIntoConstraints = false
    owningCountLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
    owningCountLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
  }
  
  func setupImageView() {
    addSubview(imageIV)
    
    imageIV.translatesAutoresizingMaskIntoConstraints = false
    imageIV.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    imageIV.leadingAnchor.constraint(equalTo: owningCountLabel.leadingAnchor, constant: 20).isActive = true
    imageIV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    imageIV.widthAnchor.constraint(equalToConstant: 40).isActive = true
    imageIV.heightAnchor.constraint(equalToConstant: 40).isActive = true
  }
  
  func setupNameLabel() {
    addSubview(nameLabel)
    
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor, constant: 5).isActive = true
    nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
  }
  
  func setupGameSeriesLabel() {
    addSubview(gameSeriesLabel)
    
    gameSeriesLabel.translatesAutoresizingMaskIntoConstraints = false
    gameSeriesLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
    gameSeriesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
    gameSeriesLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
  }
  
  
  
}
