package it.ht.rcs.console.network.rest
{
  import it.ht.rcs.console.network.model.Collector;
  
  import mx.collections.ArrayCollection;
  import mx.rpc.events.ResultEvent;
  
  public class DBNetworkDemo implements IDBNetwork
  {
    
    public function all(onResult:Function=null, onFault:Function=null):void
    {
      var items:ArrayCollection;
      var a:Array = [
        new Collector({name:    'Collector node 1',  _id: 'c1',  prev:   null,  next: ['a0'],  address: '192.168.1.101', type:  'local', port:    0, _mid:  1, configured:  true, desc: 'Desc 192.168.1.101', instance: '525C4E89CDE6244A444EA4D23F482ED3RSS', poll: false, created_at: '2011-06-22T17:29:41+02:00', updated_at: '2011-06-22T17:29:41+02:00', version: 0}),
        new Collector({name:    'Collector node 2',  _id: 'c2',  prev:   null,  next:   null,  address: '192.168.1.102', type:  'local', port:    0, _mid:  9, configured:  true, desc: 'Desc 192.168.1.102', instance: 'dbca550f1174f3028308344c4d58545dRSS', poll: false, created_at: '2011-06-22T17:29:41+02:00', updated_at: '2011-06-22T17:29:41+02:00', version: 0}),
        new Collector({name:    'Collector node 3',  _id: 'c3',  prev:   null,  next: ['a1'],  address: '192.168.1.103', type:  'local', port:    0, _mid: 15, configured:  true, desc: 'Desc 192.168.1.103', instance: '0C84BF20AA9B0C54F3AA2CB87AC8C6BARSS', poll: false, created_at: '2011-06-22T17:29:41+02:00', updated_at: '2011-06-22T17:29:41+02:00', version: 0}),
        new Collector({name:    'Collector node 4',  _id: 'c4',  prev:   null,  next:   null,  address: '192.168.1.104', type:  'local', port:    0, _mid: 16, configured:  true, desc: 'Desc 192.168.1.104', instance: 'b943f1f6151bda08b82adfb0b0d21ce6RSS', poll: false, created_at: '2011-06-22T17:29:41+02:00', updated_at: '2011-06-22T17:29:41+02:00', version: 0}),
        new Collector({name:    'Collector node 5',  _id: 'c5',  prev:   null,  next: ['a3'],  address: '192.168.1.105', type:  'local', port:    0, _mid: 17, configured:  true, desc: 'Desc 192.168.1.105', instance: 'c02acdd7e9432d784e867a17f6a5f13cRSS', poll: false, created_at: '2011-06-22T17:29:41+02:00', updated_at: '2011-06-22T17:29:41+02:00', version: 0}),
        new Collector({name:    'Collector node 6',  _id: 'c6',  prev:   null,  next:   null,  address: '192.168.1.106', type:  'local', port:    0, _mid: 18, configured:  true, desc: 'Desc 192.168.1.106', instance: '1252deed693ce0559eaf525558410f3dRSS', poll: false, created_at: '2011-06-22T17:29:41+02:00', updated_at: '2011-06-22T17:29:41+02:00', version: 0}),
        new Collector({name:    'Collector node 7',  _id: 'c7',  prev:   null,  next:   null,  address: '192.168.1.107', type:  'local', port:    0, _mid: 22, configured:  true, desc: 'Desc 192.168.1.107', instance: '6ad98ea6cb3338e48ed5778c6bf8f97fRSS', poll: false, created_at: '2011-06-22T17:29:41+02:00', updated_at: '2011-06-22T17:29:41+02:00', version: 0}),
        new Collector({name: 'Prod Public Address',  _id: 'a0',  prev: ['c1'],  next:   null,  address: '192.168.1.170', type: 'remote', port: 4444, _mid:  3, configured:  true, desc: 'Desc 192.168.1.170', instance:                                    '', poll: false, created_at: '2011-06-22T17:29:41+02:00', updated_at: '2011-06-22T17:29:41+02:00', version: 0}),
        new Collector({name:        'Anonymizer 1',  _id: 'a1',  prev: ['c1'],  next: ['a2'],  address: '192.168.1.171', type: 'remote', port: 4444, _mid: 19, configured:  true, desc: 'Desc 192.168.1.171', instance:                                    '', poll: false, created_at: '2011-06-22T17:29:41+02:00', updated_at: '2011-06-22T17:29:41+02:00', version: 0}),
        new Collector({name:        'Anonymizer 2',  _id: 'a2',  prev: ['a1'],  next:   null,  address: '192.168.1.172', type: 'remote', port: 4444, _mid: 20, configured:  true, desc: 'Desc 192.168.1.172', instance:                                    '', poll: false, created_at: '2011-06-22T17:29:41+02:00', updated_at: '2011-06-22T17:29:41+02:00', version: 0}),
        new Collector({name:        'Anonymizer 3',  _id: 'a3',  prev: ['c5'],  next:   null,  address: '192.168.1.173', type: 'remote', port: 4444, _mid: 21, configured:  true, desc: 'Desc 192.168.1.173', instance:                                    '', poll: false, created_at: '2011-06-22T17:29:41+02:00', updated_at: '2011-06-22T17:29:41+02:00', version: 0}),
        new Collector({name:        'Anonymizer 4',  _id: 'a4',  prev:   null,  next:   null,  address: '192.168.1.174', type: 'remote', port: 4444, _mid: 23, configured:  true, desc: 'Desc 192.168.1.174', instance:                                    '', poll: false, created_at: '2011-06-22T17:29:41+02:00', updated_at: '2011-06-22T17:29:41+02:00', version: 0})];
      items = new ArrayCollection(a);
      
      var event:ResultEvent = new ResultEvent("collector.index", false, true, items);
      if (onResult != null)
        onResult(event);
    }
    
    public function show(id:String, onResult:Function=null, onFault:Function=null):void
    {
    }
    
    public function create(params:Object, onResult:Function=null, onFault:Function=null):void
    {
    }
    
    public function update(collector:Collector, property:Object, onResult:Function=null, onFault:Function=null):void
    {
    }
    
    public function destroy(id:String, onResult:Function=null, onFault:Function=null):void
    {
    }
    
  }
  
}