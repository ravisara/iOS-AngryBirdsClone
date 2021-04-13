//
//  GameScene.swift
//  AngryBirdsClone
//
//  Created by StarChanger on 09/03/2021.
//

import SpriteKit
import GameplayKit

// TODO perhaps after the course is completed(imporovements beyond the course):
//      fix the issue with the bird disappearing when it is dragged out of the frame
//      make the orientation of the bird correct when the game is started
//      make sure I play with the bit masks and really understand how it works.
//      Implement a highscores function where the highest score so far is retained
//      Investigate why the bird couldn't be dragged in the opposite direction to where it is normally dragged.
//      Get the boxes to return to their original position after a game is over.
//      Show "Game Over" and show a countdown before resetting.

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var angryBird = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    var hasGameStarted: Bool = false
    var startPointOfBirdCG: CGPoint?
    
    enum ColliderType: UInt32 {
        case bird = 1 // 00000000000000000000000000000001 - for a deeper understanding(this is how I believe the 4 bytes are set.
        case box = 2  // 00000000000000000000000000000010
    }
    
    var score: Int = 0
    let scoreLabel = SKLabelNode()
        
    override func didMove(to view: SKView) {

        // Scene related
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        physicsWorld.contactDelegate = self
        
        // Score label
        scoreLabel.text = String(score)
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 60
        scoreLabel.position = CGPoint(x: 0, y: self.frame.height / 4)
        scoreLabel.zPosition = 2 // So that the label appears in front of everthing else
        self.addChild(scoreLabel)
        
        // Bird
        angryBird =  childNode(withName: "bird") as! SKSpriteNode
        let physicsBodyOfBird = SKPhysicsBody(circleOfRadius: angryBird.size.height / 3)
        physicsBodyOfBird.affectedByGravity = false
        physicsBodyOfBird.isDynamic = true
        physicsBodyOfBird.mass = 0.2
        angryBird.physicsBody = physicsBodyOfBird
        startPointOfBirdCG = angryBird.position
        
        angryBird.physicsBody?.categoryBitMask = ColliderType.bird.rawValue // Excellent explaination: https://stackoverflow.com/a/40596890/12247532
        angryBird.physicsBody?.collisionBitMask = ColliderType.box.rawValue
        angryBird.physicsBody?.contactTestBitMask = ColliderType.bird.rawValue
        
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
        //box1.physicsBody?.categoryBitMask = ColliderType.box.rawValue
        box1.physicsBody?.collisionBitMask = ColliderType.bird.rawValue
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.mass = 0.4
        //box2.physicsBody?.categoryBitMask = ColliderType.box.rawValue
        box2.physicsBody?.collisionBitMask = ColliderType.bird.rawValue
        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.mass = 0.4
        //box3.physicsBody?.categoryBitMask = ColliderType.box.rawValue
        box3.physicsBody?.collisionBitMask = ColliderType.bird.rawValue
        
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.mass = 0.4
        //box4.physicsBody?.categoryBitMask = ColliderType.box.rawValue
        box4.physicsBody?.collisionBitMask = ColliderType.bird.rawValue
        
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.mass = 0.4
        //box5.physicsBody?.categoryBitMask = ColliderType.box.rawValue
        box5.physicsBody?.collisionBitMask = ColliderType.bird.rawValue
                
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    // Although in the course it says that you have to have this same code block in this method and the touchesMoved method, I've found that the functionality remains the same if this code in this method is totally removed and just the code in touchesMoved is left. When the reverse was done - leaving just this code and deleting code in touchesmoved, the bird was only moving a bit everytime a new touch was done on a point on the bird(possibly away from the center).
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        if hasGameStarted == false {
            
            if let firstTouch = touches.first {
                
                let pointOfTouchCG = firstTouch.location(in: self)
                
                let nodesAtTouchSK = nodes(at: pointOfTouchCG)
                
                if nodesAtTouchSK.isEmpty == false {
                    
                    for currentNode in nodesAtTouchSK {
                        if let currentSpriteNode = currentNode as? SKSpriteNode {
                            if currentSpriteNode == angryBird {
                                angryBird.position = pointOfTouchCG
                            }
                        }
                    }
                    
                }
                
            }
            
        }

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if hasGameStarted == false {
            
            if let firstTouch = touches.first {
                
                let pointOfTouchCG = firstTouch.location(in: self)
                
                let nodesAtTouchSK = nodes(at: pointOfTouchCG)
                
                if nodesAtTouchSK.isEmpty == false {
                    
                    for currentNode in nodesAtTouchSK {
                        
                        if let currentSpriteNode = currentNode as? SKSpriteNode {
                            if currentSpriteNode == angryBird {
                                angryBird.position = pointOfTouchCG
                            }
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if hasGameStarted == false {
            
            if let lastTouch = touches.first { // I know, it doesn't make much sense to call this the lastTouch as the first one is used but, couldn't find a convenient way to access the last one.
                
                let endPointOfBirdTouchCG = lastTouch.location(in: self)
                let xAxisMovedDistance = -(endPointOfBirdTouchCG.x - startPointOfBirdCG!.x) // as we want to apply the impulse in the reverse direction of the stretch, it is multiplied by -1
                let yAxisMovedDistance = -(endPointOfBirdTouchCG.y - startPointOfBirdCG!.y) // ditto
                let birdStrectchVector = CGVector(dx: xAxisMovedDistance, dy: yAxisMovedDistance)
                angryBird.physicsBody?.applyImpulse(birdStrectchVector)
                angryBird.physicsBody?.affectedByGravity = true
                hasGameStarted = true
                
            }
            
        }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.collisionBitMask == ColliderType.bird.rawValue || contact.bodyB.collisionBitMask == ColliderType.bird.rawValue {
            print("A box and the bird made contact")
            score += 1
            scoreLabel.text = String(score)
        }
    
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        // Called before each frame is rendered
        if let birdPhysicsBody = angryBird.physicsBody {
            
            if hasGameStarted == true && birdPhysicsBody.velocity.dx <= 0.1 && birdPhysicsBody.velocity.dy <= 0.1 && birdPhysicsBody.angularVelocity <= 0.1 { // Aparently, according to Physics, angular velocity is something like the velocity of rotation
                
                birdPhysicsBody.velocity = CGVector(dx: 0, dy: 0)
                birdPhysicsBody.angularVelocity = 0
                angryBird.zPosition = 1
                angryBird.position = startPointOfBirdCG!
                birdPhysicsBody.affectedByGravity = false
                score = 0
                scoreLabel.text = String(score)
                hasGameStarted = false
                
            }
            
        }
    }
    
}
