package just.editor.component
{
	import avmplus.getQualifiedClassName;
	
	import starling.display.DisplayObject;
	
	public class Display
	{
		public var displayObject : DisplayObject = null;
		public var isUi:Boolean=false;
		
		public function Display( displayObject : DisplayObject ,isUi:Boolean=false)
		{
			this.displayObject = displayObject;
			this.isUi=isUi;
		}
		public function getClassStr():String
		{
			return "类："+getQualifiedClassName(displayObject)+"坐标："+displayObject.x+","+displayObject.y;
		}
	}
}
