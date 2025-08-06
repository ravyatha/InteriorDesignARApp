import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    var modelName: String

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            let config = ARWorldTrackingConfiguration()
            config.sceneReconstruction = .mesh
            config.planeDetection = [.horizontal, .vertical]
            config.environmentTexturing = .automatic
            config.isLightEstimationEnabled = true
            config.frameSemantics = .sceneDepth

            arView.session.run(config)
        }

        
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        arView.addGestureRecognizer(tapGesture)

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: ARViewContainer

        init(_ parent: ARViewContainer) {
            self.parent = parent
        }

        @objc func handleTap(_ sender: UITapGestureRecognizer) {
            guard let arView = sender.view as? ARView else { return }

            let tapLocation = sender.location(in: arView)
            if let result = arView.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .horizontal).first {
                let anchor = AnchorEntity(world: result.worldTransform)
                arView.scene.addAnchor(anchor)


                if let modelEntity = try? ModelEntity.load(named: parent.modelName) as? (ModelEntity & HasCollision) {
                    modelEntity.generateCollisionShapes(recursive: true)
                    arView.installGestures([.rotation, .scale], for: modelEntity)
                    anchor.addChild(modelEntity)
                }
            }
        }
    }
}
