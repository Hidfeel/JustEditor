package just.editor.view
{
	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	import feathers.data.ListCollection;
	
	import flash.system.Capabilities;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Menu extends Sprite
	{
		private var labArr:Array;
		private var _clicklabel:String;
		public function get clicklabel():String 
		{
			var _str:String=_clicklabel;
			_clicklabel=""
			return _str;
		}
		public function Menu()
		{
			super();
		}
		private function addtostage(e:Event):void
		{
			buttongroup.removeEventListener(Event.ADDED_TO_STAGE,addtostage);
			var bg:ColorBG=ColorBG.drawRec(0x777777,Capabilities.screenResolutionX,buttongroup.height);
			addChildAt(bg,0);
		}
		private var buttongroup:ButtonGroup;
		public function intialize(label:Array):void
		{
			labArr=label;
			var ar:Array=[];
			for (var i:int = 0; i < labArr.length; i++) 
			{
				var obj:Object={};
				obj.label=labArr[i];
				obj.triggered= button_triggeredHandler ;
				ar.push(obj);
			}
			buttongroup=new ButtonGroup();
			buttongroup.addEventListener(Event.RESIZE,addtostage);
			buttongroup.dataProvider=new ListCollection(ar);
			buttongroup.direction=ButtonGroup.DIRECTION_HORIZONTAL;
			addChild(buttongroup);
//			if(stage)
//			{
//				addtostage(null);
//			}
//			else
//			{
//				addEventListener(Event.ADDED_TO_STAGE,addtostage);
//			}
		}
		private function button_triggeredHandler(e:Event):void
		{
			const button:Button = Button(e.currentTarget);
//			trace(button.label + " triggered.");
			_clicklabel=button.label;
		}
	}
}