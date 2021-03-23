//
//  GameScene.swift
//  AngryBirdsClone
//
//  Created by StarChanger on 09/03/2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var angryBird = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
        
    override func didMove(to view: SKView) {
        
//        let textureToUse = SKTexture(imageNamed: "bird")
//        bird2 = SKSpriteNode(texture: textureToUse)
//        bird2.position = CGPoint(x: 0, y: 0)
//        bird2.zPosition = 1
//        bird2.size = CGSize(width: 300, height: 300)
//        bird2.position = CGPoint(x: -view.frame.width / 2, y: -view.frame.height / 3)
//        bird2.size = CGSize(width: view.frame.width / 7, height: view.frame.height / 5)
//        self.addChild(bird2)
        
        // Scene related
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        
        // Bird
        angryBird =  childNode(withName: "bird") as! SKSpriteNode
        let physicsBodyOfBird = SKPhysicsBody(circleOfRadius: angryBird.size.height / 3)
        physicsBodyOfBird.affectedByGravity = false
        physicsBodyOfBird.isDynamic = true
        physicsBodyOfBird.mass = 0.2
        angryBird.physicsBody = physicsBodyOfBird
        
        // Boxes
        let pbWidthAdjuster: Float = 8
        let pbHeightAdjuster = 8
        let textureForAllBoxes = SKTexture(imageNamed: "brick")
        let boxSize = CGSize(width: textureForAllBoxes.size().width/CGFloat(pbWidthAdjuster), height: textureForAllBoxes.size().height/CGFloat(pbHeightAdjuster))
        
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.affectedByGravity = true
        box1.physicsBody?.mass = 0.4
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.mass = 0.4
        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.mass = 0.4
        
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.mass = 0.4
        
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.mass = 0.4
                
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        angryBird.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 100))
        angryBird.physicsBody?.affectedByGravity = true

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
