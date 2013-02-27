package just.editor.creator
{
	import feathers.controls.Button;
	import feathers.data.ListCollection;
	
	import just.editor.component.Display;
	import just.editor.component.EditItem;
	import just.editor.component.GameState;
	import just.editor.component.MouseControll;
	import just.editor.component.Position;
	import just.editor.component.UiState;
	import just.editor.view.ListMenu;
	import just.editor.view.Menu;
	import just.editor.view.TestView;
	
	import net.richardlord.ash.core.Entity;
	import net.richardlord.ash.core.Game;
	
	import starling.display.DisplayObject;
	import starling.events.TouchPhase;

	public class EntityCreator
	{
		private var game:Game
		private var itemCreator:EditorItemCreator
		public function EntityCreator(game:Game,itemCreator:EditorItemCreator)
		{
			this.game=game;
			this.itemCreator=itemCreator
			listMenu=new ListMenu();
		}
		public function destroyEntity( entity : Entity ) : void
		{
			game.removeEntity( entity );
		}
		private var listMenu:ListMenu;
		
		public function createGame() : Entity
		{
//			creatDragItem(Button,new UiState)
//			createButton(200,200,null)
			 return game.addEntity(new Entity()
				.add(new GameState())
				.add(new UiState())
			);
//			  return creatMenu(0,0);
//			 return createButton(0,0,null);
		}
		public function addLoaderEntity(url:String):Entity
		{
			return game.addEntity(new Entity()
//				.add()
			)
		}
		
		public function createButton(x : Number, y : Number,callback:Function ) : Entity
		{
			return game.addEntity(new Entity()
//				.add( new MouseControll(TouchPhase.ENDED,callback) )
				.add( new Position( x, y, 0 ) )
//				.add( new Motion( ( Math.random() - 0.5 ) * 4 * ( 50 - radius ), ( Math.random() - 0.5 ) * 4 * ( 50 - radius ), Math.random() * 2 - 1, 0 ) )
				.add( new Display( new Button(),true) ));
//			( asteroid );
//			return asteroid;
		}
		public function creatUI(x:Number,y:Number,state:UiState,uiclass:Class):Entity
		{
			return game.addEntity(new Entity()
				.add( new Position( x, y, 0 ) )
				.add(state)
				//				.add( new Motion( ( Math.random() - 0.5 ) * 4 * ( 50 - radius ), ( Math.random() - 0.5 ) * 4 * ( 50 - radius ), Math.random() * 2 - 1, 0 ) )
				.add( new Display( new uiclass(),true) ));
		}
		public function creatListmenu(state:UiState,data:ListCollection):Entity
		{
			listMenu.intialize(data);
			return game.addEntity(new Entity()
				.add(new MouseControll(MouseControll.POS))
				.add( new Position( 0, 0, 0 ) )
				.add(state)
				//				.add( new Motion( ( Math.random() - 0.5 ) * 4 * ( 50 - radius ), ( Math.random() - 0.5 ) * 4 * ( 50 - radius ), Math.random() * 2 - 1, 0 ) )
				.add( new Display( listMenu,true) ));
		}
		public function creatDragItem(cls:Class,uistate:UiState):Entity
		{
			var d:DisplayObject=itemCreator.getInstance(cls)();
			return game.addEntity(new Entity()
			.add(new Position())
			.add(new MouseControll(MouseControll.DRAG))
			.add(uistate)
			.add(new Display(d))
			.add(new EditItem())
			);
		}
//		public function creatTextUi(x:Number,y:Number,state:UiState):Entity
//		{
//			return game.addEntity(new Entity()
//				.add(new Position(x,y,0))
//				.add(state)
//				.add(new Display(new TestView))
//			)
//		}
	}
}