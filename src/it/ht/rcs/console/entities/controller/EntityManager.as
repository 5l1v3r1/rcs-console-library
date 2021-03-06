package it.ht.rcs.console.entities.controller
{
  import flash.events.Event;
  import flash.net.FileReference;
  
  import it.ht.rcs.console.DB;
  import it.ht.rcs.console.ObjectUtils;
  import it.ht.rcs.console.agent.controller.AgentManager;
  import it.ht.rcs.console.agent.model.Agent;
  import it.ht.rcs.console.controller.ItemManager;
  import it.ht.rcs.console.dashboard.controller.DashboardController;
  import it.ht.rcs.console.entities.model.Entity;
  import it.ht.rcs.console.entities.model.Position;
  import it.ht.rcs.console.entities.model.Position_attr;
  import it.ht.rcs.console.operation.model.Operation;
  import it.ht.rcs.console.push.PushController;
  import it.ht.rcs.console.push.PushEvent;
  import it.ht.rcs.console.search.controller.SearchManager;
  
  import mx.collections.ArrayCollection;
  import mx.collections.ListCollectionView;
  import mx.events.CollectionEvent;
  import mx.rpc.events.FaultEvent;
  import mx.rpc.events.ResultEvent;

  public class EntityManager extends ItemManager
  {

    public function EntityManager()
    {
      super(Entity);
      PushController.instance.addEventListener(PushEvent.ENTITY, onEntityPush);
    }

    private static var _instance:EntityManager = new EntityManager();

    public static function get instance():EntityManager
    {
      return _instance;
    }

    
    public function listenPush():void
    {
      PushController.instance.addEventListener( PushEvent.ENTITY, onEntityPush);
    }
    public function unlistenPush():void
    {
      PushController.instance.removeEventListener( PushEvent.ENTITY, onEntityPush);
    }
    
    
    override public function refresh():void
    {
      super.refresh();
      DB.instance.entity.all(onResult);
    }

    public function show(_id:String, onResult:Function = null):void
    {
      DB.instance.entity.show(_id, function(re:ResultEvent):void
      {
        var e:Entity = getItem(_id);

        if (e == null)
          addItem(re.result);
        SearchManager.instance.showItem(_id);

        if (onResult != null)
          onResult(re);
      }, function(fe:FaultEvent):void
      {
        SearchManager.instance.showItem(_id);
      });
    }

    public function addPhoto(fileReference:FileReference, id:String, onResult:Function = null, onFault:Function = null):void
    {
      DB.instance.entity.add_photo(fileReference, id, onResult, onFault)
    }

    public function addPhotoFromGrid(entityId:String, gridId:String, targetId:String, onResult:Function, onFault:Function = null):void
    {
      DB.instance.entity.add_photo_from_grid(entityId, gridId, targetId, onResult, onFault)
    }

    public function deletePhoto(entityId:String, photoId:String, onResult:Function, onFault:Function = null):void
    {
      DB.instance.entity.delete_photo(entityId, photoId, onResult, onFault)

    }

    public function addHandle(entityId:String, handle:String, handleName:String, handleType:String, onResult:Function = null, onFault:Function = null):void
    {
      DB.instance.entity.add_handle(entityId, handle, handleName, handleType, onResult, onFault)

    }

    public function addLink(entity1:String, entity2:String, type:String, versus:String, rel:int, onResult:Function = null, onFault:Function = null):void
    {
      DB.instance.entity.add_link(entity1, entity2, type, versus, rel, onResult, onFault)
    }
    
    public function updatePosition(entity:Entity, position:Position, position_attr:Position_attr, onResult:Function = null, onFault:Function = null):void
    {
      var entityToHash:Object = {}
      entityToHash.position = {latitude:position.latitude, longitude: position.longitude}
      entityToHash.position_attr = {accuracy:position_attr.accuracy}
      DB.instance.entity.update(entity, entityToHash)
    }

    public function editLink(entity1:String, entity2:String, type:String, versus:String, rel:int, onResult:Function = null, onFault:Function = null):void
    {
      DB.instance.entity.edit_link(entity1, entity2, type, versus, rel, onResult, onFault)
    }

    public function deleteLink(entity1:String, entity2:String, onResult:Function = null, onFault:Function = null):void
    {
      DB.instance.entity.del_link(entity1, entity2, onResult, onFault)
    }

    public function deleteHandle(entityId:String, handleId:String, onResult:Function, onFault:Function = null):void
    {
      DB.instance.entity.del_handle(entityId, handleId, onResult, onFault)

    }

    public function mostContacted(entityId:String, from:String, to:String, num:String, onResult:Function, onFault:Function = null):void
    {
      DB.instance.entity.most_contacted(entityId, from, to, num, onResult, onFault);
    }
    
    public function mostVisitedUrls(entityId:String, from:String, to:String, num:String, onResult:Function, onFault:Function = null):void
    {
      DB.instance.entity.most_visited_urls(entityId, from, to, num, onResult, onFault);
    }
    
    public function mostVisitedPlaces(entityId:String, from:String, to:String, num:String, onResult:Function, onFault:Function = null):void
    {
      DB.instance.entity.most_visited_places(entityId, from, to, num, onResult, onFault);
    }
    
    public function promoteToTarget(entityId:String, onResult:Function=null, onFault:Function = null):void
    {
      DB.instance.entity.promote_to_target(entityId, onResult, onFault);
    }
      

    private function onEntityPush(e:PushEvent):void
    {
      trace("EntityPush")
     // EntityManager.instance.show(e.data.id as String);

        //EntityManager.instance.refresh();
        //EntityManager.instance.dispatchEvent(new Event(e.data.action));
      
      var entity:Entity;
      switch (e.data.action)
      {
        case PushEvent.CREATE:
          trace("entity creation");
          var position_attr:Position_attr=new Position_attr(e.data.changes.position_attr)
          e.data.changes.position_attr=position_attr;
          var position:Position=new Position(e.data.changes.position)
          e.data.changes.position=position;
          entity=new Entity(e.data.changes);
          if(!getItem(e.data.id))
          addItem(entity);
          break;
        
        
        case PushEvent.MODIFY:
          trace("entity update");
          entity = getItem(e.data.id)
          if(!entity)
            return;
          _items.removeEventListener(CollectionEvent.COLLECTION_CHANGE, onItemsChange);

          if(e.data.changes.position)
          {
            e.data.changes.position=new Position(e.data.changes.position);
          }
          
          for(var property:String in e.data.changes)
          {
            if(entity[property])
            entity[property]= e.data.changes[property];
          }
          _items.addEventListener(CollectionEvent.COLLECTION_CHANGE, onItemsChange);
          break;
        
        
        case PushEvent.DESTROY:
          trace("entity deletion");
          _items.removeEventListener(CollectionEvent.COLLECTION_CHANGE, onItemsChange);
          removeItem(getItem(e.data.id))
          _items.addEventListener(CollectionEvent.COLLECTION_CHANGE, onItemsChange);
          break;
      }
     
    }

    public function getEntityById(id:String):Entity
    {
      var lcv:ListCollectionView = getView();
      
      for (var i:int = 0; i < lcv.length; i++) {
        var entity:Entity = lcv.getItemAt(i) as Entity
        
        if (entity._id == id) {
          return entity;
        }
      }
      
      return null
    }
    
    public function getEntityByTarget(targetId:String):Entity
    {
      var lcv:ListCollectionView = getView();

      for (var i:int = 0; i < lcv.length; i++) {
        var entity:Entity = lcv.getItemAt(i) as Entity

        if (entity.path.getItemAt(entity.path.length - 1) == targetId) {
          return entity;
        }
      }

      return null
    }

    public function addEntity(entity:Entity, o:Operation, callback:Function):void
    {
      var entityToHash:Object = ObjectUtils.toHash(entity);
      entityToHash.position = ObjectUtils.toHash(entity.position);
      entityToHash.position_attr = ObjectUtils.toHash(entity.position_attr);
      DB.instance.entity.create(entityToHash, o, function(e:ResultEvent):void
      {
        var entity:Entity = e.result as Entity;
        addItem(entity);
        refresh()
        SearchManager.instance.showItem(entity._id);
        callback(entity);
      });
    }

    public function merge(entity1:Entity, entity2:Entity, onResult:Function = null, onFault:Function = null):void
    {
      DB.instance.entity.merge(entity1._id, entity2._id, function(e:ResultEvent):void
      {
        DB.instance.entity.all(onResult);
      }, onFault)
    }
    
    public function flow(entities:Array, from:String, to:String,  onResult:Function = null, onFault:Function = null):void
    {
      DB.instance.entity.flow(entities, from, to, onResult, onFault);
    }
    
    public function positions(entities:Array, from:String, to:String,  summary:Boolean, onResult:Function = null, onFault:Function = null):void
    {
      DB.instance.entity.positions(entities, from, to, summary, onResult, onFault);
    }

    override protected function onItemUpdate(event:*):void
    {
      var property:Object = new Object();
      property[event.property] = event.newValue is ArrayCollection ? event.newValue.source : event.newValue;
      DB.instance.entity.update(event.source, property);
    }

    override protected function onItemRemove(item:*):void
    {
      DB.instance.entity.destroy(item._id);
    }

    private function onResult(e:ResultEvent):void
    {
      clear();
      for each (var item:* in e.result.source)
        addItem(item);
      dispatchDataLoadedEvent();
    }

  }

}
