//
//  PlayScene.swift
//  DrawnLevels
//
//  Created by Jalen Moore on 6/21/16.
//  Copyright © 2016 Jalen Moore. All rights reserved.
//

import SpriteKit
import UIKit

//extension SKNode {
//    subscript (name: String) -> [SKNode] { get }
//}

class PlayScene: Pixels {

    func DetectButton() {
        if blackButton.containsPoint(location) {
            pixelColor = "Black"
        }
        if redButton.containsPoint(location) {
            pixelColor = "Red"
        }
        if blueButton.containsPoint(location) {
            pixelColor = "Blue"
        }
        if purpleButton.containsPoint(location) {
            pixelColor = "Purple"
        }
        if greenButton.containsPoint(location) {
            pixelColor = "Green"
        }
        if  yellowButton.containsPoint(location) {
            loadScene(PlayScene(size: self.size))
        }
        if eraser.containsPoint(location) {
            pixelColor = "Eraser"
        }
        if pixelColor == "Eraser" {
            erase()
        }
    }

    let blackButton = SKSpriteNode(imageNamed: "Draw Pixels")
    let blueButton = SKSpriteNode(imageNamed: "Blue Pixel")
    let redButton = SKSpriteNode(imageNamed: "Red Pixel")
    let yellowButton = SKSpriteNode(imageNamed: "Yellow Pixel")
    let greenButton = SKSpriteNode(imageNamed: "Green Pixel")
    let purpleButton = SKSpriteNode(imageNamed: "Purple Pixel")
    let eraser = SKSpriteNode(imageNamed: "Eraser")
    let greyButtonback = SKSpriteNode(imageNamed: "greyBackground")

    func Spawn() {

        blackButton.position = CGPoint(x: anchorPoint.x, y: anchorPoint.y - 300)
        blackButton.size = CGSize(width: blackButton.size.width * 7, height: blackButton.size.height * 4)
        addChild(blackButton)
        redButton.position = CGPoint(x: blackButton.position.x + 50, y: blackButton.position.y)
        redButton.size = blackButton.size
        addChild(redButton)
        greenButton.position = CGPoint(x: blackButton.position.x - 50, y: blackButton.position.y)
        greenButton.size = blackButton.size
        addChild(greenButton)
        purpleButton.position = CGPoint(x: blackButton.position.x - 100, y: blackButton.position.y)
        purpleButton.size = blackButton.size
        addChild(purpleButton)
        blueButton.position = CGPoint(x: blackButton.position.x + 100, y: blackButton.position.y)
        blueButton.size = blackButton.size
        addChild(blueButton)
        yellowButton.position = CGPoint(x: blackButton.position.x, y: blackButton.position.y + 50)
        yellowButton.size = blackButton.size
        addChild(yellowButton)
        eraser.position = CGPoint(x: blackButton.position.x - 100, y: blackButton.position.y + 50)
        eraser.size = blackButton.size
        addChild(eraser)


        greyButtonback.position = CGPoint(x: anchorPoint.x, y: anchorPoint.y - 277)
        greyButtonback.zPosition = -1
        greyButtonback.size = CGSize(width: greyButtonback.size.width * 6, height: greyButtonback.size.height * 4)
        greyButtonback.physicsBody = SKPhysicsBody(rectangleOfSize: greyButtonback.size)
        greyButtonback.physicsBody?.affectedByGravity = false
        greyButtonback.physicsBody?.dynamic = false
        greyButtonback.physicsBody?.allowsRotation = false
        greyButtonback.physicsBody?.contactTestBitMask = 1
        addChild(greyButtonback)
    }

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        physicsWorld.contactDelegate = self
        backgroundColor = UIColor.whiteColor()

        Spawn()

        self.camera = cam
    }
    
    let permanentTrigger:Bool = true
    
    let cam = SKCameraNode()
    //
    
    var pixelColor: String = "Black"
    
    //
    
    func loadScene(scene: SKScene) {
        let gameScene = scene
        let transition = SKTransition.fadeWithDuration(1.0)
        gameScene.scaleMode = SKSceneScaleMode.AspectFill
        self.scene!.view?.presentScene(gameScene, transition: transition)
        
    }
    
    func erase() {
        if touched == true && pixelMode == true{
            for node in self.nodesAtPoint(location) {
                if node.name == "Pixel" {
                    node.removeFromParent()
                }
            }
        }
    }

    var holdColor: String = ""

    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if motion == .MotionShake {
            if pixelColor == "Shake" {
                pixelColor = holdColor
            }
            if pixelColor != "Shake" {
                holdColor = pixelColor
                pixelColor = "Shake"
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        for touch in touches {
            touched = true
            location = touch.locationInNode(self)
            DetectButton()

        }
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            location = touch.locationInNode(self)
            if pixelColor == "Eraser" {
                erase()
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            touched = false
            if pixelColor == "Eraser" {
                erase()
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        cam.position = CGPoint(x: blackButton.position.x - 300, y: blackButton.position.y + 300)
        if pixelColor == "Black" {
            blackPixels()
        }
        if pixelColor == "Blue" {
            bluePixels()
        }
        if pixelColor == "Red" {
            redPixels()
        }
        if pixelColor == "Purple" {
            purplePixels()
        }
        if pixelColor == "Green" {
            greenPixels()
        }
        if pixelColor == "Shake" {

        }
    
    }
}


/* 
 
 let Field = SKFieldNode.vortexField()
 Field.physicsBody = SKPhysicsBody(rectangleOfSize: pixel.size)
 Field.physicsBody?.affectedByGravity = false
 Field.physicsBody?.allowsRotation = false
 Field.physicsBody?.dynamic = false
 Field.physicsBody?.categoryBitMask = pixelCategory
 Field.physicsBody?.collisionBitMask = buttonCategory
 Field.physicsBody?.contactTestBitMask = buttonCategory
 Field.position = pixel.position
 
 */