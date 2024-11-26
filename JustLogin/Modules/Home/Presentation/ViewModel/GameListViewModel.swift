import Foundation
import UIKit

protocol GameListViewDelegate {
    func isLoading(status: Bool)
    func fetchGameListSuccess()
    func fetchGameListFailed(with message: String)
}

class GameListViewModel {
     
    private let fetchGameListUseCase: FetchGameListUseCase
    var delegate: GameListViewDelegate?
    var games = [GameItemDataModel]() {
        didSet {
            delegate?.fetchGameListSuccess()
        }
    }
    
    init(fetchGameListUseCase: FetchGameListUseCase = FetchGameListUseCaseImpl()) {
        self.fetchGameListUseCase = fetchGameListUseCase
    }

    func callFetchGames() {
        delegate?.isLoading(status: true)
        fetchGameListUseCase.execute() { [weak self] result in
            onMainThreadAsync { [weak self] in
                switch result {
                case .success(let data):
                    self?.games = data
                case .failure(let error):
                    self?.delegate?.fetchGameListFailed(with: error.localizedDescription)
                }
                self?.delegate?.isLoading(status: false)
            }
        }
    }
}
