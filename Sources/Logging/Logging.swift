//
// Define a simple class that enables access to the undelrying Apple logging mechanism.
// This defintion assumes that the version of iOS that the app is built for is higher
// than version 11 when SystemLogger became available. The package definition specifies
// that the version the package needs is version 17. The SystemLogger is defined as
// a class rather than a struct because the logger needs to be shared amongst
// multiple other objects. Then Apple logging mechanism handles concurrent
// invocation of methods which is why the class does not manage the concurrency
// issue itself.
//

import Foundation
import OSLog

@available(macOS 11.0, *)
public class SystemLogger
    {
    //
    // This use of the Singleton pattern allows access to a logger from
    // anywhere in the code base.
    //
    public static let shared = SystemLogger()
    
    private let logger = Logger()
    
    public func log(_ message: String,file: StaticString = #file,line: Int = #line)
        {
        let fileName = (file.description as NSString).lastPathComponent
        self.logger.log("\(fileName):\(line) \(message)")
        }
        
    public func logDebug(_ message: String,file: StaticString = #file,line: Int = #line)
        {
        let fileName = (file.description as NSString).lastPathComponent
        self.logger.debug("\(fileName):\(line) \(message)")
        }
        
    public func logError(_ message: String,file: StaticString = #file,line: Int = #line)
        {
        let fileName = (file.description as NSString).lastPathComponent
        self.logger.error("\(fileName):\(line) \(message)")
        }
    }
