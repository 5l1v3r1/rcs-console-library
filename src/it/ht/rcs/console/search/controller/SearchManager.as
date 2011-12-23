package it.ht.rcs.console.search.controller
{
  import it.ht.rcs.console.DB;
  import it.ht.rcs.console.controller.ItemManager;
  import it.ht.rcs.console.search.model.SearchItem;
  
  import mx.rpc.events.ResultEvent;

  public class SearchManager extends ItemManager
  {
    
    [Bindable]
    public var filter:Object = {};
    
    private static var _instance:SearchManager = new SearchManager();
    public static function get instance():SearchManager { return _instance; }
    
    override public function refresh():void
    {
      super.refresh();
      DB.instance.search.all(filter, onResult);
    }
    
    private function onResult(e:ResultEvent):void
    {
      clear();
      for each (var item:* in e.result.source)
        addItem(item);
    }
    
    public function showItem(id:String, callback:Function):void
    {
      DB.instance.search.show(id, function(e:ResultEvent):void {
        callback(e.result as SearchItem);
      });
    }
    
  }

}