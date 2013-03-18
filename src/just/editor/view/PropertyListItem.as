package just.editor.view
{
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.PickerList;
	import feathers.controls.TextInput;
	import feathers.controls.popups.DropDownPopUpContentManager;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.core.FeathersControl;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	
	import flash.geom.Point;
	
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class PropertyListItem extends FeathersControl implements IListItemRenderer
	{
		public static const ITEM_CHANGE:String="item change"
		public function PropertyListItem()
		{
			super();
			this.addEventListener(TouchEvent.TOUCH, touchHandler);
			this.addEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
		}
		protected function removedFromStageHandler(event:Event):void
		{
			this.touchPointID = -1;
		}
		
		private  const HELPER_POINT:Point = new Point();
		
		protected var itemLabel:Label;
		
		protected var propertyInput:TextInput;
		
		protected var propertyPick:PickerList;
		
		protected var propertycontrol:FeathersControl;
		
		protected var _index:int = -1;
		
		protected var touchPointID:int = -1;
		
		public function get index():int
		{
			return this._index;
		}
		
		public function set index(value:int):void
		{
			if(this._index == value)
			{
				return;
			}
			this._index = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		protected var _owner:List;
		
		public function get owner():List
		{
			return List(this._owner);
		}
		
		public function set owner(value:List):void
		{
			if(this._owner == value)
			{
				return;
			}
			this._owner = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		protected var _data:Object;
		
		public function get data():Object
		{
			return this._data;
		}
		
		public function set data(value:Object):void
		{
			if(this._data == value)
			{
				return;
			}
			this._data = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		protected var _isSelected:Boolean;
		
		public function get isSelected():Boolean
		{
			return this._isSelected;
		}
		
		public function set isSelected(value:Boolean):void
		{
			if(this._isSelected == value)
			{
				return;
			}
			this._isSelected = value;
			this.invalidate(INVALIDATION_FLAG_SELECTED);
			this.dispatchEventWith(Event.CHANGE);
		}
		
		override protected function initialize():void
		{
			if(!this.itemLabel)
			{
				this.itemLabel = new Label();
				this.addChild(this.itemLabel);
			}
		}
		
		override protected function draw():void
		{
			const dataInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_DATA);
			const selectionInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_SELECTED);
			var sizeInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_SIZE);
			
			if(dataInvalid)
			{
				this.commitData();
			}
			
			sizeInvalid = this.autoSizeIfNeeded() || sizeInvalid;
		
			if(dataInvalid || sizeInvalid)
			{
				this.layout();
			}
			if(propertycontrol)
			{
				propertycontrol.validate();
			}
		}
		
		protected function autoSizeIfNeeded():Boolean
		{
			const needsWidth:Boolean = isNaN(this.explicitWidth);
			const needsHeight:Boolean = isNaN(this.explicitHeight);
			if(!needsWidth && !needsHeight)
			{
				return false;
			}
			this.itemLabel.width = NaN;
			this.itemLabel.height = NaN;
			if(propertycontrol)
			{
				propertycontrol.width=NaN;
				propertycontrol.height=NaN;
				propertycontrol.validate();
			}
			this.itemLabel.validate();
			var newWidth:Number = this.explicitWidth;
			if(needsWidth)
			{
				newWidth =propertycontrol?propertycontrol.width+ this.itemLabel.width:this.itemLabel.width;
			}
			var newHeight:Number = this.explicitHeight;
			if(needsHeight)
			{
//				newHeight = this.itemLabel.height;
				newHeight =propertycontrol?Math.max(propertycontrol.height, this.itemLabel.height):this.itemLabel.height;
			}
			return this.setSizeInternal(newWidth, newHeight, false);
		}
		private function textinputHandle(e:Event):void
		{
			_data.data[0]=propertyInput.text;
			owner.dispatchEvent(new Event(ITEM_CHANGE))
		}
		private function pickHandle(e:Event):void
		{
			_data.dataindex=propertyPick.selectedIndex;
			owner.dispatchEvent(new Event(ITEM_CHANGE))
		}
		protected function commitData():void
		{
			if(this._data)
			{
				this.itemLabel.text = this._data["label"];
				if(!_data["type"])
				{
					if(!propertyInput)
					{
						propertyInput=new TextInput();
						propertyInput.addEventListener(FeathersEventType.ENTER,textinputHandle);
						addChild(propertyInput)
					}
					propertycontrol=propertyInput;
					trace("PropertyListItem.commitData()",propertyInput.isEnabled);
					propertyInput.text=_data["data"][0]
				}
				else
				{
					if(!propertyPick)
					{
						propertyPick=new PickerList();
						propertyPick.popUpContentManager=new DropDownPopUpContentManager
						propertyPick.addEventListener(Event.CHANGE,pickHandle);
						addChild(propertyPick)
					}
					propertycontrol=propertyPick;
					propertyPick.dataProvider=new ListCollection(_data["data"])
					if(_data.dataindex)
					{
						propertyPick.selectedIndex=_data.dataindex
					}
				}
			}
			else
			{
				this.itemLabel.text = "";
			}
		}
		
		protected function layout():void
		{
				this.itemLabel.width = this.actualWidth/2;
				this.itemLabel.height = this.actualHeight;
			if(propertycontrol)
			{
				this.propertycontrol.width =this.propertycontrol.x= this.actualWidth/2;
				this.propertycontrol.height = this.actualHeight;
			}
		}
		protected function touchHandler(event:TouchEvent):void
		{
			const touches:Vector.<Touch> = event.getTouches(this);
			if(touches.length == 0)
			{
				//hover has ended
				return;
			}
			if(this.touchPointID >= 0)
			{
				var touch:Touch;
				for each(var currentTouch:Touch in touches)
				{
					if(currentTouch.id == this.touchPointID)
					{
						touch = currentTouch;
						break;
					}
				}
				if(!touch)
				{
					return;
				}
				if(touch.phase == TouchPhase.ENDED)
				{
					this.touchPointID = -1;
					
					touch.getLocation(this, HELPER_POINT);
					//check if the touch is still over the target
					//also, only change it if we're not selected. we're not a toggle.
					if(this.hitTest(HELPER_POINT, true) != null && !this._isSelected)
					{
						this.isSelected = true;
					}
					return;
				}
			}
			else
			{
				for each(touch in touches)
				{
					if(touch.phase == TouchPhase.BEGAN)
					{
						this.touchPointID = touch.id;
						return;
					}
				}
			}
		}
	}
}