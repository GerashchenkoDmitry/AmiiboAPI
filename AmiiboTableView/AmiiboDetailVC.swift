//
//  AmiiboDetailVC.swift
//  AmiiboTableView
//
//  Created by Дмитрий Геращенко on 08.02.2021.
//  Copyright © 2021 Дмитрий Геращенко. All rights reserved.
//

import UIKit

class AmiiboDetailVC: UIViewController {
  
  var amiibo: AmiiboForView?
  var safeArea: UILayoutGuide!
  let imageView = CustomImageView()
  let nameLabel = UILabel()
  let gameSeriesLabel = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    safeArea = view.layoutMarginsGuide
    view.backgroundColor = .white
    setupImage()
    setupNameLabel()
    setupGameSeriesLabel()
    setupData()
    
  }
  
  func setupImage() {
    view.addSubview(imageView)
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    imageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50).isActive = true
    imageView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.8).isActive = true
    imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
  }
  
  func setupNameLabel() {
    view.addSubview(nameLabel)
    
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
    nameLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
    
  }
  
  func setupGameSeriesLabel() {
    view.addSubview(gameSeriesLabel)
    
    gameSeriesLabel.translatesAutoresizingMaskIntoConstraints = false
    gameSeriesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
    gameSeriesLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor, constant: 5).isActive = true
  }
  
  func setupData() {
    if
      let amiibo = amiibo,
      let url = URL(string: amiibo.imageUrl)
    {
      imageView.loadImage(from: url)
      nameLabel.text = amiibo.name
      gameSeriesLabel.text = amiibo.gameSeries
    }
  }
}
