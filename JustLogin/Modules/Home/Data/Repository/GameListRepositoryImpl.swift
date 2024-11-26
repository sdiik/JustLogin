//
//  GameListRepositoryImpl.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

class GameListRepositoryImpl: GameListRepository {
    
    let networkRepository: NetworkRepository
    let gameListApiFactory: GameListApiFactory
    
    init(networkRepository: NetworkRepository = NetworkRepositoryImpl(),
         gameListApiFactory: GameListApiFactory = GameListApiFactoryImpl()) {
        self.networkRepository = networkRepository
        self.gameListApiFactory = gameListApiFactory
    }
    
    func fetchGameList(result: @escaping FetchGameListResult) {
        guard let url = gameListApiFactory.createGameListUrl().url else {
            result(.failure(.loading))
            return
        }
        
        print("================ url ============= \(url)")
        networkRepository.fetchRequest(url) { networkResult in
            switch networkResult {
            case .success(let response):
                let (urlResponse, data) = response
                guard urlResponse.statusCode.isOk else {
                    result(.failure(.loading))
                    return
                }
                print("resultDecode ==============d===== \(data)")
                self.parse(data: data, result: result)
            case .failure:
                result(.failure(.loading))
            }
        }
    }
    private func parse(data: Data, result: @escaping FetchGameListResult) {
        do {
            
            let resultDecode = try JSONDecoder().decode([GameItemDataModel].self, from: data)
            print("resultDecode ==================== \(resultDecode)")
            result(.success(resultDecode))
        } catch {
            result(.failure(.parsing))
        }
    }
}
