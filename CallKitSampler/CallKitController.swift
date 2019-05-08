import CallKit

class CallKitController: NSObject {
    
    private let provider: CXProvider
    
    init(provider: CXProvider = CXProvider(configuration: CXProviderConfiguration(localizedName: "CallKitSampler"))) {    
        self.provider = provider
    }
    
    func setDelegate() {
        provider.setDelegate(self, queue: nil)
    }
    
    func startCall(myName: String) {
        let controller = CXCallController()
        let transaction = CXTransaction(action: CXStartCallAction(call: UUID(), handle: CXHandle(type: .generic, value: myName)))
        controller.request(transaction) { error in
            if let error = error {
                return print("\(error)")
            }
        }
    }
    
    func didRecievencomingPush() {
        
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
