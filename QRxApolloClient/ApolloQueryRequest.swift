//
//  ApolloQueryRequest.swift
//  QRxApolloClient
//
//  Created by Tomas Holicky on 25/04/2020.
//  Copyright © 2020 Qusion. All rights reserved.
//

import Apollo

public struct ApolloQueryRequest<Query: GraphQLQuery> {
    let query: Query
    let cachePolicy: CachePolicy
    let queue: DispatchQueue
    
    public init(query: Query, cachePolicy: CachePolicy = .fetchIgnoringCacheData, queue: DispatchQueue = .global(qos: DispatchQoS.QoSClass.background)) {
        self.query = query
        self.cachePolicy = cachePolicy
        self.queue = queue
    }
}
