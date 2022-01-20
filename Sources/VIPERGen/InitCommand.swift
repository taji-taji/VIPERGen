import ArgumentParser
import Foundation

extension Executor {
    struct InitCommand: ParsableCommand {
        static var configuration = CommandConfiguration(commandName: "init", abstract: "")

        @Option(help: "path to VIPERGenfile.", completion: .directory)
        var vipergenfilePath: String?

        mutating func run() throws {
            print("init command.")
        }
    }
}
