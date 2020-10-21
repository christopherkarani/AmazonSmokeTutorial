import SmokeOperationsHTTP1
import SmokeOperationsHTTP1Server
import AsyncHTTPClient
import NIO
import SmokeHTTP1



/// To Start the `HTTP1` server, smoke requires a type that conforms to
/// `SmokeServerPerInvocationContextInitializer`
struct LevelUpInvocationContextInitializer: SmokeServerPerInvocationContextInitializer {
    
    typealias SelectorType = StandardSmokeHTTP1HandlerSelector<ApplicationContext,
                                                               MyOperationsDelegate,
                                                               ModelOperations>
    let handlerSelector: SelectorType
    
    // an application context that will be passed to each of the  operations
    let applicationContext = ApplicationContext()
    
    
    /// When initializing this class we use SwiftNIO's `EventLoop` to create an instance of `SelectorType` and add the
    /// Operations to your server
    init(eventLoop: EventLoop) throws {
        var selector = SelectorType(defaultOperationDelegate: JSONPayloadHTTP1OperationDelegate())
        addOperations(selector: &selector)
        self.handlerSelector = selector
    }
    
    
    /// Smoke uses `getInvocationContext` when a new request comes in. From it we return the same instance of
    /// `ApplicationContext` otherwise we cannot persist the data
    func getInvocationContext(
        invocationReporting: SmokeServerInvocationReporting<SmokeInvocationTraceContext>
    ) -> ApplicationContext {
        applicationContext
    }
    
    /// Used for cleaning up any unused resources
    func onShutdown() throws {}
}


typealias MyOperationsDelegate = JSONPayloadHTTP1OperationDelegate<SmokeInvocationTraceContext>

SmokeHTTP1Server.runAsOperationServer(LevelUpInvocationContextInitializer.init)


