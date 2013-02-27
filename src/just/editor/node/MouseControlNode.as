package just.editor.node
{
	import just.editor.component.Display;
	import just.editor.component.MouseControll;
	import just.editor.component.Position;
	
	import net.richardlord.ash.core.Node;

	public class MouseControlNode extends Node
	{
		public var control : MouseControll;
		public var position : Position;
		public var display:Display
	}
}
