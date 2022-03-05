import GameplayKit
import SpriteKit

class Island : GameObject
{
    
    // constructor / initializer
    init()
    {
        super.init(imageString: "island", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func CheckBounds()
    {
        if(position.x <= -650)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.x = 640
        // get a pseudo random number -320 to 320
        let randomX:Int = (randomSource?.nextInt(upperBound: 640))! - 320
        position.y = CGFloat(randomX)
        isCollding = false
    }
    
    // initialization
    override func Start()
    {
        Reset()
        zPosition = 1
        verticalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        position.x -= verticalSpeed!
    }
}
