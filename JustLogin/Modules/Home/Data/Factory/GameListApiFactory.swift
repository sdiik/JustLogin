//
//  GameListApiFactory.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

protocol GameListApiFactory {
    func createGameListUrl() -> URLComponents
}
