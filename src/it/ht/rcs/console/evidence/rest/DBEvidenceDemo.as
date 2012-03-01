package it.ht.rcs.console.evidence.rest
{
  import mx.rpc.events.ResultEvent;

  public class DBEvidenceDemo implements IDBEvidence
  {
    
    public function all(filter:Object, onResult:Function=null, onFault:Function=null):void
    {
      if (onResult != null)
        onResult(new ResultEvent('evidence.all', false, true));
    }
    
    public function agent_status(params:Object, onResult:Function=null, onFault:Function=null):void
    {
    }
    
    public function sync_start(params:Object, onResult:Function=null, onFault:Function=null):void
    {
    }
    
    public function sync_stop(params:Object, onResult:Function=null, onFault:Function=null):void
    {
    }
    
  }
  
}