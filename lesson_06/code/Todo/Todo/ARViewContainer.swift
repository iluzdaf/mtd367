//
//  ARView.swift
//  Todo
//
//  Created by Fadzuli Said on 25/7/25.
//

import ARKit
import RealityKit
import SwiftUI
import Combine

class RotationCoordinator {
    var entity: ModelEntity?
    var angle: Float = 0
    var updateSubscription: Cancellable?
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arViewContainer = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        arViewContainer.session.run(config)

        let box = MeshResource.generateBox(size: 0.1)
        let material = UnlitMaterial(color: .blue)
        let entity = ModelEntity(mesh: box, materials: [material])
        entity.position = SIMD3(0, 0, -0.3)

        let anchor = AnchorEntity(world: .zero)
        anchor.addChild(entity)
        
        let robotEntity = try! Entity.load(named: "Cosmonaut")
        
        if let animation = entity.availableAnimations.first {
            entity.playAnimation(animation.repeat())
        }
        
        anchor.addChild(robotEntity)
        
        arViewContainer.scene.anchors.append(anchor)
        
        context.coordinator.entity = entity

        context.coordinator.updateSubscription = arViewContainer.scene.subscribe(to: SceneEvents.Update.self) { event in
            guard let entity = context.coordinator.entity else {
                return
            }
            context.coordinator.angle += Float(event.deltaTime) * .pi / 2 // 90° per second
            entity.transform.rotation = simd_quatf(angle: context.coordinator.angle, axis: [0, 1, 0])
        }
        
        return arViewContainer
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> RotationCoordinator {
        return RotationCoordinator()
    }
}
