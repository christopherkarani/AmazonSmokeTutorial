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


public struct TopicGetResponse: ValidatableCodable, Equatable {
    
    public var topics: [Topic]
    
    
    public init(topics: [Topic] ) {
        self.topics = topics
    }
    
    public func validate() throws {}
}


/// Represents The Output from an operation for a `HTTP` response
extension TopicGetResponse: OperationHTTP1OutputProtocol {
    public var bodyEncodable: TopicGetResponse? { self }
    
    public var additionalHeadersEncodable: TopicGetResponse? { nil }
}
