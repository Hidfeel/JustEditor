package just.editor.component
{
	import flash.geom.Point;
	
	public class Position
	{
		public var position : Point;
		public var rotation : Number = 0;
		
		public function Position( x : Number=0, y : Number=0, rotation : Number=0)
		{
			position = new Point( x, y );
			this.rotation = rotation;
		}
	}
}
