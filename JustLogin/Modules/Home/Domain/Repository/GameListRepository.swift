//
//  GameListRepository.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

typealias FetchGameListResult = (_ result: Result<[GameItemDataModel], FetchGameListError>) -> Void

protocol GameListRepository {
    func fetchGameList(result: @escaping FetchGameListResult)
}
