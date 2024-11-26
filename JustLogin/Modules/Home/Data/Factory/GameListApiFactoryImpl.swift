//
//  GameListApiFactoryImpl.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

struct GameListApiFactoryImpl: GameListApiFactory {
    func createGameListUrl() -> URLComponents {
        return URLComponents(string: "https://jsonplaceholder.org/posts")!
    }
}
