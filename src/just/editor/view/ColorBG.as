package just.editor.view
{
	import feathers.display.TiledImage;
	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	public class ColorBG extends Sprite
	{
		public static function drawRec(color:uint,width:Number,height:Number):ColorBG
		{
			var source:flash.display.Sprite=new flash.display.Sprite;
			source.graphics.beginFill(color,1.0);
			source.graphics.drawRect(0,0,width,height);
			source.graphics.endFill();
			var bitmapdata:BitmapData=new BitmapData(width,height);
			bitmapdata.draw(source);
			return new ColorBG(Texture.fromBitmapData(bitmapdata))
			
		}
		private var titleimage:TiledImage;
		public function ColorBG(texture:Texture)
		{
			super();
			titleimage=new TiledImage(texture);
			addChild(titleimage);
		}
	}
}