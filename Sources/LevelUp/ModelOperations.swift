//
//  File.swift
//  
//
//  Created by Chris Karani on 21/10/2020.
//

import SmokeOperations
import SmokeOperationsHTTP1


public enum ModelOperations: String, Hashable, OperationIdentity {
    case topicGet
    case topicPost
    
    public var operationPath: String {
        switch self {
        case .topicGet, .topicPost: return "/topics"
        }
    }
}


extension ModelOperations: CustomStringConvertible {
    public var description: String { rawValue }
}


public struct ErrorTypes: OptionSet {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let serverError = ErrorTypes(rawValue: 1)
}

extension ErrorTypes: ErrorIdentifiableByDescription {
    public var description: String {
        switch rawValue {
        case 1:
            return "Server Error"
        default:
            return ""
        }
    }
}

// 1
public func addOperations<SelectorType: SmokeHTTP1HandlerSelector>(
  selector: inout SelectorType
) where SelectorType.ContextType == ApplicationContext,
        SelectorType.OperationIdentifer == ModelOperations {
    // 2
    selector.addHandlerForOperation(.topicGet,
                                    httpMethod: .GET,
                                    operation: topicsGetOperation,
                                    allowedErrors: [(ErrorTypes.serverError, 500)])
    selector.addHandlerForOperation(.topicPost,
                                    httpMethod: .POST,
                                    operation: topicPostOperation,
                                    allowedErrors: [(ErrorTypes.serverError, 500)])
}




