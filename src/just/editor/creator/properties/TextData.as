package just.editor.creator.properties
{
	public class TextData extends Basedata
	{
		public function TextData()
		{
			super();
		}
		override protected function build():void
		{
			super.build();
			buildText();
		}
		protected function  buildText():void
		{
			pushPropertise("text");
		}
	}
}