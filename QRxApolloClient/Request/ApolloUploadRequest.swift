//
//  ApolloUploadRequest.swift
//  QRxApolloClient
//
//  Created by Tomas Holicky on 26/04/2020.
//  Copyright © 2020 Qusion. All rights reserved.
//

import Apollo

struct ApolloUploadRequest<Operation: GraphQLOperation> {
    let operation: Operation
    let context: UnsafeMutableRawPointer?
    let files: [GraphQLFile]
    let queue: DispatchQueue
    
    public init(operation: Operation, context: UnsafeMutableRawPointer? = nil, files: [GraphQLFile], queue: DispatchQueue = .global(qos: DispatchQoS.QoSClass.background)) {
        self.operation = operation
        self.context = context
        self.files = files
        self.queue = queue
    }
}
