package just.editor.view
{
	import feathers.controls.Button;
	import feathers.controls.List;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class ComponentView extends Sprite
	{
		public var selectData:Object;
		private var list:List;
		public function ComponentView()
		{
			super();
			list=new List;
			addChild(list);
//			var obj:Object={};
//			obj[Event.CHANGE]=itemChange
			list.itemRendererFactory=itemRender
			list.isSelectable=false;
//			list.addEventListener(Event.CHANGE, list_changeHandler);
		}
		private function itemRender():IListItemRenderer
		{
			var item:IListItemRenderer= new list.itemRendererType();
			var bt:Button=item as Button;
			if(bt)
			{
				bt.addEventListener(TouchEvent.TOUCH,itemChange);
			}
			return item;
		}

		private function itemChange(e:TouchEvent):void
		{
			var bt:Button=e.currentTarget as Button;
			var touch:Touch=e.getTouch(bt);
			if(!touch)return ;
			trace("ComponentView.itemChange(e)",touch.phase);
			if(touch.phase==TouchPhase.BEGAN)
			{
				bt.isSelected=true;
				selectData=list.dataProvider.data[(bt as IListItemRenderer).index]["data"]
			}
			else
			{
				bt.isSelected=false;
			}
			
		}
		public function intialize(arr:Array):void
		{
			list.dataProvider=new ListCollection(arr);
			list.typicalItem=arr[arr.length-1];
			list.itemRendererProperties.labelField = "label";
		}
		private function list_changeHandler(e:Event):void
		{
			trace("ComponentView.list_changeHandler(e)",list.selectedIndex);
			if(list.selectedIndex!=-1)
			{
				selectData=list.selectedItem["data"];
				list.selectedIndex=-1;
			}
			
		}
	}
}