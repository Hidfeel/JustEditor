package just.editor.node
{
	import just.editor.component.Display;
	import just.editor.component.EditItem;
	import just.editor.component.UiState;
	
	import net.richardlord.ash.core.Node;
	
	public class EditorNode extends Node
	{
		public var item:EditItem;
		public var state:UiState;
		public function EditorNode()
		{
			super();
		}
		public function getClassStr():String
		{
			return Display(entity.get(Display)).getClassStr();
		}
	}
}