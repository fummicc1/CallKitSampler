import CallKit

class CallKitController: NSObject {
    
    let provider: CXProvider
    
    init(provider: CXProvider) {
        self.provider = provider
    }
}

extension CallKitController: CXProviderDelegate {
    func providerDidReset(_ provider: CXProvider) { }
    
    func provider(_ provider: CXProvider, perform action: CXStartCallAction) {
    }
    
    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
    }
    
    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
    }
}
