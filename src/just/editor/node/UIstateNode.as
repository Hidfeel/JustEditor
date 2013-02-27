package just.editor.node
{
	import just.editor.component.Display;
	import just.editor.component.GameState;
	import just.editor.component.UiState;
	
	import net.richardlord.ash.core.Node;
	
	public class UIstateNode extends Node
	{
		public var uistate:UiState;
		public var gamestate:GameState;
		public function UIstateNode()
		{
			super();
		}
	}
}