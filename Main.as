package 
{
	import com.bit101.components.Label;
	import com.bit101.components.PushButton;
	import com.dj.utils.DJTimer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author David Lai
	 */
	public class Main extends Sprite	{
		
		private var mySp:Sprite;
		private var myDJTimer:DJTimer;
		private var myDJTimerComplete:DJTimer;
		
		private var myLabel:Label;
		private var completeLabel:Label;
		private var count:int;
		
		
		
		
		public function Main() {
			this.init();
		}
		
		
		
		private function init():void {
			
			this.mySp = new Sprite();
			this.addChild(this.mySp);
			this.mySp.x = 75;
			this.mySp.y = 75;
			
			
			//
			// DJTimer, it calls DJTimer Handler every delay time.
			//
			this.createButton(0, 0, "TIMER  START", this.DJTimerHandler);
			this.myLabel = new Label(this.mySp, 15, 50, "TIMER  COUNT");
			this.createButton(0, 100, "TIMER  STOP", this.stopMyDJTimer);
			this.createButton(0, 150, "TIMER  RESTART", this.restartMyDJTimer);
			
			//
			// DJTimerComplete
			//
			this.createButton(150, 0, "Complete  START", this.DJTimerCompleteHandler);
			this.completeLabel = new Label(this.mySp, 155, 50, "COMPLETE: ");
			this.createButton(150, 100, "Complete  STOP", this.stopMyDJTimerComplete);
			this.createButton(150, 150, "Complete  RESTART", this.restartMyDJTimerComplete);
		}
		
		private function createButton(x:Number, y:Number, label:String, handler:Function):void {
			var pushBtn:PushButton = new PushButton(this.mySp, x, y, label, handler);
		}
		
		
		
		
		
		//
		//
		//
		private function DJTimerHandler(e:MouseEvent):void {
			if (this.myDJTimer == null) {
				//
				// ONE LINE CODE
				//
				this.myDJTimer = new DJTimer(this.myDJTimerHandler, null, null, null, 1000, 10);
			}else {
				this.myDJTimer.start();
			}
		}
		
		//
		// DJTimer Handler
		//
		private function myDJTimerHandler():void {
			this.count ++;
			this.myLabel.text = String(this.count);
			if (this.count == 10) {
				this.myLabel.text = "Time's up!"
			}
		}
		
		//
		// STOP TIMER, AS USUAL
		//
		private function stopMyDJTimer(e:MouseEvent):void {
			this.myDJTimer.stop();
		}
		
		//
		// RESTART, AS USUAL
		//
		private function restartMyDJTimer(e:MouseEvent):void {
			this.myDJTimer.reset();
			this.count = 0;
			this.myLabel.text = String(this.count);
		}
		
		
		
		
		
		
		//
		//
		//
		private function DJTimerCompleteHandler(e:MouseEvent):void {
			if (this.myDJTimerComplete == null) {
				//
				// ONE LINE CODE
				//
				this.myDJTimerComplete = new DJTimer(null, null, this.myDJTimerCompleteHandler, true, 3000, 1);
			}else {
				this.myDJTimerComplete.start();
			}
			
		}
		
		//
		//
		//
		private function myDJTimerCompleteHandler(_flag:*):void {
			if (_flag) {
				var circle:MovieClip = new Circle();
				this.mySp.addChild(circle);
				circle.x = 225;
				circle.y = 55;
			}
		}
		
		//
		// STOP TIMER, AS USUAL
		//
		private function stopMyDJTimerComplete(e:MouseEvent):void {
			this.myDJTimerComplete.stop();
		}
		
		//
		// RESTART, AS USUAL
		//
		private function restartMyDJTimerComplete(e:MouseEvent):void {
			this.myDJTimerComplete.reset();
		}
		
		
	}
	
}