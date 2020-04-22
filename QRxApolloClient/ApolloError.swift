//
//  ApolloError.swift
//  QRxApolloClient
//
//  Created by Tomas Holicky on 22/04/2020.
//  Copyright © 2020 Qusion. All rights reserved.
//

public enum ApolloError: Error {
    case dataNotFound
    case gqlErrors([GraphQLError])
}
