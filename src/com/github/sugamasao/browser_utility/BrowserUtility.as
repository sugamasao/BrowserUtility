//  -*- coding: utf-8 -*-$
/**
 * com.github.sugamasao.brouser_utility.BrowserUtility クラス
 * repository : http://github.com/sugamasao/browser_utility
 */
package com.github.sugamasao.brouser_utility {

	import flash.external.ExternalInterface;

	/**
	 * BrowserUtility Class(static class).
	 *
	 *  @author sugamasao
	 * - example(Browser)
	 *  var browser:Browser = BrowserUtility.browser
	 *  browser.isIE // true or false
	 *  or
	 *  BrowserUtility.browser.isIE // true or false
	 * 
	 * - example(Location)
	 *  var location:Location = BrowserUtility.location
	 *  location.href // http://example.com
	 *  or
	 *  BrowserUtility.location.href // http://example.com
	 * 
	 */
	public class BrowserUtility {

		// include Version file. "public const VERSION
		include "./Version.as";

		private static var _browser:Browser = null;
		private static var _location:Location = null;

		/**
		 *  this class is static library.
		 *
		 * @throws Error new BrowserUtility.
		 */
		public function BrowserUtility() {
			throw new Error("this class is static library");
		}

		/**
		 * get browser object propertie.
		 * createBrowser() called ExternalInterface
		 *
		 * return Browser
		 */
		public static get function browser():Browser {
			if(!_browser) {
				_browser = createBrowser();
			}
			return _browser;
		}

		/**
		 * get location object propertie.
		 * createBrowser() called ExternalInterface
		 *
		 * return Location
		 */
		public static get function location():Location {
			if(!_location) {
				_location = createLocation();
			}
			return _location;
		}

		/**
		 * refresh Browser object.
		 *
		 * return Browser
		 */
		public static get function refreshBrowser():Browser {
			_browser = null;
			return browser;
		
		/**
		 * refresh Location object.
		 *
		 * return Location
		 */
		public static get function refreshLocation():Location {
			_location = null;
			return location;
		}

		private static function createBrowser():Browser {
			return new Browser(this.getUserAgentData());
		}

		private static function createLocation():Location {
			return new Location(this.getLocationData());
		}

		private static get functionUserAgentData():String {
			if(!ExternalInterface.available) {
				return null;
			}

			var script:String = 
				<![CDATA[
					function() {
						return window.navigator.userAgent;
					}
				]]>
			script = script.replace(/\r?\n?\t|\r/g, "");
			return ExternalInterface.call(script);
		}

		private static get functionLocationData():Object {
			if(!ExternalInterface.available) {
				return null;
			}

			var script:String = 
				<![CDATA[
					function() {
						return document.location;
					}
				]]>
			script = script.replace(/\r?\n?\t|\r/g, "");
			return ExternalInterface.call(script);
		}
	}

//------------------------------------------------------
// Browser Class.
//------------------------------------------------------
	/**
	 * Browser Class.
	 * 
	 * this class create by BrowserUtility Class.
	 */
	public class Browser {
		private var _userAgent:String = null;
		private var _init:Boolean = false;

		// public getters.
		private var _isIE:Boolean = false;
		private var _isFirefox:Boolean = false;
		private var _isSafari:Boolean = false;
		private var _isChrome:Boolean = false;
		private var _isOpera:Boolean = false;
		private var _version:Number = 0;

		/**
		 * create Browser.
		 * 
		 */
		public function Browser(useragent:String) {
			_userAgent = useragent;
		}

		/**
		 * isIE?.
		 *
		 * @return: true is IE.
		 */
		public get function isIE():Boolean {
			parse();
			return _isIE;
		}

		/**
		 * isFirefox?.
		 *
		 * @return: true is Firefox.
		 */
		public get function isFirefox():Boolean {
			parse();
			return _isFirefox;
		}

		/**
		 * isFirefox?.
		 *
		 * @return: true is Firefox.
		 */
		public get function isFirefox():Boolean {
			parse();
			return _isFirefox;
		}

		/**
		 * isSafari?.
		 *
		 * @return: true is Safari.
		 */
		public get function isSafari():Boolean {
			parse();
			return _isSafari;
		}

		/**
		 * isChrome?.
		 *
		 * @return: true is chrome.
		 */
		public get function isChrome():Boolean {
			parse();
			return _isChrome;
		}

		/**
		 * isOpera?.
		 *
		 * @return: true is Opera.
		 */
		public get function isOpera():Boolean {
			parse();
			return _isOpera;
		}

		/**
		 * browser Version.
		 * is Version Number is UA writing Version.
		 *
		 * @return: Number
		 */
		public get function version():Number {
			parse();
			return _version;
		}

		/**
		 * _location object to create parameters.
		 *
		 */
		private function parse():void {
			// already parsed or _userAgent is null.
			if(_init || !_userAgent) {
				return;
			}

			_init = true;
		}
	}

//------------------------------------------------------
// Location Class.
//------------------------------------------------------
	/**
	 * Location Class.
	 * 
	 * this class create by BrowserUtility Class.
	 */
	public class Location {
		private var _location:Object = null;
		private var _init:Boolean = false;

		// public getters.
		private var _hash:String = "";
		private var _host:String = "";
		private var _hostname:String = "";
		private var _href:String = "";
		private var _pathname:String = "";
		private var _port:String = "";
		private var _protocol:String = "";
		private var _search:String = "";

		/**
		 * create Location.
		 * 
		 */
		public function Location(location:Object) {
			_lolcation = location;
		}

		/**
		 * getting JS location.hash.
		 * 
		 * @return: location.hash.
		 */
		public get function hash():String {
			parse();
			return _hash;
		}

		/**
		 * getting JS location.host.
		 * 
		 * @return: location.host.
		 */
		public get function host():String {
			parse();
			return _host;
		}

		/**
		 * getting JS location.hostname.
		 * 
		 * @return: location.hostname.
		 */
		public get function hostname():String {
			parse();
			return _hostname;
		}

		/**
		 * getting JS location.href.
		 * 
		 * @return: location.href.
		 */
		public get function href():String {
			parse();
			return _href;
		}

		/**
		 * getting JS location.pathname.
		 * 
		 * @return: location.hostname.
		 */
		public get function pathname():String {
			parse();
			return _pathname;
		}

		/**
		 * getting JS location.port.
		 * 
		 * @return: location.port.
		 */
		public get function port():String {
			parse();
			return _port;
		}

		/**
		 * getting JS location.protocol.
		 * 
		 * @return: location.protocol.
		 */
		public get function protocol():String {
			parse();
			return _protocol;
		}

		/**
		 * getting JS location.search.
		 * 
		 * @return: location.search.
		 */
		public get function search():String {
			parse();
			return _search;
		}

		/**
		 * _location object to create parameters.
		 *
		 */
		private function parse():void {
			// already parsed or _location is null.
			if(_init || !_location) {
				return;
			}

			// setting parameters.
			_hash = _location.hash;
			_host = _location.host;
			_hostname = _location.hostname;
			_href = _location.href;
			_pathname = _location.pathname;
			_port = _locaiton.port;
			_protocol = _location.protocol;

			_init = true;
		}
	}
}

