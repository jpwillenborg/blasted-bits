package  {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	
	
	public class Environment {
		
		public static var stageRef:Stage;
		
		
		static function setup(stage:Stage):void {
			
			// SETUP TEXTURE ATLAS
			Atlas.setup();
			
			
			// SETUP SAVE FILE
			//Data.setup();
			
			
			// SETUP AUDIO
			//Audio.setup();
			
			
			// CHECK VIBRATION
			//Vibrate.check();
			
		}
	}
}
