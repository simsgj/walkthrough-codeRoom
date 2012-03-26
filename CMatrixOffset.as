package
{
	//import fl.motion.AdjustColor;
	
	
	
	import flash.filters.ColorMatrixFilter;
	
	
	public class CMatrixOffset
	{
		
	//	private	var colorFilter:AdjustColor = new AdjustColor();
	
		private var cmf:ColorMatrixFilter;
		private var _theObject;
		
		public function CMatrixOffset(theObject,redOffest = 0,greenOffest = 0,blueOffest = 0){
			_theObject = theObject;
			 
			cmf = new ColorMatrixFilter(new Array(1,0,0,0,redOffest,0,1,0,0,greenOffest,0,0,1,0,blueOffest,0,0,0,1,0));
			
			_theObject.filters = [cmf];
			
		}
	}
}