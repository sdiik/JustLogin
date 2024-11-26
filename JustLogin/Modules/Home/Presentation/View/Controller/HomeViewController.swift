//
//  HomeViewController.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var homeTableView: UITableView! {
        didSet {
            homeTableView.delegate = self
            homeTableView.dataSource = self
        }
    }
    var gameListViewModel = GameListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameListViewModel.delegate = self
        setupView()
        getGameList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showTabBar()
    }
    
    private func setupView() {
        let nibName = UINib(nibName: TableCells.Header.table, bundle: nil)
        homeTableView.register(nibName, forHeaderFooterViewReuseIdentifier: TableCells.Header.table)
        homeTableView.register(UINib(nibName: TableCells.Cell.game, bundle: nil), forCellReuseIdentifier: TableCells.Cell.game)
        homeTableView.sectionHeaderTopPadding = 0
    }
    
    private func getGameList() {
        gameListViewModel.callFetchGames()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameListViewModel.games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.tableView(tableView, cellForGameRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableCells.Header.table) as? HeaderTableCell
        else { return nil }
        return headerView
    }
 
    func tableView(_ tableView: UITableView, cellForGameRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableCells.Cell.game, for: indexPath) as? GameTableCell
        else { return UITableViewCell() }
        cell.setupView(with: gameListViewModel.games[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailGame = DetailViewController()
        detailGame.item = gameListViewModel.games[indexPath.item]
        self.navigationController?.pushViewController(detailGame, animated: true)
    }
}

extension HomeViewController: GameListViewDelegate {
    func isLoading(status: Bool) {
        if status {
            loadingIndicator.startAnimating()
        } else {
            loadingIndicator.stopAnimating()
        }
    }
    
    func fetchGameListSuccess() {
        onMainThreadAsync { [weak self] in
            self?.homeTableView.reloadData()
        }
    }
    
    func fetchGameListFailed(with message: String) {
        Alert.showMessage(with: message, controller: self)
    }
}
