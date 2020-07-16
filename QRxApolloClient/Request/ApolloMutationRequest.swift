//
//  ApolloMutationRequest.swift
//  QRxApolloClient
//
//  Created by Tomas Holicky on 25/04/2020.
//  Copyright © 2020 Qusion. All rights reserved.
//

import Apollo
import Dispatch

public struct ApolloMutationRequest<Mutation: GraphQLMutation> {
    let mutation: Mutation
    let queue: DispatchQueue
    
    public init(mutation: Mutation, queue: DispatchQueue = .main) {
        self.mutation = mutation
        self.queue = queue
    }
}
