import ArgumentParser
import Foundation
import VIPERGenKit

extension Executor {
    struct InitCommand: ParsableCommand {
        static var configuration = CommandConfiguration(commandName: "init", abstract: "")

        @Option(help: "direcotry path to VIPERGenfile.", completion: .directory)
        var vipergenfilePath: String?

        mutating func run() throws {
            print("init command.")
            // TODO: VIPERGenfile の有無チェック
            print(FileManager.default.viperGenfileExists(atDirectory: vipergenfilePath ?? "."))

            print("Enter your Company Name: ", terminator: "")
            guard let companyName = readLine() else {
                return
            }
            print(companyName)
        }
    }
}
