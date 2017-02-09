
class StubbornStub {
    
    private var numberOfRequests: Int = 0
    
    var url: String
    var callback: StubbornResponse
    
    func data(for request: StubbornRequest) -> Data? {
        self.numberOfRequests += 1
        
        var request = request
        request.numberOfRequests = self.numberOfRequests
        
        let dict = self.callback(request)
        return try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
    }
    
    init(url: String, callback: @escaping StubbornResponse) {
        self.url = url
        self.callback = callback
    }
    
}