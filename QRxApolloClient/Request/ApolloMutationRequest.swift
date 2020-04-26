//
//  ApolloMutationRequest.swift
//  QRxApolloClient
//
//  Created by Tomas Holicky on 25/04/2020.
//  Copyright © 2020 Qusion. All rights reserved.
//

import Apollo

public struct ApolloMutationRequest<Mutation: GraphQLMutation> {
    let mutation: Mutation
    let queue: DispatchQueue
    
    public init(mutation: Mutation, queue: DispatchQueue = .global(qos: DispatchQoS.QoSClass.background)) {
        self.mutation = mutation
        self.queue = queue
    }
}
