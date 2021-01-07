/**
 * @license Copyright (c) 2003-2020, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	config.language = 'tw';
	config.uiColor = '#3399CC';
	config.extraPlugins = 'imgur';
	 // Get your client-id from https://api.imgur.com/oauth2/addclient
    config.imgurClientID = 'c24514ec280765d';
	config.imgurClientSecret = '1f0cee3a480794af932ad85472ad375ada6ac740';
	
	config.width=680;
    config.height=500;	
};
