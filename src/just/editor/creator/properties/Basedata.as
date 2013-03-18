package just.editor.creator.properties
{
	public class Basedata implements Idata
	{
		protected var dataArr:Array;
		public function Basedata()
		{
		}
		protected function init():void
		{
			dataArr=[];
		}
		protected function build():void
		{
			init();
			buildInstanceName();
			buildname();
			buildWidth();
			buildHeight();
		}
		protected function buildInstanceName():void
		{
			pushProperty(getObj("实例名",0,"instance"))
		}
		protected function buildWidth():void
		{
			pushPropertise("width");
		}
		protected function buildHeight():void
		{
			pushPropertise("height")
		}
		protected function buildname():void
		{
			pushPropertise("name");
		}
		protected function pushProperty(obj:Object):void
		{
			dataArr.push(obj);
		}
		protected function pushPropertise(label:String,type:int=0,...data):void
		{
			dataArr.push(getObj.apply(this,[].concat(label,type,data)));
		}
		
		public function get propertiesData():Array
		{
			build()
			return dataArr;
		}
		protected function getObj(label:String,type:int=0,...data):Object
		{
			return {label:label,type:type,data:data};
		}
	}
}