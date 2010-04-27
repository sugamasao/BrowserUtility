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
		 *
		 * return Location
		 */
		public static get function location():Location {
			if(!_location) {
				_location = createLocation();
			}
			return _location;
		}

		private static function createBrowser():Browser {
			return new Browser(this.getUserAgentData());
		}

		private static function createLocation():Location {
			return new Location(this.getLocationData());
		}

		private static function getUserAgentData():String {
			if(!ExternalInterface.available) {
				return "";
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

		private static function getLocationData():Object {
			if(!ExternalInterface.available) {
				return {};
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

	/**
	 * Browser Class.
	 * 
	 * this class create by BrowserUtility Class.
	 */
	public class Browser {
		private var _userAgent:String = "";
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
	}

	/**
	 * Location Class.
	 * 
	 * this class create by BrowserUtility Class.
	 */
	public class Location {
		private var _location:Object = null;

		/**
		 * create Location.
		 * 
		 */
		public function Location(location:Object) {
			_lolcation = location;
		}
	}
}

