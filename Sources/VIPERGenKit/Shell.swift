import Foundation

@discardableResult
public func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.executableURL = URL(string: "file:///usr/bin/env")
    task.arguments = args
    do {
        try task.run()
    } catch {
        return task.terminationStatus
    }
    task.waitUntilExit()
    return task.terminationStatus
}
