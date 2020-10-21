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



/// This Operation handles Get Requests for a given `Topic`
/// - Parameters:
///   - input: Input Information
///   - context: Input Context
/// - Throws: Throws a Server Error
/// - Returns: <#description#>
func topicsGetOperation(
    input: TopicsGetRequest,
    context: ApplicationContext) throws -> TopicGetResponse {
    
    return TopicGetResponse(topics: context.topicStore.topics)
}


/* The `Validatable` Protocol is required for input requests and output response types */
struct TopicsGetRequest: Codable, Validatable, Equatable {
    func validate() throws {}
}

extension TopicsGetRequest: OperationHTTP1InputProtocol {
    static func compose(
        queryDecodableProvider: () throws -> TopicsGetRequest,
        pathDecodableProvider: () throws -> TopicsGetRequest,
        bodyDecodableProvider: () throws -> TopicsGetRequest,
        headersDecodableProvider: () throws -> TopicsGetRequest) throws -> TopicsGetRequest {
        
        try queryDecodableProvider()
    }
}
