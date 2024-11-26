import Foundation

struct GameListApiFactoryImpl: GameListApiFactory {
    func createGameListUrl() -> URLComponents {
        return URLComponents(string: "https://jsonplaceholder.org/posts")!
    }
}
