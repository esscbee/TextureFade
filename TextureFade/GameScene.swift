//
//  GameScene.swift
//  TextureFade
//
//  Created by Stephen Brennan on 8/4/16.
//  Copyright (c) 2016 Stephen Brennan. All rights reserved.
//

import SpriteKit


let textureNames = ["IMG_2859",
                    "IMG_2879",
                    "IMG_2903",
                    "IMG_2906",
                    "IMG_2907",
                    "IMG_2925",
                    "IMG_2953",
                    "IMG_2963",
                    "IMG_2967",
                    "IMG_2969",
                    "IMG_2977",
                    "IMG_2980",
                    "IMG_2992",
                    "IMG_2996",
                    "IMG_2998",
                    "IMG_3000",
                    "IMG_3007",
                    "IMG_3008",
                    "IMG_7901 - Version 2",
                    "IMG_7902",
                    "IMG_8261",]

class GameScene: SKScene {
    var textureCount = 0
    var sprite : SKSpriteNode?
    override func didMoveToView(view: SKView) {
        nextSprite()
    }
    
    func nextSprite() {
        let thisTexture = textureNames[textureCount % textureNames.count]
        textureCount += 1
        let oldSprite = sprite
        let s = SKSpriteNode(imageNamed: thisTexture)
        // scale image to fit
        if frame.width < frame.height {
            let r = s.size.width / frame.width
            s.size = CGSizeMake(frame.width, s.size.height / r)
        } else {
            let r = s.size.height / frame.height
            s.size = CGSizeMake(s.size.width / r, frame.size.height)
        }
        s.position = CGPointMake(self.frame.midX, self.frame.midY)
        s.alpha = 0.0
        sprite = s
        let duration = 3.0
        let fadeIn = SKAction.fadeInWithDuration(duration)
        let fadeOut = SKAction.fadeOutWithDuration(duration)
        let removeOld = SKAction.runBlock({
            oldSprite?.removeFromParent()
            self.nextSprite()
        })
        let seq = SKAction.sequence([ fadeIn, removeOld ])
        if let os = oldSprite {
            os.runAction(fadeOut)
        }
        addChild(s)
        s.runAction(seq)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
         }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
