//
//  ApolloQueryRequest.swift
//  QRxApolloClient
//
//  Created by Tomas Holicky on 25/04/2020.
//  Copyright © 2020 Qusion. All rights reserved.
//

import Apollo
import Reachability

public struct ApolloQueryRequest<Query: GraphQLQuery> {
    let query: Query
    let cachePolicy: CachePolicy
    let queue: DispatchQueue
    
    public init(query: Query, cachePolicy: CachePolicy?, queue: DispatchQueue = .global(qos: DispatchQoS.QoSClass.background)) {
        self.query = query
        self.queue = queue
        if let cachePolicy = cachePolicy {
            self.cachePolicy = cachePolicy
        } else {
            do {
                if try Reachability().connection == .unavailable {
                    self.cachePolicy = .returnCacheDataDontFetch
                } else {
                    self.cachePolicy = .fetchIgnoringCacheData
                }
            } catch {
                self.cachePolicy = .fetchIgnoringCacheData
            }
        }
    }
}
