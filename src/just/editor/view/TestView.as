package just.editor.view
{
	import feathers.controls.Button;
	import feathers.controls.Label;
	
	import starling.display.Sprite;

	public class TestView extends Sprite
	{
		public var label:Label;
		public function TestView()
		{
			label=new Label;
			addChild(label);
		}
		public function set labeltest(str:String):void
		{
			label.text=str;
		}
	}
}