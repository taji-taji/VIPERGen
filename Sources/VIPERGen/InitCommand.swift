import ArgumentParser
import Foundation
import VIPERGenKit

extension Executor {
    struct InitCommand: ParsableCommand {
        static var configuration = CommandConfiguration(commandName: "init", abstract: "")

        @Option(help: "direcotry path to VIPERGenfile.", completion: .directory)
        var vipergenfilePath: String?

        mutating func run() throws {
            // TODO: VIPERGenfile の有無チェック
            print(FileManager.default.viperGenfileExists(atDirectory: vipergenfilePath ?? "."))

            let companyName = ask("Enter your Company Name: ") ?? ""
            let projectName = ask("Enter your Project Name: ") ?? ""
            var xcodeprojPath = ""
            while xcodeprojPath.isEmpty {
                xcodeprojPath = ask("Enter path to .xcodeproj file: ") ?? ""
            }  
            let prefix = ask("Enter your project prefix (if any): ") ?? ""
            let projectTarget = ask("Enter project target: ") ?? ""
            let projectFilePath = ask("Enter path to project file: ") ?? ""
            let projectGroupPath = projectFilePath

            let VIPERGenfileGenerator = try VIPERGenfileGenerator(gybPath: "path/to/gyb", VIPERGenfilePath: ".")
            try VIPERGenfileGenerator.generate(companyName: companyName)
        }
    }
}
