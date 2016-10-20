//
// Created by Jalen Moore on 8/13/16.
// Copyright (c) 2016 Jalen Moore. All rights reserved.
//

import SpriteKit

class Pixels: SKScene, SKPhysicsContactDelegate {
    var location = CGPointMake(0,0)
    var touched: Bool = false
    var pixelMode: Bool = true
    //Pixel Colors
    func blackPixels() {
        if touched == true && pixelMode == true {
            let pixel = SKSpriteNode(imageNamed: "Black")
            pixel.name = "Pixel"
            pixel.zPosition = -2
            pixel.size = CGSize(width: pixel.size.width * 2, height: pixel.size.height * 2)
            pixel.physicsBody = SKPhysicsBody(circleOfRadius: pixel.size.width/2)
            pixel.physicsBody?.affectedByGravity = false
            pixel.physicsBody?.allowsRotation = false
            pixel.physicsBody?.dynamic = false
            pixel.position = location
            addChild(pixel)
            if pixel.position.y <= -227 && pixel.position.y >= -327 && pixel.position.x >= -150 && pixel.position.x <= 150 {
                pixel.removeFromParent()
            }
        }

    }

    func redPixels() {
        if touched == true && pixelMode == true{
            let pixel = SKSpriteNode(imageNamed: "Red")
            pixel.name = "Pixel"
            pixel.size = CGSize(width: pixel.size.width * 2, height: pixel.size.height * 2)
            pixel.position = location
            pixel.zPosition = -2
            pixel.physicsBody = SKPhysicsBody(circleOfRadius: pixel.size.width/2)
            pixel.physicsBody?.affectedByGravity = false
            pixel.physicsBody?.allowsRotation = false
            pixel.physicsBody?.dynamic = true
            addChild(pixel)
            if pixel.position.y <= -227 && pixel.position.y >= -327 && pixel.position.x >= -150 && pixel.position.x <= 150 {
                pixel.removeFromParent()
            }
        }
    }

    func bluePixels() {
        if touched == true && pixelMode == true{
            let bluepixel = SKSpriteNode(imageNamed: "Blue")
            bluepixel.size = CGSize(width: bluepixel.size.width * 2, height: bluepixel.size.height * 2)
            bluepixel.name = "Pixel"
            bluepixel.position = location
            bluepixel.zPosition = -2
            addChild(bluepixel)
            bluepixel.physicsBody = SKPhysicsBody(circleOfRadius: bluepixel.size.width/2)
            bluepixel.physicsBody?.affectedByGravity = true
            bluepixel.physicsBody?.allowsRotation = true
            bluepixel.physicsBody?.dynamic = true

            if bluepixel.position.y <= -227 && bluepixel.position.y >= -327 && bluepixel.position.x >= -150 && bluepixel.position.x <= 150 {
                bluepixel.removeFromParent()
            }

        }
    }

    func greenPixels() {
        if touched == true && pixelMode == true{
            let pixel = SKSpriteNode(imageNamed: "Green")
            pixel.name = "Pixel"
            pixel.size = CGSize(width: pixel.size.width * 2, height: pixel.size.height * 2)
            pixel.position = location
            pixel.zPosition = -2
            pixel.physicsBody = SKPhysicsBody(circleOfRadius: pixel.size.width/2)
            pixel.physicsBody?.affectedByGravity = false
            pixel.physicsBody?.allowsRotation = false
            pixel.physicsBody?.dynamic = false

            addChild(pixel)


            if pixel.position.y <= -227 && pixel.position.y >= -327 && pixel.position.x >= -150 && pixel.position.x <= 150 {
                pixel.removeFromParent()
            }

        }
    }

    func purplePixels() {
        if touched == true {
            let pixel = SKSpriteNode(imageNamed: "Purple")
            pixel.name = "Pixel"
            pixel.size = CGSize(width: pixel.size.width * 2, height: pixel.size.height * 2)
            pixel.position = location
            pixel.zPosition = -2
            pixel.physicsBody = SKPhysicsBody(circleOfRadius: pixel.size.width/2)
            pixel.physicsBody?.affectedByGravity = false
            pixel.physicsBody?.dynamic = false
            pixel.physicsBody?.allowsRotation = false
            let gravField = SKFieldNode.radialGravityField()
            gravField.physicsBody = SKPhysicsBody(circleOfRadius: pixel.size.width/2)
            gravField.physicsBody?.affectedByGravity = false
            gravField.physicsBody?.allowsRotation = false
            gravField.physicsBody?.dynamic = false
            gravField.position = pixel.position
            if pixel.position.y < -240 {
                pixel.removeFromParent()
                gravField.removeFromParent()
            }

            addChild(gravField)
            addChild(pixel)

            if pixel.position.y <= -227 && pixel.position.y >= -327 && pixel.position.x >= -150 && pixel.position.x <= 150 {
                pixel.removeFromParent()
                gravField.removeFromParent()
            }


        }
    }
}
