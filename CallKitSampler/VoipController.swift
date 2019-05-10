import CallKit
import PushKit

class VoipController: NSObject {
    
    static let shared: VoipController = VoipController()
    private override init() {
        super.init()
    }
    
    private let provider: CXProvider = CXProvider(configuration: CXProviderConfiguration(localizedName: "CallKitSampler"))
    private let pushRegistry = PKPushRegistry(queue: nil)
    
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
    
    func initialSetup() {
        pushRegistry.delegate = self
        pushRegistry.desiredPushTypes = [.voIP]
    }
}

extension VoipController: CXProviderDelegate {
    func providerDidReset(_ provider: CXProvider) { }
    
    func provider(_ provider: CXProvider, perform action: CXStartCallAction) {
    }
    
    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        action.fulfill()
    }
    
    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        action.fulfill()
    }
}

extension VoipController: PKPushRegistryDelegate {
    func pushRegistry(_ registry: PKPushRegistry, didUpdate pushCredentials: PKPushCredentials, for type: PKPushType) {
        print(pushCredentials.token.map { String(format: "%02.2hhx", $0) }.joined())
    }
    
    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType, completion: @escaping () -> Void) {
        initialSetup()
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: "fummicc1")
        update.hasVideo = true
        provider.reportNewIncomingCall(with: UUID(), update: update) { error in }
    }
}
