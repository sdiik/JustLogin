//
//  FetchGameListUseCaseImpl.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

class FetchGameListUseCaseImpl: FetchGameListUseCase {
    let gamesListRepository: GameListRepository
    
    init(gamesListRepository: GameListRepository = GameListRepositoryImpl()) {
        self.gamesListRepository = gamesListRepository
    }
    
    func execute(completionHandler: @escaping FetchGameListUseCaseCompletionHandler) {
        gamesListRepository.fetchGameList() { fetchGameListResult in
            switch fetchGameListResult {
            case .success(let games):
                completionHandler(.success(games))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
