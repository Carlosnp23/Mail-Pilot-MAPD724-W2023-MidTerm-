import GameplayKit
import SpriteKit

class Island : GameObject
{
    // initializer / constructor
    init()
    {
        super.init(imageString: "island", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func Start()
    {
        zPosition = Layer.island.rawValue
        horizontalSpeed = 3.0
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.x <= -376)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.x = 476
        // get a pseudo random number
        let randomX:Int = (randomSource?.nextInt(upperBound: 426))! - 213
        position.y = CGFloat(randomX)
        isColliding = false
    }
    
    // public method
    func Move()
    {
        position.x -= horizontalSpeed!
    }
}
