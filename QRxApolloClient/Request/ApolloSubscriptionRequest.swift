//
//  ApolloSubscriptionRequest.swift
//  QRxApolloClient
//
//  Created by Tomas Holicky on 26/04/2020.
//  Copyright © 2020 Qusion. All rights reserved.
//

import Apollo

public struct ApolloSubscriptionRequest<Subscription: GraphQLSubscription> {
    let subscription: Subscription
    let queue: DispatchQueue
    
    public init(subscription: Subscription, queue: DispatchQueue = .global(qos: DispatchQoS.QoSClass.background)) {
        self.subscription = subscription
        self.queue = queue
    }
}
