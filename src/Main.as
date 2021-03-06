﻿package {

	import flash.display.Bitmap;
	import starling.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;
	import starling.core.Starling;
	import starling.events.Event;	


	public class Main extends Sprite {

		private var viewPort:Rectangle;
		private var mainStarling:Starling;
		public static var screenWidth:uint;
		public static var screenHeight:uint;
		

		public function Main():void {
			
			// SET STAGE PROPERTIES
			stage.align = StageAlign.TOP_LEFT;
			stage.quality = StageQuality.HIGH;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			//Starling.handleLostContext = true;
			//Starling.multitouchEnabled = false;
			
			
			// SET RESOLUTION
			if ((flash.system.Capabilities.os.substr(0,1) == "W")) {
				screenWidth = stage.stageWidth;
				screenHeight = stage.stageHeight;
			} else {
				screenWidth = stage.fullScreenWidth;
				screenHeight = stage.fullScreenHeight;
			}
			
			
			// SET STARLING PROPERTIES
			viewPort = new Rectangle(0,0,screenWidth,screenHeight);
			mainStarling = new Starling(Game, stage, viewPort);
			mainStarling.antiAliasing = 1;
			mainStarling.showStats = true;
			mainStarling.enableErrorChecking = false;
			
			
			// SET LISTENERS
			mainStarling.addEventListener(starling.events.Event.ROOT_CREATED, onRootCreated);
			function onRootCreated(event:Object):void {
				mainStarling.removeEventListener(starling.events.Event.ROOT_CREATED, onRootCreated);
				mainStarling.start();
			}
		}
	}
}