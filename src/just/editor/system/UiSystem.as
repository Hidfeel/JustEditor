package just.editor.system
{
	import just.editor.component.UiState;
	import just.editor.creator.EntityCreator;
	import just.editor.node.UiNode;
	import just.editor.view.ComponentView;
	import just.editor.view.ListMenu;
	import just.editor.view.Menu;
	import just.editor.view.TestView;
	
	import net.richardlord.ash.core.Game;
	import net.richardlord.ash.tools.ListIteratingSystem;
	import net.richardlord.input.MousePoll;
	
	import starling.display.DisplayObject;
	
	public class UiSystem extends ListIteratingSystem
	{
		private var creator:EntityCreator;
		private var mouse:MousePoll
		public function UiSystem(game:EntityCreator,mouse:MousePoll)
		{
			this.creator=game;
			this.mouse=mouse;
			super(UiNode, updateIt,nodeAdd);
		}
		private function nodeAdd(node:UiNode):void
		{
			var display:DisplayObject=node.menudis.displayObject;
			var uistate:UiState=node.uistate;
			if(display is Menu)
			{
				var menu:Menu=Menu(display);
				menu.intialize(uistate.menuLabel);
//				uistate.menuclicklabel=menu._clicklabel;
				
			}
			else if(display is ComponentView)
			{
				var cv:ComponentView=ComponentView(display);
				cv.intialize(uistate.COMPONENT);
//				node.entity.add()
			}
		}
		private  function updateIt(node:UiNode,time:Number):void
		{
			var display:DisplayObject=node.menudis.displayObject;
			var uistate:UiState=node.uistate;
			if(display is Menu)
			{
				var menu:Menu=display as Menu;
				uistate.menuclicklabel=menu.clicklabel;
			}
			else if(display is TestView)
			{
				var textview:TestView=display as TestView;
				if(uistate.menuclicklabel)
					textview.labeltest=uistate.menuclicklabel;
			}
			else if(display is ListMenu)
			{
//				var list:ListMenu=ListMenu(display);
//				if(mouse.isClickHappen)
//				{
////					list.needClose=false;
//					creator.destroyEntity(node.entity);
//				}
			}
			else if(display is ComponentView)
			{
				var cv:ComponentView=ComponentView(display);
				uistate.component=cv.selectData;
				var cls:Class=cv.selectData as Class;
				if(cls)
				{
					mouse.isClickHappen=false;
					creator.creatDragItem(cls,uistate);
					cv.selectData=null
				}
			}
		}
	}
}