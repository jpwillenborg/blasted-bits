package  {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class Cannon extends Sprite {
		
		public var cannon = this;
		public var color:uint;
		public var cannonBase:Image;
		public var cannonBand:Image;
		
		
		public function Cannon(color:uint) {
			this.color = color;
			
			cannonBase = Atlas.generate("filler");
			cannonBase.width = 32;
			cannonBase.height = 64;
			cannonBase.x = 0;
			cannonBase.y = 0;
			cannonBase.color = 0x464646;
			addChild(cannonBase);
			
			cannonBand = Atlas.generate("filler");
			cannonBand.width = 32;
			cannonBand.height = 8;
			cannonBand.x = 0;
			cannonBand.y = 40;
			cannonBand.color = color;
			addChild(cannonBand);
		}
		
		
		public function fire() {
			var bullet:Bullet = new Bullet(this, color);
			Board.boardSprite.addChild(bullet);
			Board.boardSprite.setChildIndex(bullet, 1);
		}		
	}
}
