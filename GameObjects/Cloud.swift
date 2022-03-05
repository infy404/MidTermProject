import GameplayKit
import SpriteKit

class Cloud : GameObject
{
    
    // constructor / initializer
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func CheckBounds()
    {
        if(position.x <= -640)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        // randomize horizontal speed
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * -4.0) + 2.0
        
        // randomize vertical drift
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        
        
        // get a pseudo random number -660 to 660
        let randomX:Int = (randomSource?.nextInt(upperBound: 20))! + 640
        position.x = CGFloat(randomX)
        
        // get a pseudo random number -320 to -620
        let randomY:Int = (randomSource?.nextInt(upperBound: 640))! - 320
        position.y = CGFloat(randomY)
        
        isCollding = false
    }
    
    // initialization
    override func Start()
    {
        Reset()
        zPosition = 3
        alpha = 0.5 // 50% transparent
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        position.x -= horizontalSpeed!
        position.y -= verticalSpeed!
    }
}
