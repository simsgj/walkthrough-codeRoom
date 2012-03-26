package  {
	
	import com.greensock.*;
	import com.greensock.easing.*;
	import com.greensock.events.*;
	import com.greensock.plugins.*;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	public class s44jr_walkthrough_CodeRoom extends MovieClip{
		
		TweenPlugin.activate([FrameForwardPlugin]);
		
		private var area1:WelcomeArea = new WelcomeArea;
		private var area1Foreground:WelcomeArea_Foreground = new WelcomeArea_Foreground;
		
		private var area2:ListeningZone = new ListeningZone;
		private var area2Foreground:ListeningZone_Foreground = new ListeningZone_Foreground;
		
		private var area3:SoundZone = new SoundZone;
		private var area3Foreground:SoundZone_Foreground = new SoundZone_Foreground;
		
		
		private var area4:WordZone = new WordZone;
		private var area4Foreground:WordZone_Foreground = new WordZone_Foreground;
		
		private var area5:SpellingZone = new SpellingZone;
		private var area5Foreground:SpellingZone_Foreground = new SpellingZone_Foreground;
		
		private var area6:ReadingZone = new ReadingZone;
		private var area6Foreground:ReadingZone_Foreground = new ReadingZone_Foreground;
		
		private var colorAdjust1:ColorAdjust;
		
		private var cMatrixOffset:CMatrixOffset;
		
		private var beastie1:Abig = new Abig;
		private var beastie2:Asquid = new Asquid;
		private var beastie3:Atall = new Atall;
		private var beastie4:Afuzy = new Afuzy;
		private var beastie5:Avatar = new Avatar;
		
		private var areaArray:Array = new Array(area1,area2,area3,area4,area5,area6);
		
		private var areaForegroundArray:Array = new Array(area1Foreground,area2Foreground,area3Foreground,area4Foreground,area5Foreground,area6Foreground);
		
		private var beastieArray:Array = new Array(beastie1,beastie2,beastie3,beastie4,beastie5);
		
		private var marker:MovieClip = new MovieClip;
		private var marker2:MovieClip = new MovieClip;
		private var currentState:String = "state1";
		private var time:Number = 10;
		private var totalX:Number;
		
		private var tl:TimelineMax;
		private var area1tl:TimelineMax;
		private var tl2:TimelineMax;
		private var beastieReversed:Boolean = false;
		private var myTimer:Timer = new Timer(4000);
		
		private var beastieTl:TimelineMax; 
		private var beastie2Tl:TimelineMax; 
		private var beastie3Tl:TimelineMax;
		private var beastie4Tl:TimelineMax;
		private var beastie5Tl:TimelineMax;
		private var filterMc:MovieClip;
		
		private var beastieTlArray:Array;
		
		
		public function s44jr_walkthrough_CodeRoom()
		{
			addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, myKeyDown);
			myTimer.addEventListener(TimerEvent.TIMER, timerListener);
			init();
			
			
			for (var j:int = 0; j < areaArray.length; j++) 
			{
				
				areaForegroundArray[j].x = areaArray[j].foreground.x + areaArray[j].x;
				areaForegroundArray[j].y = areaArray[j].foreground.y + areaArray[j].y;
				areaForegroundArray[j].alpha = 1;
			}
		}
		
		private function init():void{
			
			//beastie5.gotoAndStop("last");
			myTimer.start();
			
			marker.x = 0;
			marker.y = 0;
			addChild(marker);
			
			marker2.x = marker.x +	area1.spacing.width;
			marker2.y = 0;
			addChild(marker2);
			
			
			for (var k:int = 0; k < areaArray.length; k++) 
			{
				areaArray[k].y = -60;
			}
			
			//colorAdjust1 = new ColorAdjust(area1,14,0,5,6);
			//colorAdjust1 = new ColorAdjust(area2,14,0,5,6);
			//colorAdjust1 = new ColorAdjust(area3,14,0,5,6);
			//colorAdjust1 = new ColorAdjust(area4,14,0,5,6);
			//colorAdjust1 = new ColorAdjust(area5,14,0,5,6);
			colorAdjust1 = new ColorAdjust(area6,14,0,5,6);
			
			
	
			
			
			//cMatrixOffset = new CMatrixOffset(area1,50,0,0);
			
			area1.x = 0;
			//area1.y = 0;
			addChild( area1);
			
			area2.x = area1.x +	area1.spacing.width;
			//area2.y = 0;
			addChild(area2);
			
			area3.x = area2.x + area2.spacing.width;
			//area3.y = 0;
			addChild(area3);
			
			area4.x = area3.x + area3.spacing.width;
			//area4.y = 0;
			addChild(area4);
			
			area5.x = area4.x + area4.spacing.width;
			//area5.y = 0;
			addChild(area5);
			
			area6.x = area5.x + area5.spacing.width;
			//area6.y = 0;
			addChild(area6);

			
			for (var i:int = 0; i < beastieArray.length; i++) 
			{
				beastieArray[i].x = 480;
				beastieArray[i].y = 500;
				addChild(beastieArray[i]);
				beastieArray[i].alpha = ( beastieArray[i] == beastie5 ) ? 1 : 0;
			}
			
			
			for (var j:int = 0; j < areaArray.length; j++) 
			{
 
				areaArray[j].foreground.alpha = 0;
				addChild(areaForegroundArray[j]);
				
			//	colorAdjust = new ColorAdjust(areaArray[j],14,0,5,6);
			}
			
			
			filterMc = new MovieClip;
			filterMc.width = stage.stageWidth;
			filterMc.height = stage.stageHeight;
			addChild(filterMc);
			
			for (var l:uint = 0; l < this.numChildren; l++){ 
				//trace(l);
				
			//	trace('name:' + this.getChildAt(l).name);
			//	trace('width:' + this.getChildAt(l).width);
				//trace('type:' + typeof (this.getChildAt(i)));
				
				//	colorAdjust = new ColorAdjust(this.getChildAt(l),60,0,5,6);
				
			}
			
			area1.foreground.x = 0;
			
			
			totalX = (
				area1.spacing.width 
				+ area2.spacing.width 
				+ area3.spacing.width
				+ area4.spacing.width
				+ area5.spacing.width
				+ area6.spacing.width
			) - stage.stageWidth; 
			
			trace(totalX + " = totalX");
			trace(area1.spacing.width);
			
			tl = new TimelineMax({onComplete:tlComplete, paused:true, immediateRender:false,onReverseComplete:tlOnReverseComplete});
			tl.timeScale = .23;
			
			tl.insert( TweenMax.to(marker, 13.2, {x:-totalX,onStart:tlStart,ease:Linear.easeNone}), 0);
			
			tl.insert(TweenLite.to(area1.window.background,5,{x:-area1.window.spacing.width/4}), 0);
			tl.insert(TweenLite.to(area1.window.foreground,4.5,{x:-area1.window.spacing.width/4}), 0);
			
			tl.insert(TweenLite.to(area3.window.background,5,{x:-area1.window.spacing.width/4}), 2.4);
			tl.insert(TweenLite.to(area3.window.foreground,4.5,{x:-area1.window.spacing.width/4}), 2.4);
			
			tl.insert(TweenLite.to(area4.window.background,5,{x:-area1.window.spacing.width/4}), 4.5);
			tl.insert(TweenLite.to(area4.window.foreground,4.5,{x:-area1.window.spacing.width/4}), 4.5);
			
			tl.insert(TweenLite.to(area5.window.background,5,{x:-area1.window.spacing.width/4}), 6.4);
			tl.insert(TweenLite.to(area5.window.foreground,4.5,{x:-area1.window.spacing.width/4}), 6.4);
			
			tl.insert(TweenLite.to(area6.window.background,5,{x:-area1.window.spacing.width/4}), 8.2);
			tl.insert(TweenLite.to(area6.window.foreground,4.5,{x:-area1.window.spacing.width/4}), 8.2);
			
			tl.addLabel("label1", 0);
			tl.addLabel("label2", 2.87);
			tl.addLabel("label3", 5.44);
			tl.addLabel("label4", 8);
			tl.addLabel("label5", 10.56);
			tl.addLabel("label6", 13.2);
			
			beastieTl = new TimelineMax({onComplete:beastieLoop,paused:true});
			beastieTl.insert(TweenMax.to(beastie1, 1, {frame:4}));
			beastieTl.timeScale = 1;
			
			
			beastie2Tl = new TimelineMax({onComplete:beastieLoop2,paused:true});
			beastie2Tl.insert(TweenMax.to(beastie2, 1, {frame:2}));
			beastie2Tl.timeScale = 1.5;
			
			beastie3Tl = new TimelineMax({onComplete:beastieLoop3,paused:true});
			beastie3Tl.insert(TweenMax.to(beastie3, 1, {frame:4}));
			beastie3Tl.timeScale = 1.5;

			beastie4Tl = new TimelineMax({onComplete:beastieLoop4,paused:true});
			beastie4Tl.insert(TweenMax.to(beastie4, 1, {frame:4}));
			beastie4Tl.timeScale = 1.5;
			
			beastie5Tl = new TimelineMax({onComplete:beastieLoop5,paused:true});
			beastie5Tl.insert(TweenMax.to(beastie5, 1, {frame:4}));
			beastie5Tl.timeScale = 3.5;
			
			beastieTlArray = new Array(beastieTl,beastie2Tl,beastie3Tl,beastie4Tl,beastie5Tl);
			
			//	trace(area1.foreground.x);
			//frameForward
		}
		function timerListener (e:TimerEvent):void{
			beastie5.face.play()
		}
		
		
		function beastieLoop(){
			beastieTl.currentProgress  = 0;
			beastieTl.play();
		} 
		
		function beastieLoop2(){
			beastie2Tl.currentProgress  = 0;
			beastie2Tl.play();
		} 
		
		function beastieLoop3(){
			beastie3Tl.currentProgress  = -.1;
			beastie3Tl.play();
		} 
		
		function beastieLoop4(){
			beastie4Tl.currentProgress  = 0;
			beastie4Tl.play();
		} 
		
		function beastieLoop5(){
			beastie5Tl.currentProgress  = 0;
			beastie5Tl.play();
		}

		
		private function loop(e:Event){
			
			
			
			trace(marker.width);
			
			for (var j:int = 0; j < areaArray.length; j++) 
			{
			
				areaForegroundArray[j].x = areaArray[j].foreground.x + areaArray[j].x;
				areaForegroundArray[j].y = areaArray[j].foreground.y + areaArray[j].y;
				areaForegroundArray[j].alpha = 1;
			}
			

			
			area1.x = marker.x;
			
			marker2.x = marker.x +	area1.spacing.width;
			
			
			area2.x = marker2.x;
			area3.x = area2.x + area2.spacing.width;
			area4.x = area3.x + area3.spacing.width;
			area5.x = area4.x + area4.spacing.width;
			area6.x = area5.x + area5.spacing.width;
			
			area1.foreground.x = marker.x;
			area2.foreground.x = area1.foreground.x + (area1.spacing.width * 1.4);
			area3.foreground.x = area2.foreground.x + (area2.spacing.width * 1.4);
			area4.foreground.x = area3.foreground.x + (area3.spacing.width * 1.4);
			area5.foreground.x = area4.foreground.x + (area4.spacing.width * 1.4);
			area6.foreground.x = area5.foreground.x + (area5.spacing.width * 1.4);
			
		
			
			
		}

		
		function playHandler():void{
			
			
			for (var i:int = 0; i < beastieArray.length; i++) 
			{
				beastieArray[i].scaleX = 1;
			}
			
			
			if(tl.paused == true){
				tl.play();
				playAllBeasties();	
				
			}  else{
				tl.pause();
				
				pauseAllBeasties();

			}
		}
		
		function reverseHandler():void{
			if(tl.paused == true){
				tl.reverse();
				
				playAllBeasties();

				for (var i:int = 0; i < beastieArray.length; i++) 
				{
					beastieArray[i].scaleX = -1;
				}
				
				
			}  else{
				tl.pause();		
				
				pauseAllBeasties();

				
				for (var j:int = 0; j < beastieArray.length; j++) 
				{
					beastieArray[j].scaleX = -1;
				}
			}
		}
		
		
		function myKeyDown(e:KeyboardEvent):void{
			//trace(e.keyCode);
			
			(e.keyCode == 49) ? showBeastie(beastie1): null ;
			(e.keyCode == 50) ? showBeastie(beastie2): null ;
			(e.keyCode == 51) ? showBeastie(beastie3): null ;
			(e.keyCode == 52) ? showBeastie(beastie4): null ;
			(e.keyCode == 53) ? showBeastie(beastie5): null ;
			
			
			
			if (e.keyCode == 32){
				if(tl.currentProgress != 1){
					playHandler();
				}
			}
			
			if (e.keyCode == 39){
				if(tl.currentProgress != 1){
					playHandler();
				}
			}
			
			if (e.keyCode == 37){
				reverseHandler();
			}
		}
		
		function showBeastie( b:MovieClip ):void {
			for( var i:int=0; i<beastieArray.length; i++ ) {
				beastieArray[i].alpha = ( beastieArray[i] == b ) ? 1 : 0;
			}
		}
		
		
		function tlOnReverseComplete(){
			tl.reversed = false;
			tl.pause();
			
			pauseAllBeasties();
			
			for (var i:int = 0; i < beastieArray.length; i++) 
			{
				beastieArray[i].scaleX = 1;
			}	
		}
		
		
		function stopTimeLine(){
			tl.pause();
			pauseAllBeasties();

		}
		
		
		function tlComplete(){
		//trace("theEnd");
			tl.reversed = true;
			tl.pause();
			
			for (var i:int = 0; i < beastieArray.length; i++) 
			{
				beastieArray[i].scaleX = -1;
				
			}
			pauseAllBeasties();

		}
		
		
		function playAllBeasties(){
			for (var i:int = 0; i < beastieTlArray.length; i++) {
				beastieTlArray[i].play();
			}
		}
		
		function pauseAllBeasties(){
			for (var i:int = 0; i < beastieTlArray.length; i++) {
				beastieTlArray[i].pause();
			}
			beastie5.gotoAndStop("last");
		}
		
		
		function tlStart(){
			tl.addCallback(onLabelOne, "label1");
			tl.addCallback(onLabelTwo, "label2");
			tl.addCallback(onLabelThree, "label3");
			tl.addCallback(onLabelFour, "label4");
			tl.addCallback(onLabelFive, "label5");
			tl.addCallback(onLabelSix, "label6");
		}
		
		function onLabelOne(){
			//stopTimeLine();
		}
		function onLabelTwo(){
			stopTimeLine();
		}
		function onLabelThree(){
			stopTimeLine();
		}
		
		function onLabelFour(){
			stopTimeLine();
		}
		
		function onLabelFive(){
			stopTimeLine();
		}
		
		function onLabelSix(){
			//stopTimeLine();
			
		}
	}
}