//
//  GameScene.swift
//  DrawnLevels
//
//  Created by Jalen Moore on 6/21/16.
//  Copyright (c) 2016 Jalen Moore. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        background.position = anchorPoint
        addChild(background)
        addChild(title)
        title.position = anchorPoint
        startButton.position = CGPoint(x: anchorPoint.x, y: anchorPoint.y - 180)
        addChild(startButton)
        self.camera = startCam
        startCam.position = CGPoint(x: anchorPoint.x, y: anchorPoint.y)
    }
    
    let startCam = SKCameraNode()
    let startButton = SKSpriteNode(imageNamed: "Start Button")
    let title = SKLabelNode(text: "Physics Drawing")
    let background = SKSpriteNode(imageNamed: "Blue Background")
    
    var location = CGPointMake(0, 0)
    
    func loadScene(scene: SKScene) {
        let gameScene = scene
        let transition = SKTransition.fadeWithDuration(1.0)
        gameScene.scaleMode = SKSceneScaleMode.AspectFill
        self.scene!.view?.presentScene(gameScene, transition: transition)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            location = touch.locationInNode(self)
            if startButton.containsPoint(location) {
                loadScene(PlayScene(size: self.size))
            }
        }
    }
}