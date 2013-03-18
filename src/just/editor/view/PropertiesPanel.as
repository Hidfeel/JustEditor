package just.editor.view
{
	import feathers.controls.List;
	import feathers.data.ListCollection;
	
	import just.editor.creator.EditorItemProperty;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class PropertiesPanel extends Sprite
	{
		private var propercreator:EditorItemProperty;
		private var list:List;
		private var clickDis:DisplayObject;
		public function PropertiesPanel()
		{
			super();
			propercreator=new EditorItemProperty;
			init();
		}
		private function init():void
		{
			list=new List;
			list.itemRendererType=PropertyListItem
			list.itemRendererProperties.gap = 100;
			addChild(list);
			list.addEventListener(PropertyListItem.ITEM_CHANGE,changeHandler);
		}
		private function changeHandler(e:Event):void
		{
//			trace("PropertiesPanel.changeHandler(e)");
			var obj:Object=list.selectedItem;
			if(clickDis&&clickDis.hasOwnProperty(obj.label))
			{
				if(!obj.type)
				{
					clickDis[obj.label]=obj.data[0]
				}
				else
				{
					clickDis[obj.label]=obj.data[0][obj.dataindex]
				}
			}
		}
		public function set clickdata(click:DisplayObject):void
		{
			if(click==clickDis)return ;
			clickDis=click;
			var properties:Array=propercreator.getProperties(click["constructor"])
			for each (var i:Object in properties) 
			{
				if(click.hasOwnProperty(i.label))
				{
					if(i.data&&i.data is Array&&i.data.length)
					{
//						if()
//						{
							click[i.label]=i.data[0]
//						}
					}
					else
					{
						i.data=[click[i.label]];
					}
				}
			}
			
			var groceryList:ListCollection = new ListCollection(properties);
			list.dataProvider = groceryList;
			
		}
	}
}