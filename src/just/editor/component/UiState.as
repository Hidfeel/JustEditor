package just.editor.component
{
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.Scroller;
	import feathers.controls.TabBar;

	public class UiState
	{
		public const FILE:String="文件";
		public const NEWFILE:String="新建";
		public const SAVEFILE:String="保存";
		public const QUIT:String="退出"
		public const menuLabel:Array=[FILE,"xx","hahah"];
		public const LISTMENU_LABEL:Array=[NEWFILE,SAVEFILE,SAVEFILE];
		public const COMPONENT:Array=[{label:"按钮",data:Button},{label:"文本框",data:Label},{label:"标签页",data:TabBar}];
		
		public var menuclicklabel:String;
		
		public var component:Object;
		public var listlabel:String;
		public function UiState()
		{
		}
	}
}