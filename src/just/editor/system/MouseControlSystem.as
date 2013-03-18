package just.editor.system
{
	import just.editor.component.Display;
	import just.editor.component.MouseControll;
	import just.editor.component.Position;
	import just.editor.creator.EntityCreator;
	import just.editor.node.MouseControlNode;
	
	import net.richardlord.ash.tools.ListIteratingSystem;
	import net.richardlord.input.MousePoll;
	
	import starling.display.DisplayObject;
	import starling.events.TouchPhase;

	public class MouseControlSystem extends ListIteratingSystem
	{
		private var mousePoll : MousePoll;
		private var creator	: EntityCreator;
		
		public function MouseControlSystem(creator:EntityCreator,mousePoll : MousePoll )
		{
			super( MouseControlNode, updateNode,addNode);
			this.mousePoll = mousePoll;
			this.creator=creator;
		}
		private function addNode(node:MouseControlNode):void
		{
			var control : MouseControll = node.control;
			var position : Position = node.position;
			switch(control.phase)
			{
				case MouseControll.POS:
				{
					position.position=mousePoll.getMousePositon();
					break;
				}
			}
		}

		private function updateNode( node : MouseControlNode, time : Number ) : void
		{
			var control : MouseControll = node.control;
			var position : Position = node.position;
			var display:Display=node.display
			var displayobj:DisplayObject=display.displayObject;
		
			switch(control.phase)
			{
				case MouseControll.POS:
				{
					if(mousePoll.isClickHappen)
					{
						creator.destroyEntity(node.entity);
						return ;
					}
//					position.position=keyPoll.getMousePositon();
					break;
				}
				case MouseControll.DRAG:
				{
					displayobj.touchable=false;
					if(mousePoll.isClickHappen)
					{
//						creator.destroyEntity(node.entity);
						control.phase=MouseControll.STOP;
						if(position.position.x<0||position.position.y<0)
							creator.destroyEntity(node.entity);
						return ;
					}
					position.position=mousePoll.getMousePositon();
					break;
				}
				case MouseControll.STOP:
				{
					if(mousePoll.currentPhrase==TouchPhase.BEGAN)
					{
						var b:Boolean=mousePoll.checkDisInTouch(TouchPhase.BEGAN,displayobj)
						if(b)
						{
							node.control.phase=MouseControll.DRAG;
							mousePoll.isClickHappen=false;
						}
					}
					displayobj.touchable=true;
					break;
				}
					
				default:
				{
					break;
				}
			}
			//处理 选择的控件
			if(displayobj==mousePoll.clickTarget&&!display.isUi)
			{
				mousePoll.currentCompent=displayobj
			}
//			var motion : Motion = node.motion;

//			if ( keyPoll.isDown( control.left ) )
//			{
//				position.rotation -= control.rotationRate * time;
//			}
//
//			if ( keyPoll.isDown( control.right ) )
//			{
//				position.rotation += control.rotationRate * time;
//			}
//
//			if ( keyPoll.isDown( control.accelerate ) )
//			{
//				motion.velocity.x += Math.cos( position.rotation ) * control.accelerationRate * time;
//				motion.velocity.y += Math.sin( position.rotation ) * control.accelerationRate * time;
//			}
		}
	}
}
