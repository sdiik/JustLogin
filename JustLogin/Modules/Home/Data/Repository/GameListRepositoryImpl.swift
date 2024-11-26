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

        networkRepository.fetchRequest(url) { networkResult in
            switch networkResult {
            case .success(let response):
                let (urlResponse, data) = response
                guard urlResponse.statusCode.isOk else {
                    result(.failure(.loading))
                    return
                }
                self.parse(data: data, result: result)
            case .failure:
                result(.failure(.loading))
            }
        }
    }
    private func parse(data: Data, result: @escaping FetchGameListResult) {
        do {
            
            let resultDecode = try JSONDecoder().decode([GameItemDataModel].self, from: data)
            result(.success(resultDecode))
        } catch {
            result(.failure(.parsing))
        }
    }
}
