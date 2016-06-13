package  {
	
	import flash.utils.*;
	import starling.display.Stage;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	
	
	public class Obstacle extends Sprite {
		
		public var obstacle = this;
		public var color:uint;
		public var direction:Boolean = true;
		public static var speed:int = 4;
		
		
		public function Obstacle(color:uint) {
			this.color = color;			
			addChild(Atlas.generate("filler") as Image);
			obstacle.width = 128;
			obstacle.height = 32;
			obstacle.getChildAt(0).color = color;				
			addEventListener(Event.ENTER_FRAME, move);
		}
		
		
		public function move(evt:Event) {
			
			if (direction) {
				obstacle.x += speed;
				if (obstacle.x >= Main.screenWidth - obstacle.width) {
					obstacle.x = Main.screenWidth - obstacle.width;
					direction = false;
				}
			} else 
			
			if (!direction) {
				obstacle.x -= speed;
				if (obstacle.x <= 0) {
					obstacle.x = 0;
					direction = true;
				}
			}
		}
	}
}
