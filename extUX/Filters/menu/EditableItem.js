/*
 * Ext JS Library 2.1
 * Copyright(c) 2006-2008, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */

Ext.menu.EditableItem = Ext.extend(Ext.menu.BaseItem, {
    itemCls : "x-menu-item",
    hideOnClick: false,
    
    initComponent: function(){
      Ext.menu.EditableItem.superclass.initComponent.call(this);
    	this.addEvents('keyup');
    	
			this.editor = this.editor || new Ext.form.TextField();
			if(this.text) {
				this.editor.setValue(this.text);
      }
    },
	
	onRender: function(container){
        var s = container.createChild({
        	cls: this.itemCls,
        	html: String.format(
                '<img src="{0}" class="x-menu-item-icon x-menu-editable-icon {1}" />',
                this.icon || Ext.BLANK_IMAGE_URL, this.iconCls || '')
		});	
    
        Ext.apply(this.config, {width: 125});
        this.editor.render(s);
        
        this.el = s;
        this.relayEvents(this.editor.el, ["keyup"]);
        
        if(Ext.isGecko) {
    			s.setStyle('overflow', 'auto');
        }
			
        Ext.menu.EditableItem.superclass.onRender.call(this, container);
    },
    
    getValue: function(){
    	return this.editor.getValue();
    },
    
    setValue: function(value){
    	this.editor.setValue(value);
    },
    
    isValid: function(preventMark){
    	return this.editor.isValid(preventMark);
    }
});