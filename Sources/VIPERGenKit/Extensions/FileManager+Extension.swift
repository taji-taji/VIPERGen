import Foundation

public extension FileManager {
    static let VIPERGenfileName: String = "VIPERGenfile"

    func viperGenfileExists(atDirectory directory: String) -> Bool {
        let directoryURL = URL(fileURLWithPath: directory)
        return fileExists(atPath: directoryURL.appendingPathComponent(FileManager.VIPERGenfileName).path)
    }
}
