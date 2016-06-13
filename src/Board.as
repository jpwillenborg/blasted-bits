package  {
	
	import starling.display.Image;
	import starling.display.Stage;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.events.Event;
	
	
	public class Board {
		
		static var boardSprite:Sprite;
		static var blueCannon:Cannon;
		static var bluePad:Pad;
		static var obstacle1:Obstacle;
		static var goButton:Image;
		
		
		static function setup(stage:Stage) {
			
			// GAME BOARD
			boardSprite = new Sprite;
			stage.addChild(boardSprite);
			
			
			// PANELS			
			Panels.setup(stage);
			
			
			// GO BUTTON
			goButton = Atlas.generate("go button");
			goButton.x = 480;
			goButton.y = 800;
			boardSprite.addChild(goButton);
			
			
			// CANNONS
			blueCannon = new Cannon(0x00CCFF);
			blueCannon.x = 304;
			blueCannon.y = 128;
			boardSprite.addChild(blueCannon);
			
			
			// PADS
			bluePad = new Pad(0x00CCFF);
			bluePad.x = 256;
			bluePad.y = 724;
			boardSprite.addChild(bluePad);
			
			
			// OBSTACLES
			obstacle1 = new Obstacle(0x686868);
			obstacle1.x = Main.screenWidth/2 - obstacle1.width/2;
			obstacle1.y = Main.screenHeight/2 - obstacle1.height/2;
			boardSprite.addChild(obstacle1);
			
			
			// EVENT LISTENERS
			goButton.addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		
		static function onTouch(evt:TouchEvent):void {
			var touch:Touch = evt.getTouch(Game.stageRef);
			if (touch) {
				if (touch.phase == TouchPhase.BEGAN) {
					blueCannon.fire();
				}
			}
		}
		
		
		static function check(bullet:Bullet) {
			if (bullet.getBounds(bullet.parent).intersects(bluePad.plunger.getBounds(bluePad.parent))) {
				bluePad.pushPlunger();
				bullet.shatter();
				bluePad.updateMeter();
				//bullet.destroy();
			}
			
			if (bullet.getBounds(bullet.parent).intersects(obstacle1.getBounds(obstacle1.parent))) {
				bullet.shatter();
				//bullet.destroy();
			}
		}
	}
}
