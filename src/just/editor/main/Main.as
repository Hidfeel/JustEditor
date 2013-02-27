package just.editor.main
{
	import feathers.themes.AeonDesktopTheme;
	import feathers.themes.MetalWorksMobileTheme;
	
	import just.editor.creator.EditorItemCreator;
	import just.editor.creator.EntityCreator;
	import just.editor.creator.UiCreator;
	import just.editor.system.EditorSystem;
	import just.editor.system.MainSystem;
	import just.editor.system.MouseControlSystem;
	import just.editor.system.RenderSystem;
	import just.editor.system.SystemPriorities;
	import just.editor.system.UiSystem;
	import just.editor.view.ColorBG;
	
	import net.richardlord.ash.core.Game;
	import net.richardlord.ash.integration.starling.StarlingFrameTickProvider;
	import net.richardlord.input.KeyPoll;
	import net.richardlord.input.MousePoll;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	public class Main extends Sprite
	{
		private var uicontainer:Sprite;
		private var editorcontainer:Sprite;
		public function Main()
		{
			uicontainer=new Sprite;
			addChild(uicontainer);
			var stage:Stage=Starling.current.stage;
			editorcontainer=ColorBG.drawRec(0xaa22aa,stage.stageWidth,stage.stageHeight);
			editorcontainer.x=200;
			editorcontainer.y=200
			addChild(editorcontainer);
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		private function addedToStageHandler(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			startGame();
			
		}
		private var game : Game;
		private var tickProvider : StarlingFrameTickProvider;
		
		private var creator : EntityCreator;
		private var uicreator:UiCreator;
		private var itemCreator:EditorItemCreator;
		private var file:FileManager;
		
		private var keyPoll : KeyPoll;
		private var mousePoll:MousePoll
		private var config : MainConfig;
		
		private var theme:MetalWorksMobileTheme;
		private var customtheme:AeonDesktopTheme;
		private function startGame() : void
		{
			this.theme = new MetalWorksMobileTheme(uicontainer);
			this.customtheme=new AeonDesktopTheme(editorcontainer);
			prepare();
			start();
		}
		
		private function prepare() : void
		{
			game = new Game();
			itemCreator=new EditorItemCreator();
			creator = new EntityCreator( game ,itemCreator);
			uicreator=new UiCreator(game,itemCreator)
			keyPoll = new KeyPoll( Starling.current.nativeStage );
			mousePoll=new MousePoll(Starling.current.stage);
			file=new FileManager();
//			var viewPort : Rectangle = Starling.current.viewPort;
			config = new MainConfig();
//			config.width = viewPort.width;
//			config.height = viewPort.height;
//			
			game.addSystem( new MainSystem(creator,mousePoll), SystemPriorities.preUpdate );
			game.addSystem( new UiSystem(creator,mousePoll), SystemPriorities.update );
//			game.addSystem( new GameManager( creator, config ), SystemPriorities.preUpdate );
			game.addSystem( new MouseControlSystem( creator,mousePoll ), SystemPriorities.update );
//			game.addSystem( new GunControlSystem( keyPoll, creator ), SystemPriorities.update );
//			game.addSystem( new BulletAgeSystem( creator ), SystemPriorities.update );
//			game.addSystem( new MovementSystem( config ), SystemPriorities.move );
//			game.addSystem( new CollisionSystem( creator ), SystemPriorities.resolveCollisions );
			game.addSystem( new RenderSystem( editorcontainer ,uicontainer), SystemPriorities.render );
			game.addSystem(new EditorSystem(creator,editorcontainer,file),SystemPriorities.editor)
//			
			creator.createGame();
		}
		
		private function start() : void
		{
			tickProvider = new StarlingFrameTickProvider( Starling.current.juggler );
			tickProvider.add( game.update );
			tickProvider.start();
		}
		
	}
}