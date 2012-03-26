package
{
	import fl.motion.AdjustColor;
	//import flash.events.*;
	//import flash.debugger.enterDebugger;
//	import flash.display.Sprite;
	import flash.filters.ColorMatrixFilter;
	
	
	public class ColorAdjust
	{
		
	private	var colorFilter:AdjustColor = new AdjustColor();
	private	var AdjustColorMatrix:ColorMatrixFilter;
		//var cmf:ColorMatrixFilter;
	private	var aMatrix:Array = [];
	private	var theFilters:Array = new Array();
	private	var _hue;
	private	var _saturation;
	private	var _brightness;
	private	var _contrast;
	private	var _theObject;
		
		
		public function ColorAdjust(theObject,saturation = 0,brightness = 0,contrast = 0,hue = 0){
			
			_hue = hue;
			_saturation = saturation;
			_brightness = brightness;
			_contrast = contrast;
			_theObject = theObject;
			
			colorFilter.hue = _hue;
			colorFilter.saturation = _saturation;
			colorFilter.brightness = _brightness;
			colorFilter.contrast = _contrast;
			
			aMatrix = colorFilter.CalculateFinalFlatArray();
			AdjustColorMatrix = new ColorMatrixFilter(aMatrix);
			
			//cmf = new ColorMatrixFilter(new Array(1,0,0,0,70,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0));
			
			
		//	theFilters.push( cmf );
			theFilters.push( AdjustColorMatrix );
			
			_theObject.filters = [AdjustColorMatrix];
			
		}
	}
}