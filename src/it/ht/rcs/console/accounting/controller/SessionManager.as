package it.ht.rcs.console.accounting.controller
{
  
  import flash.filesystem.File;
  import flash.filesystem.FileMode;
  import flash.filesystem.FileStream;
  
  import it.ht.rcs.console.DB;
  import it.ht.rcs.console.IFaultNotifier;
  import it.ht.rcs.console.II18N;
  import it.ht.rcs.console.accounting.model.Session;
  import it.ht.rcs.console.accounting.model.User;
  import it.ht.rcs.console.controller.ItemManager;
  import it.ht.rcs.console.events.RefreshEvent;
  import it.ht.rcs.console.events.SessionEvent;
  import it.ht.rcs.console.utils.AlertPopUp;
  
  import mx.collections.ArrayCollection;
  import mx.collections.ISort;
  import mx.collections.ListCollectionView;
  import mx.collections.Sort;
  import mx.collections.SortField;
  import mx.core.FlexGlobals;
  import mx.events.CloseEvent;
  import mx.resources.ResourceManager;
  import mx.rpc.events.FaultEvent;
  import mx.rpc.events.ResultEvent;
   
  public class SessionManager extends ItemManager
  {
    
    /* singleton */
    private static var _instance:SessionManager = new SessionManager();
    public static function get instance():SessionManager { return _instance; } 
    
    [Bindable]
    public var lastUsername:String;
    [Bindable]
    public var lastServer:String;
    
    private var _errback:Function;
    private var _callback:Function;
    
    public function SessionManager()
    {
      super();
      load_previous();
    }

    /* SESSIONS LIST MANAGEMENT */

    override protected function onRefresh(e:RefreshEvent):void
    {
      super.onRefresh(e);
      DB.instance.session.all(onSessionIndexResult);
    }
    
    public function onSessionIndexResult(e:ResultEvent):void
    {
      var items:ArrayCollection = e.result as ArrayCollection;
      _items.removeAll();
      items.source.forEach(function toUserArray(element:*, index:int, arr:Array):void {
        addItem(element as Session);
      });
    }
    
    public function disconnectUser(u:Object):void
    {
      _items.removeItem(u);
      
      /* disconnect call to db */
      DB.instance.session.destroy(u['cookie']);
    }
    
    override public function getView(sortCriteria:ISort=null, filterFunction:Function=null):ListCollectionView
    {
      /* sorting by time */
      var sort:Sort = new Sort();
      sort.fields = [new SortField('time', true, false, true)];
      return super.getView(sort);
    }
    
    
    /* CURRENT SESSION MANAGEMENT */
    
    public function logout(exitApplication:Boolean = false):void {
    
      trace('SessionManager.logout');
      
      var event:SessionEvent = new SessionEvent(SessionEvent.LOGGING_OUT, false, true);
      FlexGlobals.topLevelApplication.dispatchEvent(event);
      if (event.isDefaultPrevented()) {
        AlertPopUp.show(ResourceManager.getInstance().getString('localized_main', 'CONFIRM_LOGOUT'),
                   ResourceManager.getInstance().getString('localized_main', 'CONFIRM'),
                   AlertPopUp.OK | AlertPopUp.CANCEL, null, function(event:CloseEvent):void {
                                                    if(event.detail == AlertPopUp.OK)
                                                      forceLogout(exitApplication);
                                                  }
                   );
      } else {
        forceLogout(exitApplication);
      }
    }
    
    public function forceLogout(exitApplication:Boolean = false):void {
      
      trace('SessionManager.forceLogout');
      
      var event:SessionEvent = new SessionEvent(SessionEvent.FORCE_LOG_OUT, false, true);
      FlexGlobals.topLevelApplication.dispatchEvent(event);
      
      // TODO: refactor here:  console references are baaaad
      
      /* destroy the current session */
      console.currentSession = null;
      /* request to the DB, ignoring the results */
      if (DB.instance != null && DB.instance.session != null)
        DB.instance.session.logout();
      
      exitApplication ? FlexGlobals.topLevelApplication.exit() : FlexGlobals.topLevelApplication.currentState = console.LOGGED_OUT_STATE;
    }
    
    public function login(user:String, pass:String, server:String, notifier:IFaultNotifier, i18n:II18N, callback:Function, errback:Function):void
    {
      trace('SessionManager.login');
      
      var db:DB;
      
      this.lastUsername = user;
      this.lastServer = server;
      
      /* this is for DEMO purpose only, no database will be contacted, all the data are fake */
      if (user == 'demo' && pass == '' && server == 'demo') {
        DB.instance.connect(server, notifier, i18n, true);
        trace('SessionManager.login -- DEMO MODE');
      } else {
        DB.instance.connect(server, notifier, i18n, false);
      }
      
      /* remember the function for the async handlers */
      _callback = callback;
      _errback = errback;
      
      DB.instance.session.login({user:user, pass:pass}, onLoginResult, onLoginFault);
    }
    
    private function onLoginResult(e:ResultEvent):void
    {
      /* save the info for the next login */
      save_previous();
      
      /* save the current session */
      var sess:Session = e.result as Session;
      sess.server = lastServer;
      
      /* invoke the callback */
      _callback(sess);
    }
    
    private function onLoginFault(e:FaultEvent):void
    {
      /* HTTP 403 is "not authorized" */
      if (e.statusCode == 403) {
        _errback('Incorrect Username or Password...');
        return;
      }
      
      _errback('Cannot connect to server');
    }
    
    private function load_previous():void
    {
      try {
        var s:FileStream = new FileStream();
        var f:File = File.applicationStorageDirectory.resolvePath("login.info");
        s.open(f, FileMode.READ);
        var lastLogon:Object = s.readObject();
        this.lastUsername = lastLogon.username;
        this.lastServer = lastLogon.server;
        s.close();
      } catch(e:*) {
        /* in case the file does not exist */
      }
    }
    
    private function save_previous():void
    {
      try {
        var s:FileStream = new FileStream();
        var f:File = File.applicationStorageDirectory.resolvePath("login.info");
        s.open(f, FileMode.WRITE);
        var lastLogon:Object = new Object();
        lastLogon.username = this.lastUsername;
        lastLogon.server = this.lastServer;
        s.writeObject(lastLogon);
        s.close();
      } catch(e:*) {        
      }
    }
    
  }
  
}