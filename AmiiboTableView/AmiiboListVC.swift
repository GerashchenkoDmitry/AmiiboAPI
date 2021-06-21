//
//  ViewController.swift
//  AmiiboTableView
//
//  Created by Дмитрий Геращенко on 01.02.2021.
//  Copyright © 2021 Дмитрий Геращенко. All rights reserved.
//

import UIKit

class AmiiboListVC: UIViewController {
  
  let tableView = UITableView()
  var amiiboList = [AmiiboForView]()
  
  override func viewDidLoad() {
    setupTableView()
    
    
    let anonymousFunction = { (fetchedAmiiboList: [Amiibo]) in
      DispatchQueue.main.async {
        
        let amiiboForViewList = fetchedAmiiboList.map { amiibo in
          return AmiiboForView(
            name: amiibo.name,
            gameSeries: amiibo.gameSeries,
            imageUrl: amiibo.image,
            count: 0)
        }
        self.amiiboList = amiiboForViewList
        self.tableView.reloadData()
      }
    }
    AmiiboAPI.shared.fetchAmiiboList(onCompletion: anonymousFunction)
  }
  
  func setupTableView() {
    view.addSubview(tableView)
    tableView.register(AmiiboCell.self, forCellReuseIdentifier: "cellId")
    
    tableView.dataSource = self
    tableView.delegate = self
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
  }
}

//MARK: DataSource

extension AmiiboListVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return amiiboList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? AmiiboCell else {
      return UITableViewCell()
    }
    let amiibo = amiiboList[indexPath.row]
    
    cell.nameLabel.text = amiibo.name
    cell.gameSeriesLabel.text = amiibo.gameSeries
    cell.owningCountLabel.text = String(amiibo.count)
    if let url = URL(string: amiibo.imageUrl) {
      cell.imageIV.loadImage(from: url)
    }
    cell.accessoryType = .disclosureIndicator
    return cell
  }
}

//MARK: TableViewDelegate

extension AmiiboListVC: UITableViewDelegate {
  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
    let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
      
      self.amiiboList.remove(at: indexPath.row)
      self.tableView.deleteRows(at: [indexPath], with: .automatic)
      
      completionHandler(true)
    }
    
    return UISwipeActionsConfiguration(actions: [deleteAction])
    
  }
  func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
    let countAction = UIContextualAction(style: .normal, title: "Count up") { (action, view, completionHandler) in
      let currentCount = self.amiiboList[indexPath.row].count
      self.amiiboList[indexPath.row].count = currentCount + 1
      
      if let cell = tableView.cellForRow(at: indexPath) as? AmiiboCell {
        cell.owningCountLabel.text = String(self.amiiboList[indexPath.row].count)
      }
      completionHandler(true)
    }
    return UISwipeActionsConfiguration(actions: [countAction])
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let amiibo = amiiboList[indexPath.row]
    let amiiboDetailVC = AmiiboDetailVC()
    
    amiiboDetailVC.amiibo = amiibo
    
    navigationController?.pushViewController(amiiboDetailVC, animated: true)
    amiiboDetailVC.navigationItem.title = amiibo.name
  }
}

// MARK: Navigation Controller Delegate

extension AmiiboListVC: UINavigationControllerDelegate {
  
}

