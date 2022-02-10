import Foundation

struct Gyb {
    private let path: String
    private let fileManager: FileManager
    
    init(path: String, fileManager: FileManager = .default) throws {
        self.path = path
        self.fileManager = fileManager

        if !fileManager.fileExists(atPath: path) {
            throw GybError.gybNotFound
        }
    }

    func generate(templatePath: String, outputPath: String, arguments: [String : String]) throws {
        guard fileManager.fileExists(atPath: templatePath) else {
            throw GybError.templateNotFound
        }
        let argumentsList: [String] = [path, templatePath, "-o", outputPath, "--line-directive="] + arguments.map { "-D" + $0.key + "=" + $0.value }
        shell(argumentsList)
    }
}

enum GybError: Error {
    case gybNotFound
    case templateNotFound
}
