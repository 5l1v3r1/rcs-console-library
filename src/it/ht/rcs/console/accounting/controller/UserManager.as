package it.ht.rcs.console.accounting.controller
{
  import it.ht.rcs.console.accounting.model.User;
  import it.ht.rcs.console.controller.ItemManager;
  import it.ht.rcs.console.events.RefreshEvent;
  import it.ht.rcs.console.utils.AlertPopUp;
  
  import mx.collections.ArrayCollection;
  import mx.collections.ArrayList;
  import mx.collections.ListCollectionView;
  import mx.collections.Sort;
  import mx.collections.SortField;
  import mx.core.FlexGlobals;
  import mx.events.CollectionEvent;
  import mx.resources.ResourceManager;
  import mx.rpc.events.FaultEvent;
  import mx.rpc.events.ResultEvent;
  
  public class UserManager extends ItemManager
  {
    /* singleton */
    private static var _instance:UserManager = new UserManager();
    public static function get instance():UserManager { return _instance; } 
    
    public function UserManager()
    {
      super();
    }
    
    override protected function onItemRemove(o:*):void
    { 
      console.currentDB.user.destroy(o);
    }
    
    override protected function onItemUpdate(e:*):void
    { 
      var o:Object = new Object;
      if (e.newValue is ArrayCollection)
        o[e.property] = e.newValue.source;
      else
        o[e.property] = e.newValue;
      console.currentDB.user.update(e.source, o);
    }
    
    override protected function onRefresh(e:RefreshEvent):void
    {
      super.onRefresh(e);
      
      /* system users */
      console.currentDB.user.all(onUserIndexResult);
    }
    
    public function onUserIndexResult(e:ResultEvent):void
    {
      var items:ArrayCollection = e.result as ArrayCollection;
      _items.removeAll();
      items.source.forEach(function toUserArray(element:*, index:int, arr:Array):void {
        addItem(new User(element));
      });
    }
    
    public function reload(u:User):void
    {
      console.currentDB.user.show(u._id, function (e:ResultEvent):void {
        u.enabled = e.result.enabled;
        u.name = e.result.name;
        u.pass = e.result.pass;
        u.desc = e.result.desc;
        u.contact = e.result.contact;
        u.privs = e.result.privs;
        u.locale = e.result.locale;
        u.timezone = e.result.timezone;
        u.group_ids = e.result.group_ids;
      });
    }
      
    public function newUser(callback:Function):void
    {     
      console.currentDB.user.create(User.defaultUser(), function (e:ResultEvent):void {
        var u:User = e.result as User;
        addItem(u);
        callback(u);
      });
    }
    
    public function changePassword(user:User, password:String):void
    {
      console.currentDB.user.update(user, {pass: password}, function (e:ResultEvent):void {
        AlertPopUp.show(ResourceManager.getInstance().getString('localized_main', 'PASSWORD_CHANGED'));
      });
    }
    
    public function update(user:User, properties:Object):void
    {
      console.currentDB.user.update(user, properties);
    }

  }
}