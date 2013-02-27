package just.editor.system
{
	import flash.desktop.NativeApplication;
	
	import just.editor.component.UiState;
	import just.editor.creator.EntityCreator;
	import just.editor.main.FileManager;
	import just.editor.node.EditorNode;
	
	import net.richardlord.ash.core.Node;
	import net.richardlord.ash.tools.ListIteratingSystem;
	
	import starling.display.Sprite;
	
	public class EditorSystem extends ListIteratingSystem
	{
		private var container:Sprite;
		private var creator:EntityCreator;
		private var file:FileManager;
		public function EditorSystem(creator:EntityCreator,container:Sprite,file:FileManager)
		{
			super(EditorNode);
			this.container=container;
			this.creator=creator;
			this.file=file;
		}
		override public function update( time : Number ) : void
		{
			for( var node : EditorNode = nodeList.head; node; node = node.next )
			{
				var uistate:UiState=node.state;
				var state:String=uistate.listlabel
				switch(state)
				{
					case uistate.NEWFILE:
					creator.destroyEntity(node.entity)
					break;
					case uistate.SAVEFILE:
					
						break;
					case uistate.QUIT:
					NativeApplication.nativeApplication.exit(0)
						break;
					default:
					{
						break;
					}
				}
//				nodeUpdateFunction( node, time );
			}
			uistate.listlabel="";
		}
	}
}
class clsWriter
{
	public function write(...args):void
	{
		
	}
	public function toString():String
	{
		return "";
	}
}