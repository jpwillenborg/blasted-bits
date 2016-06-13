package  {
	
	import flash.utils.*;
	import starling.display.Stage;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	
	
	public class Pad extends Sprite {
		
		public var pad = this;
		public var color:uint;
		public var padSprite:Sprite;
		public var padBase:Image;
		public var plunger:Image;
		public var meterBackground:Image;
		public var meterBar:Image;
		
		
		public function Pad(color:uint) {
			this.color = color;			
			
			padSprite = new Sprite;
			pad.addChild(padSprite);
			
			plunger = Atlas.generate("filler");
			plunger.width = 64;
			plunger.height = 24;
			plunger.x = 32;
			plunger.y = 0;
			plunger.color = color;
			padSprite.addChild(plunger);
			
			padBase = Atlas.generate("filler");
			padBase.width = 128;
			padBase.height = 32;
			padBase.y = 12;
			padBase.color = 0x464646;
			padSprite.addChild(padBase);
			
			meterBackground = Atlas.generate("filler");
			meterBackground.width = 108;
			meterBackground.height = 10;
			meterBackground.x = 10;
			meterBackground.y = 23;
			meterBackground.color = 0x313131;
			padSprite.addChild(meterBackground);
			
			meterBar = Atlas.generate("filler");
			meterBar.width = 0;
			meterBar.height = 10;
			meterBar.x = 10;
			meterBar.y = 23;
			meterBar.color = color;
			padSprite.addChild(meterBar);
		}
		
		
		public function updateMeter() {
			meterBar.width += 10;
			if (meterBar.width >= 108) {
				meterBar.width = 108;
				//Board.goButton.removeEventListener(TouchEvent.TOUCH, Board.onTouch);
			}
		}
		
		
		public function pushPlunger() {
			plunger.y += 7;
			
			var pushInt:int = setInterval(push, 90);
			function push() {
				clearInterval(pushInt);
				plunger.y -= 7;
			}
		}
	}
}
