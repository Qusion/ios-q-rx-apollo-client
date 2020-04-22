//
//  ApolloClient+.swift
//  QRxApolloClient
//
//  Created by Tomas Holicky on 21/04/2020.
//  Copyright © 2020 Qusion. All rights reserved.
//

import RxSwift
import Apollo

extension ApolloClient: ReactiveCompatible { }

extension Reactive where Base: ApolloClient {
    
    func fetch<Query>(request: ApiQueryRequest<Query>) -> PrimitiveSequence<SingleTrait, Query.Data> where Query : GraphQLQuery {
        return Single.create { (single) -> Disposable in
            let cancellable = self.base
                .fetch(query: request.query, cachePolicy: request.cachePolicy, queue: request.queue) { (result) in
                    switch result {
                    case .success(let data):
                        if let errors = data.errors {
                            single(.error(errors.first!))
                        } else if let data = data.data {
                            single(.success(data))
                        } else {
                            single(.success())
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
    
    func watch<Query>(request: ApiQueryRequest<Query>) -> PrimitiveSequence<SingleTrait, Query.Data> where Query : GraphQLQuery {
        return Single.create { (single) -> Disposable in
            let cancellable = self.base
                .watch(query: request.query, cachePolicy: request.cachePolicy, queue: request.queue) { (result) in
                    switch result {
                    case .success(let data):
                        if let errors = data.errors {
                            single(.error(errors.first!))
                        } else if let data = data.data {
                            single(.success(data))
                        } else {
                            single(.success())
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
    
    func perform<Mutation>(request: ApiMutationRequest<Mutation>) -> PrimitiveSequence<SingleTrait, Mutation.Data> where Mutation : GraphQLMutation {
        return Single.create { (single) -> Disposable in
            let cancellable = self.base
                .perform(mutation: request.mutation, queue: request.queue) { (result) in
                    switch result {
                    case .success(let data):
                        if let errors = data.errors {
                            single(.error(errors.first!))
                        } else if let data = data.data {
                            single(.success(data))
                        } else {
                            single(.success())
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
}
