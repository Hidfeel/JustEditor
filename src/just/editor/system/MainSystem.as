package just.editor.system
{
	
	import feathers.data.ListCollection;
	
	import just.editor.component.UiState;
	import just.editor.creator.EntityCreator;
	import just.editor.node.UIstateNode;
	import just.editor.view.ComponentView;
	import just.editor.view.Menu;
	import just.editor.view.TestView;
	
	import net.richardlord.ash.core.Game;
	import net.richardlord.ash.core.NodeList;
	import net.richardlord.ash.core.System;
	import net.richardlord.input.MousePoll;
	
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;

	public class MainSystem  extends System
	{
		public function MainSystem(creator:EntityCreator,mouse:MousePoll)
		{
			uicreator=creator;
			this.mouse=mouse;
		}
		
		private var uicreator:EntityCreator
		private var mouse:MousePoll;
		
		private var nodes : NodeList;
		
		
		override public function addToGame( game : Game ) : void
		{
			nodes = game.getNodeList( UIstateNode );
			for( var node : UIstateNode = nodes.head; node; node = node.next )
			{
				addData( node );
			}
			nodes.nodeAdded.add( addData );
//			nodes.nodeRemoved.add( null );
		}
		
		private function addData( node : UIstateNode ) : void
		{
			var uistate:UiState=node.uistate;
			uicreator.creatUI(0,0,uistate,Menu);
			uicreator.creatUI(150,150,uistate,TestView);
			uicreator.creatUI(0,30,uistate,ComponentView);
//			uicreator.createButton(500,500,null);
			
//			uicreator.creatTextUi(50,50,uistate)
//			var menu:Menu=node.display.displayObject as Menu;
//			menu.intialize(node.uistate.menuLabel);
		}
//		
//		private function removeFromDisplay( node : RenderNode ) : void
//		{
//			container.removeChild( node.display.displayObject );
//		}
		
		override public function update( time : Number ) : void
		{
			var node : UIstateNode;
//			var menu : Menu;
			var uistate:UiState;
			
			for( node = nodes.head; node; node = node.next )
			{
//				menu = node.display.displayObject as Menu;
				uistate = node.uistate;
				switch(uistate.menuclicklabel)
				{
				case uistate.FILE:
					mouse.isClickHappen=false;
					uicreator.creatListmenu(node.uistate,new ListCollection([
						{label:uistate.LISTMENU_LABEL[0],triggered:buttontriggered},
						{label:uistate.LISTMENU_LABEL[1],triggered:buttontriggered},
						{label:uistate.LISTMENU_LABEL[2],triggered:buttontriggered}
					]))
					break;
				}

				uistate.menuclicklabel="";
//				uistate.menuclicklabel=menu.clicklabel;
			}
		}
		private function buttontriggered(e:Event):void
		{
			trace("MainSystem.buttontriggered(e)");
		}
		
		override public function removeFromGame( game : Game ) : void
		{
			nodes = null;
		}
	}
}