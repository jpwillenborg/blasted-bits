package {
	
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class Game extends Sprite {

		public static var stageRef:Stage;
		
		
		public function Game():void{
			addEventListener(Event.ADDED_TO_STAGE, start);
		}
		
		
		private function start(evt:Event):void {
			stageRef = stage;
			
			// ADD LOADING INFO TO MAIN?
			Environment.setup(stage);
			
			// ADD LOADING INFO TO MAIN?
			Board.setup(stage);
			
			removeEventListener(Event.ADDED_TO_STAGE, start);
		}
	}
}
