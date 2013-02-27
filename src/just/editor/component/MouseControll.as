package just.editor.component
{
	public class MouseControll
	{
		public static const DRAG:String="drag";
		public static const POS:String="postion";
		public static const STOP:String="stop";
		public var phase:String; 
		public var handle:Function
		/**
		 *touchphase 
		 * @param mousePhrase
		 * 
		 */		
		public function MouseControll(mousePhase:String,func:Function=null)
		{
			phase=mousePhase;
			handle=func;
		}
	}
}