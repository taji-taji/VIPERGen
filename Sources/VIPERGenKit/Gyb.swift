import Foundation

struct Gyb {
    private let pathURL: URL
    private let fileManager: FileManager
    
    init(path: String, fileManager: FileManager = .default) throws {
        let nsStringPath = NSString(string: path)
        self.pathURL = URL(fileURLWithPath: nsStringPath.expandingTildeInPath, relativeTo: URL(fileURLWithPath: #file))
        self.fileManager = fileManager
        
        print(fileManager.fileExists(atPath: pathURL.path))

        if !fileManager.fileExists(atPath: pathURL.path) {
            throw GybError.gybNotFound
        }
    }

    func generate(templatePath: String, outputPath: String, arguments: [String : String]) throws {
        let nsStringPath = NSString(string: templatePath)
        let url = URL(fileURLWithPath: nsStringPath.expandingTildeInPath, relativeTo: URL(fileURLWithPath: #file))
        guard fileManager.fileExists(atPath: url.path) else {
            throw GybError.templateNotFound
        }
        let argumentsList: [String] = [pathURL.path, templatePath, "-o", outputPath, "--line-directive="] + arguments.map { "-D" + $0.key + "=" + $0.value }
        shell(argumentsList)
    }
}

enum GybError: Error {
    case gybNotFound
    case templateNotFound
}
