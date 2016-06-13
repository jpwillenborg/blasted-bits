package  {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class Bullet extends Sprite {
		
		private var bullet = this;
		public var color:uint;
		
		
		public function Bullet(cannon:Cannon, color:uint) {
			this.color = color;			
			bullet.addChild(Atlas.generate("filler") as Image);
			bullet.width = cannon.width;
			bullet.height = cannon.width;
			bullet.x = cannon.x;
			bullet.y = cannon.y + cannon.height - cannon.width;
			bullet.getChildAt(0).color = color;				
			addEventListener(Event.ENTER_FRAME, move);
		}
		
		
		public function move(evt:Event) {
			bullet.y += 8;
			Board.check(bullet);
		}
		
		
		public function shatter() {
			removeEventListener(Event.ENTER_FRAME, move);
			
			var w:int = bullet.width;
			bullet.removeChildAt(0);
			
			var s1:Image = Atlas.generate("filler");
			s1.width = w/2;
			s1.height = w/2;
			s1.x = 0;
			s1.y = 0;
			s1.color = color;
			bullet.addChild(s1);
			
			var s2:Image = Atlas.generate("filler");
			s2.width = w/2;
			s2.height = w/2;
			s2.x = w/2;
			s2.y = 0;
			s2.color = color;
			bullet.addChild(s2);
			
			var s3:Image = Atlas.generate("filler");
			s3.width = w/2;
			s3.height = w/2;
			s3.x = 0;
			s3.y = w/2;
			s3.color = color;
			bullet.addChild(s3);
			
			var s4:Image = Atlas.generate("filler");
			s4.width = w/2;
			s4.height = w/2;
			s4.x = w/2;
			s4.y = w/2;
			s4.color = color;
			bullet.addChild(s4);
			
			bullet.width = w;
			bullet.height = w;
			
			var moveSpeed:int = 4;
			var alphaSpeed:Number = 0.055;
			
			addEventListener(Event.ENTER_FRAME, shatterMove);
			function shatterMove(evt:Event):void {
				s1.x -= moveSpeed * 0.5;
				s1.y -= moveSpeed * 1.25;
				s1.alpha -= alphaSpeed;
				
				s2.x += moveSpeed * 0.5;
				s2.y -= moveSpeed * 1.25;
				s2.alpha -= alphaSpeed;
				
				s3.x -= moveSpeed;
				s3.y -= moveSpeed;
				s3.alpha -= alphaSpeed;
				
				s4.x += moveSpeed;
				s4.y -= moveSpeed;
				s4.alpha -= alphaSpeed;
				
				if (s1.alpha <= 0) {
					removeEventListener(Event.ENTER_FRAME, shatterMove);
					destroy();
				}
			}
		}
		
		
		public function destroy() {
			removeEventListener(Event.ENTER_FRAME, move);
			parent.removeChild(this);
			this.dispose();
		}
	}
}
