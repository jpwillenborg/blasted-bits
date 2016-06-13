package  {
	
	import starling.display.Image;
	import starling.display.Stage;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.events.Event;
	
	
	public class Panels {
		
		static var topBar:Image;
		static var bottomBar:Image;
		static var bottomFrame:Image;
		
		
		static function setup(stage:Stage) {
			topBar = Atlas.generate("filler");
			topBar.width = 640;
			topBar.height = 128;
			topBar.color = 0x333333;
			Board.boardSprite.addChild(topBar);
			
			bottomBar = Atlas.generate("filler");
			bottomBar.width = 450;
			bottomBar.height = 192;
			bottomBar.y = 768;
			bottomBar.color = 0x333333;
			Board.boardSprite.addChild(bottomBar);
			
			bottomFrame = Atlas.generate("filler");
			bottomFrame.width = 192;
			bottomFrame.height = 192;
			bottomFrame.x = 448;
			bottomFrame.y = 768;
			bottomFrame.color = 0x383838;
			Board.boardSprite.addChild(bottomFrame);
		}
	}
}
