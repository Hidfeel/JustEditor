package just.editor.creator
{
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.TextInput;
	
	import flash.utils.Dictionary;
	
	import just.editor.creator.properties.ButtonData;
	import just.editor.creator.properties.InputData;
	import just.editor.creator.properties.LabelData;

	public class EditorItemProperty
	{
		private var dic:Dictionary;
		public function EditorItemProperty()
		{
			dic=new Dictionary;
			init();
		}
		public function getProperties(cls:Class):Array
		{
			return dic[cls]
		}
		private var button:ButtonData;
		private var input:InputData;
		private var label:LabelData;
		private function init():void
		{
			button=new ButtonData();
			dic[Button]=button.propertiesData;
			
			input=new InputData;
			dic[TextInput]=input.propertiesData;
			
			label=new LabelData()
			dic[Label]=label.propertiesData;
		}
		
	}
}