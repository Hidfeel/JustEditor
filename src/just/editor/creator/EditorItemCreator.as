package just.editor.creator
{
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.data.ListCollection;
	
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;

	public class EditorItemCreator
	{
		private var dic:Object=new Object;
		public function EditorItemCreator()
		{
			dic[(Button)]=creatButton;
			dic[(Label)]=creatLabel;
			dic[(List)]=creatList;
		}
		public function getInstance(cls:Class):Function
		{
			return dic[(cls)];
		}
		private function creatButton():Button
		{
			var b:Button=new Button;
			return b;
		}
		private function creatLabel():Label
		{
			var l:Label=new Label;
			l.text="输入文字";
			return l
		}
		private function creatList():List
		{
			var l:List=new List;
			l.dataProvider=new ListCollection([{label:"label1"},{label:"label2"},{label:"label3"}]);
			return l;
		}
	}
}