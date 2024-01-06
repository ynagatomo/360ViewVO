//
//  ImmersiveView.swift
//  360ViewerVO
//
//  Created by Yasuhito Nagatomo on 2023/09/22.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            if let scene = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                if let sphere = scene.findEntity(named: "Sphere_Right") as? ModelEntity {
                    if var sphereMaterial = sphere.model?.materials.first as? ShaderGraphMaterial {
                        if let textureResource = try? await TextureResource(named: "dikhololo_night_4k") {
                            try? sphereMaterial.setParameter(name: "ImageName", value: .textureResource(textureResource))
                            // Attach the material to a sphere.
                            let entity = Entity()
                            entity.components.set(ModelComponent(
                                mesh: .generateSphere(radius: 2),
                                materials: [sphereMaterial]
                            ))
                            // Ensure the texture image points inward at the viewer.
                            entity.scale *= .init(x: -1, y: 1, z: 1)
                            entity.transform.translation = SIMD3<Float>(0, 1, 0)
                            content.add(entity)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
