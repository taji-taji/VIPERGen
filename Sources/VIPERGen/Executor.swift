import ArgumentParser
import Foundation

@main
struct Executor: ParsableCommand {
    static var configuration = CommandConfiguration(commandName: "VIPERGen", 
                                                    abstract: "generate VIPER module.",
                                                    subcommands: [InitCommand.self])
}
