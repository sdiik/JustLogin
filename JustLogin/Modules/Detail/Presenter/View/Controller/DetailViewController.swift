//
//  DetailViewController.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var detailTableView: UITableView! {
        didSet {
            detailTableView.delegate = self
            detailTableView.dataSource = self
        }
    }
    
    var item:  GameItemDataModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigation()
    }
    
    private func setupView() {
        detailTableView.register(
            UINib(nibName: TableCells.Cell.banner, bundle: nil),
            forCellReuseIdentifier: TableCells.Cell.banner)
        detailTableView.register(
            UINib(nibName: TableCells.Cell.description, bundle: nil),
            forCellReuseIdentifier: TableCells.Cell.description)
        detailTableView.register(
            UINib(nibName: TableCells.Cell.info, bundle: nil),
            forCellReuseIdentifier: TableCells.Cell.info)
        detailTableView.estimatedRowHeight = 88.0
        detailTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setNavigation() {
        self.hiddenTabBar()
        self.title = "Detail"
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return self.tableView(tableView, cellBannerForRowAt: indexPath)
        case 1:
            return self.tableView(tableView, cellInfoForRowAt: indexPath)
        case 2:
            return self.tableView(tableView, cellDescriptionForRowAt: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    private func tableView(_ tableView: UITableView, cellBannerForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TableCells.Cell.banner,
            for: indexPath) as? BannerTableCell else { return .init() }
        cell.setupView(with: item.image)
        return cell
    }
    
    private func tableView(_ tableView: UITableView, cellDescriptionForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TableCells.Cell.description,
            for: indexPath) as? DescriptionTableCell else { return .init() }
        cell.setupView(with: item.content)
        return cell
    }
    
    private func tableView(_ tableView: UITableView, cellInfoForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TableCells.Cell.info,
            for: indexPath) as? InfoTableCell else { return .init() }
        cell.setTitle(with: item.title ?? "")
        cell.setPublisher(with: item.publishedAt ?? "")
        return cell
    }
}

