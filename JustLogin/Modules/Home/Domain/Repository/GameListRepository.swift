typealias FetchGameListResult = (_ result: Result<[GameItemDataModel], FetchGameListError>) -> Void

protocol GameListRepository {
    func fetchGameList(result: @escaping FetchGameListResult)
}
