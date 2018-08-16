
extension Stubborn.Body {
    
    public class Simple: Stubborn.Body {
        
        public private(set) var statusCode: Stubborn.Request.StatusCode
        public private(set) var message: String
        
        public required init(_ statusCode: Stubborn.Request.StatusCode, _ message: String) {
            self.statusCode = statusCode
            self.message = message
            
            super.init(["message": self.message])
        }
        
        public required init(dictionaryLiteral elements: (Key, Value)...) {
            fatalError("not supported")
        }
        
    }
    
}

extension Stubborn.Body.Simple: CustomStringConvertible {
    
    public var description: String {
        var description = "StatusCode({"
        description = "\(description)\n    StatusCode: \(self.statusCode)"
        description = "\(description)\n    Message: \(self.message)"
        description = "\(description)\n})"
        
        return description
    }
    
}
