package just.editor.creator.properties
{
	public class ButtonData extends Basedata
	{
		public function ButtonData()
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
			pushPropertise("label");
		}
	}
}