import Foundation
import Combine

class ARViewModel: ObservableObject {
    @Published var selectedModel: FurnitureModel

    let availableModels: [FurnitureModel] = [
        FurnitureModel(name: "Toy Biplane", usdzFileName: "toy_biplane_realistic"),
        FurnitureModel(name: "Toy Car", usdzFileName: "toy_car"),
        FurnitureModel(name: "Robot", usdzFileName: "robot"),
        FurnitureModel(name: "Soccer Ball", usdzFileName: "ball_soccerball_realistic")
    ]

    init() {
        self.selectedModel = availableModels.first!
    }

    var selectedModelName: String {
        return selectedModel.usdzFileName
    }
}
