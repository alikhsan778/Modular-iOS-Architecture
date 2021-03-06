//
//  WatchlistAPIService.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 04/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import Alamofire

public protocol WatchlistAPIServiceProtocol {
    func getMostActiveSymbols(success: @escaping (Data) -> Void, failure: @escaping (String) -> Void)
}

public final class WatchlistAPIService: WatchlistAPIServiceProtocol {
    public init() {}
    
    public func getMostActiveSymbols(success: @escaping (Data) -> Void, failure: @escaping (String) -> Void) {
        let url = WatchlistAPIRouter.getActiveSymbols
        
        Alamofire.request(url).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                success(data)
                
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
    }
    
}
