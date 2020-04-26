//
//  ApolloClient+.swift
//  QRxApolloClient
//
//  Created by Tomas Holicky on 21/04/2020.
//  Copyright © 2020 Qusion. All rights reserved.
//

import Apollo
import RxSwift

extension ApolloClient: ReactiveCompatible { }

extension Reactive where Base: ApolloClient {
    
    /// Fetches a query from the server.
    public func fetch<Query>(request: ApolloQueryRequest<Query>) -> PrimitiveSequence<SingleTrait, Query.Data> where Query : GraphQLQuery {
        return Single.create { (single) -> Disposable in
            let cancellable = self.base
                .fetch(query: request.query, cachePolicy: request.cachePolicy, queue: request.queue) { (result) in
                    switch result {
                    case .success(let data):
                        if let errors = data.errors {
                            single(.error(self.handle(errors: errors)))
                        } else if let data = data.data {
                            single(.success(data))
                        } else {
                            single(.error(ApolloError.dataNotFound))
                        }
                    case .failure(let error):
                        single(.error(error))
                    }
            }
            return Disposables.create {
                cancellable.cancel()
            }
        }
    }
    
    /// Watchs a query from the server.
    public func watch<Query>(request: ApolloQueryRequest<Query>) -> PrimitiveSequence<SingleTrait, Query.Data> where Query : GraphQLQuery {
        return Single.create { (single) -> Disposable in
            let cancellable = self.base
                .watch(query: request.query, cachePolicy: request.cachePolicy, queue: request.queue) { (result) in
                    switch result {
                    case .success(let data):
                        if let errors = data.errors {
                            single(.error(self.handle(errors: errors)))
                        } else if let data = data.data {
                            single(.success(data))
                        } else {
                            single(.error(ApolloError.dataNotFound))
                        }
                    case .failure(let error):
                        single(.error(error))
                    }
            }
            return Disposables.create {
                cancellable.cancel()
            }
        }
    }
    
    /// Performs a mutation to the server.
    public func perform<Mutation>(request: ApolloMutationRequest<Mutation>) -> PrimitiveSequence<SingleTrait, Mutation.Data> where Mutation : GraphQLMutation {
        return Single.create { (single) -> Disposable in
            let cancellable = self.base
                .perform(mutation: request.mutation, queue: request.queue) { (result) in
                    switch result {
                    case .success(let data):
                        if let errors = data.errors {
                            single(.error(self.handle(errors: errors)))
                        } else if let data = data.data {
                            single(.success(data))
                        } else {
                            single(.error(ApolloError.dataNotFound))
                        }
                    case .failure(let error):
                        single(.error(error))
                    }
            }
            return Disposables.create {
                cancellable.cancel()
            }
        }
    }
    
    /// Subscribe to a subscription.
    public func subscribe<Subscription>(request: ApolloSubscriptionRequest<Subscription>) -> PrimitiveSequence<SingleTrait, Subscription.Data> where Subscription : GraphQLSubscription {
        return Single.create { (single) -> Disposable in
            let cancellable = self.apollo
                .subscribe(subscription: request.subscription, queue: request.queue) { (result) in
                    switch result {
                    case .success(let data):
                        if let errors = data.errors {
                            single(.error(self.handle(errors: errors)))
                        } else if let data = data.data {
                            single(.success(data))
                        } else {
                            single(.error(ApolloError.dataNotFound))
                        }
                    case .failure(let error):
                        single(.error(error))
                    }
            }
            return Disposables.create {
                cancellable.cancel()
            }
        }
    }
    
    /// Uploads the given files with the given operation.
    public func upload<Operation>(request: ApolloUploadRequest<Operation>) -> PrimitiveSequence<SingleTrait, Operation.Data> where Operation : GraphQLOperation {
        return Single.create { (single) -> Disposable in
            let cancellable = self.apollo
                .upload(operation: request.operation, context: request.context, files: request.files, queue: request.queue) { (result) in
                    switch result {
                    case .success(let data):
                        if let errors = data.errors {
                            single(.error(self.handle(errors: errors)))
                        } else if let data = data.data {
                            single(.success(data))
                        } else {
                            single(.error(ApolloError.dataNotFound))
                        }
                    case .failure(let error):
                        single(.error(error))
                    }
            }
            return Disposables.create {
                cancellable.cancel()
            }
        }
    }
    
    /// Helper function for handling GraphQLError
    private func handle(errors: [GraphQLError]) -> ApolloError {
        return ApolloError.gqlErrors(errors)
    }
}
