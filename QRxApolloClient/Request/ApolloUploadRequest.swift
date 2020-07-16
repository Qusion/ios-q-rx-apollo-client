//
//  ApolloUploadRequest.swift
//  QRxApolloClient
//
//  Created by Tomas Holicky on 26/04/2020.
//  Copyright © 2020 Qusion. All rights reserved.
//

import Apollo
import Dispatch

public struct ApolloUploadRequest<Operation: GraphQLOperation> {
    let operation: Operation
    let context: UnsafeMutableRawPointer?
    let files: [GraphQLFile]
    let queue: DispatchQueue
    
    public init(operation: Operation, context: UnsafeMutableRawPointer? = nil, files: [GraphQLFile], queue: DispatchQueue = .main) {
        self.operation = operation
        self.context = context
        self.files = files
        self.queue = queue
    }
}
