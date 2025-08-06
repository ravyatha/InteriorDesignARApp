import SwiftUI
import RealityKit
import ARKit

struct ContentView: View {
    @StateObject private var viewModel = ARViewModel()

    var body: some View {
        ZStack {
            ARViewContainer(modelName: viewModel.selectedModelName)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Picker("Select Model", selection: $viewModel.selectedModel) {
                    ForEach(viewModel.availableModels) { model in
                        Text(model.name).tag(model)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.top, 50)
                
                Spacer()
                Text("Tap on a surface to place the object")
                    .padding()
                    .background(Color.black.opacity(0.6))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.bottom, 30)
            }
        }
    }
}
