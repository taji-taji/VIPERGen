import Foundation

public struct VIPERGenfileGenerator {
    private let VIPERGenfilePath: String
    private let templateFilePath: String
    private let gyb: Gyb

    public init(gybPath: String, VIPERGenfilePath: String, templateFilePath: String = "./VIPERGenfile.gyb", fileManager: FileManager = .default) throws {
        gyb = try Gyb(path: gybPath, fileManager: fileManager)
        self.VIPERGenfilePath = VIPERGenfilePath
        self.templateFilePath = templateFilePath
    }

    public func generate(companyName: String) throws {
        let arguments: [String : String] = [
            "company": companyName
        ]
        do {
            try gyb.generate(templatePath: templateFilePath, outputPath: VIPERGenfilePath, arguments: arguments)
        } catch {
            print(error)
        }
    }
}
