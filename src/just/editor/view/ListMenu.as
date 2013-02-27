package just.editor.view
{
	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	import feathers.data.ListCollection;
	
	import starling.display.Sprite;
	import starling.events.Event;

	public class ListMenu extends Sprite
	{
		private var buttongroup:ButtonGroup;
		public function ListMenu()
		{
			buttongroup=new ButtonGroup;
			buttongroup.width=80;
			buttongroup.gap=0;
			addChild(buttongroup);
//			buttongroup.addEventListener(Event.RESIZE,resize);
//			trace("ListMenu.ListMenu()",button._touchPointID);
		}
		private function resize(e:Event):void
		{
			
		}
		public function intialize(data:ListCollection):void
		{
			buttongroup.dataProvider=data;
		}
	}
}