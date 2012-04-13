/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - User.as.
 */

package it.ht.rcs.console.accounting.model
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.util.FiberUtils;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.Event;
import flash.events.EventDispatcher;
import mx.binding.utils.ChangeWatcher;
import mx.collections.ArrayCollection;
import mx.events.CollectionEvent;
import mx.events.PropertyChangeEvent;
import mx.validators.ValidationResult;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_User extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _UserEntityMetadata;
    model_internal var _changedObjects:mx.collections.ArrayCollection = new ArrayCollection();

    public function getChangedObjects() : Array
    {
        _changedObjects.addItemAt(this,0);
        return _changedObjects.source;
    }

    public function clearChangedObjects() : void
    {
        _changedObjects.removeAll();
    }

    /**
     * properties
     */
    private var _internal_not_exist : String;
    private var _internal_enabled : Boolean;
    private var _internal_desc : String;
    private var _internal_group_ids : ArrayCollection;
    private var _internal_locale : String;
    private var _internal_contact : String;
    private var _internal_pass : String;
    private var _internal_timezone : int;
    private var _internal_updated_at : String;
    private var _internal__id : String;
    private var _internal_recent_ids : ArrayCollection;
    private var _internal_privs : ArrayCollection;
    private var _internal_dashboard_ids : ArrayCollection;
    private var _internal_name : String;
    private var _internal_created_at : String;
    private var _internal__mid : int;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_User()
    {
        _model = new _UserEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "recent_ids", model_internal::setterListenerRecent_ids));

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get not_exist() : String
    {
        return _internal_not_exist;
    }

    [Bindable(event="propertyChange")]
    public function get enabled() : Boolean
    {
        return _internal_enabled;
    }

    [Bindable(event="propertyChange")]
    public function get desc() : String
    {
        return _internal_desc;
    }

    [Bindable(event="propertyChange")]
    public function get group_ids() : ArrayCollection
    {
        return _internal_group_ids;
    }

    [Bindable(event="propertyChange")]
    public function get locale() : String
    {
        return _internal_locale;
    }

    [Bindable(event="propertyChange")]
    public function get contact() : String
    {
        return _internal_contact;
    }

    [Bindable(event="propertyChange")]
    public function get pass() : String
    {
        return _internal_pass;
    }

    [Bindable(event="propertyChange")]
    public function get timezone() : int
    {
        return _internal_timezone;
    }

    [Bindable(event="propertyChange")]
    public function get updated_at() : String
    {
        return _internal_updated_at;
    }

    [Bindable(event="propertyChange")]
    public function get _id() : String
    {
        return _internal__id;
    }

    [Bindable(event="propertyChange")]
    public function get recent_ids() : ArrayCollection
    {
        return _internal_recent_ids;
    }

    [Bindable(event="propertyChange")]
    public function get privs() : ArrayCollection
    {
        return _internal_privs;
    }

    [Bindable(event="propertyChange")]
    public function get dashboard_ids() : ArrayCollection
    {
        return _internal_dashboard_ids;
    }

    [Bindable(event="propertyChange")]
    public function get name() : String
    {
        return _internal_name;
    }

    [Bindable(event="propertyChange")]
    public function get created_at() : String
    {
        return _internal_created_at;
    }

    [Bindable(event="propertyChange")]
    public function get _mid() : int
    {
        return _internal__mid;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set not_exist(value:String) : void
    {
        var oldValue:String = _internal_not_exist;
        if (oldValue !== value)
        {
            _internal_not_exist = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "not_exist", oldValue, _internal_not_exist));
        }
    }

    public function set enabled(value:Boolean) : void
    {
        var oldValue:Boolean = _internal_enabled;
        if (oldValue !== value)
        {
            _internal_enabled = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "enabled", oldValue, _internal_enabled));
        }
    }

    public function set desc(value:String) : void
    {
        var oldValue:String = _internal_desc;
        if (oldValue !== value)
        {
            _internal_desc = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "desc", oldValue, _internal_desc));
        }
    }

    public function set group_ids(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_group_ids;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_group_ids = value;
            }
            else if (value is Array)
            {
                _internal_group_ids = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_group_ids = null;
            }
            else
            {
                throw new Error("value of group_ids must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "group_ids", oldValue, _internal_group_ids));
        }
    }

    public function set locale(value:String) : void
    {
        var oldValue:String = _internal_locale;
        if (oldValue !== value)
        {
            _internal_locale = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "locale", oldValue, _internal_locale));
        }
    }

    public function set contact(value:String) : void
    {
        var oldValue:String = _internal_contact;
        if (oldValue !== value)
        {
            _internal_contact = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "contact", oldValue, _internal_contact));
        }
    }

    public function set pass(value:String) : void
    {
        var oldValue:String = _internal_pass;
        if (oldValue !== value)
        {
            _internal_pass = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "pass", oldValue, _internal_pass));
        }
    }

    public function set timezone(value:int) : void
    {
        var oldValue:int = _internal_timezone;
        if (oldValue !== value)
        {
            _internal_timezone = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "timezone", oldValue, _internal_timezone));
        }
    }

    public function set updated_at(value:String) : void
    {
        var oldValue:String = _internal_updated_at;
        if (oldValue !== value)
        {
            _internal_updated_at = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "updated_at", oldValue, _internal_updated_at));
        }
    }

    public function set _id(value:String) : void
    {
        var oldValue:String = _internal__id;
        if (oldValue !== value)
        {
            _internal__id = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_id", oldValue, _internal__id));
        }
    }

    public function set recent_ids(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_recent_ids;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_recent_ids = value;
            }
            else if (value is Array)
            {
                _internal_recent_ids = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_recent_ids = null;
            }
            else
            {
                throw new Error("value of recent_ids must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "recent_ids", oldValue, _internal_recent_ids));
        }
    }

    public function set privs(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_privs;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_privs = value;
            }
            else if (value is Array)
            {
                _internal_privs = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_privs = null;
            }
            else
            {
                throw new Error("value of privs must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "privs", oldValue, _internal_privs));
        }
    }

    public function set dashboard_ids(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_dashboard_ids;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_dashboard_ids = value;
            }
            else if (value is Array)
            {
                _internal_dashboard_ids = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_dashboard_ids = null;
            }
            else
            {
                throw new Error("value of dashboard_ids must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dashboard_ids", oldValue, _internal_dashboard_ids));
        }
    }

    public function set name(value:String) : void
    {
        var oldValue:String = _internal_name;
        if (oldValue !== value)
        {
            _internal_name = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "name", oldValue, _internal_name));
        }
    }

    public function set created_at(value:String) : void
    {
        var oldValue:String = _internal_created_at;
        if (oldValue !== value)
        {
            _internal_created_at = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "created_at", oldValue, _internal_created_at));
        }
    }

    public function set _mid(value:int) : void
    {
        var oldValue:int = _internal__mid;
        if (oldValue !== value)
        {
            _internal__mid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_mid", oldValue, _internal__mid));
        }
    }

    /**
     * Data/source property setter listeners
     *
     * Each data property whose value affects other properties or the validity of the entity
     * needs to invalidate all previously calculated artifacts. These include:
     *  - any derived properties or constraints that reference the given data property.
     *  - any availability guards (variant expressions) that reference the given data property.
     *  - any style validations, message tokens or guards that reference the given data property.
     *  - the validity of the property (and the containing entity) if the given data property has a length restriction.
     *  - the validity of the property (and the containing entity) if the given data property is required.
     */

    model_internal function setterListenerRecent_ids(value:flash.events.Event):void
    {
        if (value is mx.events.PropertyChangeEvent)
        {
            if (mx.events.PropertyChangeEvent(value).newValue)
            {
                mx.events.PropertyChangeEvent(value).newValue.addEventListener(mx.events.CollectionEvent.COLLECTION_CHANGE, model_internal::setterListenerRecent_ids);
            }
        }
        _model.invalidateDependentOnRecent_ids();
    }


    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */
    

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();
        var validationFailureMessages:Array = new Array();

        var propertyValidity:Boolean = true;
        if (!_model.recent_idsIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_recent_idsValidationFailureMessages);
        }

        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && propertyValidity;
    }

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
        var oldValue:Boolean = model_internal::_isValid;
        if (oldValue !== value)
        {
            model_internal::_isValid = value;
            _model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }
    }

    /**
     * derived property getters
     */

    [Transient]
    [Bindable(event="propertyChange")]
    public function get _model() : _UserEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _UserEntityMetadata) : void
    {
        var oldValue : _UserEntityMetadata = model_internal::_dminternal_model;
        if (oldValue !== value)
        {
            model_internal::_dminternal_model = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }
    }

    /**
     * methods
     */


    /**
     *  services
     */
    private var _managingService:com.adobe.fiber.services.IFiberManagingService;

    public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
    {
        _managingService = managingService;
    }

    model_internal function set invalidConstraints_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_invalidConstraints;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;
            _model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);
        }
    }

    model_internal function set validationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_validationFailureMessages;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;
            _model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);
        }
    }

    model_internal var _doValidationCacheOfRecent_ids : Array = null;
    model_internal var _doValidationLastValOfRecent_ids : ArrayCollection;

    model_internal function _doValidationForRecent_ids(valueIn:Object):Array
    {
        var value : ArrayCollection = valueIn as ArrayCollection;

        if (model_internal::_doValidationCacheOfRecent_ids != null && model_internal::_doValidationLastValOfRecent_ids == value)
           return model_internal::_doValidationCacheOfRecent_ids ;

        _model.model_internal::_recent_idsIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isRecent_idsAvailable && _internal_recent_ids == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "recent_ids is required"));
        }

        model_internal::_doValidationCacheOfRecent_ids = validationFailures;
        model_internal::_doValidationLastValOfRecent_ids = value;

        return validationFailures;
    }
    

}

}
