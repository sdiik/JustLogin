//
//  FetchGameListUseCase.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

typealias FetchGameListUseCaseCompletionHandler = (_ result: Result<[GameItemDataModel], FetchGameListError>) -> Void

protocol FetchGameListUseCase {
    func execute(completionHandler: @escaping FetchGameListUseCaseCompletionHandler)
}
