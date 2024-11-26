typealias FetchGameListUseCaseCompletionHandler = (_ result: Result<[GameItemDataModel], FetchGameListError>) -> Void

protocol FetchGameListUseCase {
    func execute(completionHandler: @escaping FetchGameListUseCaseCompletionHandler)
}
