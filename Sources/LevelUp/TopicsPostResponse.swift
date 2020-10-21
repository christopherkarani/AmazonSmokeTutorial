//
//  File.swift
//  
//
//  Created by Chris Karani on 21/10/2020.
//

import SmokeHTTP1
import SmokeOperations
import SmokeOperationsHTTP1
import SmokeOperationsHTTP1Server


public struct TopicsPostResponse: Codable, Validatable, Equatable {
    public func validate() throws {}
}

extension TopicsPostResponse: OperationHTTP1OutputProtocol {
    public var bodyEncodable: TopicsPostResponse? { self }
    public var additionalHeadersEncodable: TopicsPostResponse? { nil }
}
