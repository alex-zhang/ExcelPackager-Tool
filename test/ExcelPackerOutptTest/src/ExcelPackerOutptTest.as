package
{
	import com.fireflyLib.utils.dataRepo.DataRepository;
	import com.fireflyLib.utils.dataRepo.DataTable;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.utils.ByteArray;
	import flash.utils.getTimer;
	
	public class ExcelPackerOutptTest extends Sprite
	{
		public function ExcelPackerOutptTest()
		{
			var urlLoader:URLStream = new URLStream();
			urlLoader.addEventListener(Event.COMPLETE, function():void {
				var bytes:ByteArray = new ByteArray();
				urlLoader.readBytes(bytes);
				
				trace(Number(bytes.length / 1024).toFixed(2) + "k");
				
				var dp:DataRepository = new DataRepository();
				dp.deserialize(bytes);

				var t:int = getTimer();
//				dp.findAllTables().forEach(function(table:DataTable, a:*, b:*):void {
//					table.findAll();
//				})

				trace(getTimer() - t);

				trace(dp.toString());
				
				var clientLangTable:DataTable = dp.findTable("ClientLang");
				
				var o:Object = clientLangTable.find("级"); 
				trace(o);
				
//				trace(clientLangTable.fieldNames.join(" "));
			})
			urlLoader.load(new URLRequest("excel.data"));
		}
	}
}