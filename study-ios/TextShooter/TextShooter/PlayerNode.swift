//
//  PlayerNode.swift
//  TextShooter
//
//  Created by yang on 2019/4/23.
//  Copyright © 2019 yang. All rights reserved.
//

import UIKit
import SpriteKit

class PlayerNode: SKNode {
    
    override init() {
        super.init()
        name = "player \(self)"
        initNodeGraph()
        initPhysicsBody()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func initNodeGraph() {
        let label = SKLabelNode(fontNamed: "Courier")
        label.fontColor = SKColor.black
        label.fontSize = 40
        label.name = "label"
        label.text = "V"
        label.zRotation = CGFloat(Float.pi)
        self.addChild(label)
    }
    
    private func initPhysicsBody() {
        let body = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 20))
        body.affectedByGravity = false
        body.categoryBitMask = PlayerCategory
        body.contactTestBitMask = EnemyCategory
        body.collisionBitMask = 0
        body.fieldBitMask = 0
        physicsBody = body
    }
    
    func moveToward(_ location: CGPoint) {
        removeAction(forKey: "movement")
        removeAction(forKey: "wobbling")
        
        let distance = pointDistance(position, location)
        let screenWidth = UIScreen.main.bounds.size.width
        let duration = TimeInterval(2 * distance / screenWidth)
        
        run(SKAction.move(to: location, duration: duration), withKey: "movement")
        
        let wobbleTime = 0.3
        let halfWobbleTime = wobbleTime / 2
        let wobbling = SKAction.sequence([SKAction.scaleX(to: 0.2, duration: halfWobbleTime), SKAction.scaleX(to: 1.0, duration: halfWobbleTime)])
        let wobbleCount = Int(duration / wobbleTime)
        run(SKAction.repeat(wobbling, count: wobbleCount), withKey: "wobbling")
    }
}
