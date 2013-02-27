package just.editor.system
{
	import feathers.controls.Button;
	
	import flash.geom.Point;
	
	import just.editor.component.Display;
	import just.editor.component.Position;
	import just.editor.node.RenderNode;
	
	import net.richardlord.ash.core.Game;
	import net.richardlord.ash.core.NodeList;
	import net.richardlord.ash.core.System;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class RenderSystem extends System
	{
		public var container : DisplayObjectContainer;
		public var uicontainer:DisplayObjectContainer;
		
		private var nodes : NodeList;
		
		public function RenderSystem( container : DisplayObjectContainer ,uicontainer:DisplayObjectContainer)
		{
			this.container = container;
			this.uicontainer=uicontainer;
		}
		
		override public function addToGame( game : Game ) : void
		{
			nodes = game.getNodeList( RenderNode );
			for( var node : RenderNode = nodes.head; node; node = node.next )
			{
				addToDisplay( node );
			}
			nodes.nodeAdded.add( addToDisplay );
			nodes.nodeRemoved.add( removeFromDisplay );
		}
		
		private function addToDisplay( node : RenderNode ) : void
		{
			if(node.display.isUi)
			{
				uicontainer.addChild(node.display.displayObject)
			}
			else
			{
				container.addChild( node.display.displayObject );
			}
		}
		
		private function removeFromDisplay( node : RenderNode ) : void
		{
			var p:DisplayObject=node.display.displayObject ;
			p.parent.removeChild( p );
		}
		
		override public function update( time : Number ) : void
		{
			var node : RenderNode;
			var position : Position;
			var display : Display;
			var displayObject : DisplayObject;
			
			for( node = nodes.head; node; node = node.next )
			{
				display = node.display;
				displayObject = display.displayObject;
				position = node.position;
				
				var p2:Point=displayObject.parent.globalToLocal(position.position);
				displayObject.x = p2.x;
				displayObject.y = p2.y;
				displayObject.rotation = position.rotation;
			}
		}

		override public function removeFromGame( game : Game ) : void
		{
			nodes = null;
		}
	}
}
