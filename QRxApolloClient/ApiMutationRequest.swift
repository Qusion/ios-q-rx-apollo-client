//
//  ApiMutationRequest.swift
//  QRxApolloClient
//
//  Created by Tomas Holicky on 21/04/2020.
//  Copyright © 2020 Qusion. All rights reserved.
//

import Apollo

public struct ApiMutationRequest<Mutation: GraphQLMutation> {
    let mutation: Mutation
    let queue: DispatchQueue
    
    public init(mutation: Mutation, queue: DispatchQueue = .main) {
        self.mutation = mutation
        self.queue = queue
    }
}
