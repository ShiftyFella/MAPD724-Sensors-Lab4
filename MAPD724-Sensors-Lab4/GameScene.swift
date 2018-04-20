//
//  GameScene.swift
//  MAPD724-Sensors-Lab4
//
//  Created by Viktor Bilyk on 2018-04-19.
//  Copyright © 2018 Brogrammers. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    
    private var nodeTest: SKSpriteNode?
    private var motionManager = CMMotionManager()
    
    override func didMove(to view: SKView) {
        nodeTest = SKSpriteNode(imageNamed: "8B")
        nodeTest?.position = CGPoint.zero
        
        self.addChild(nodeTest!)
        
        if (motionManager.isDeviceMotionAvailable) {
        motionManager.deviceMotionUpdateInterval = 1 / 60.0
        
        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!) { (data, error) in
            if let myUpdate = data?.gravity {
                let rotation = atan2(myUpdate.x, myUpdate.y) + Double.pi/2
                let range = SKRange.init(constantValue: CGFloat(rotation))
                self.nodeTest?.constraints = [SKConstraint.orient(to: CGPoint.zero, offset: range)]
            }
            }
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
      
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
