import Foundation

func ask(_ question: String) -> String? {
    print(question, terminator: "")
    return readLine()
}
