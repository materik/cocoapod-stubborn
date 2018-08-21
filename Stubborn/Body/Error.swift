
extension Stubborn.Body {

    public class Error: Stubborn.Body {

        public private(set) var statusCode: Stubborn.Request.StatusCode
        
        public convenience init(_ statusCode: Stubborn.Request.StatusCode, _ message: String) {
            self.init(statusCode, ["error": message])
        }
        
        public required init(_ statusCode: Stubborn.Request.StatusCode, _ body: InternalBody) {
            self.statusCode = statusCode
            
            super.init(body)
        }
        
        public required init(dictionaryLiteral elements: (Key, Value)...) {
            fatalError("not supported")
        }
        
        var error: Swift.Error? {
            return NSError(domain: "Error", code: self.statusCode, userInfo: self.body)
        }
        
    }

}

extension Stubborn.Body.Error: CustomStringConvertible {
    
    public var description: String {
        var description = "Error({"
        description = "\(description)\n    StatusCode: \(self.statusCode)"
        description = "\(description)\n})"
        
        return description
    }

}
