package just.editor.creator
{
	import feathers.controls.Button;
	
	import just.editor.component.Display;
	import just.editor.component.EditItem;
	import just.editor.component.Position;
	
	import net.richardlord.ash.core.Entity;
	import net.richardlord.ash.core.Game;

	public class UiCreator
	{
		private var game:Game;
		private var itemCreator:EditorItemCreator
		public function UiCreator(game:Game,itemCreator:EditorItemCreator)
		{
			this.game=game;
			this.itemCreator=itemCreator
		}
		public function creatItem(x:Number,y:Number,cls:Class):Entity
		{
			return game.addEntity(new Entity()
				.add( new Position( x, y, 0 ) )
				.add( new Display( itemCreator.getInstance(cls)()))
				.add(new EditItem())
			);
		}
		
	}
}