import Foundation

struct FurnitureModel: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let usdzFileName: String
}
