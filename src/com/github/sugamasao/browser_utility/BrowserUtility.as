//  -*- coding: utf-8 -*-$
/**
 * com.github.sugamasao.brouser_utility.BrowserUtility クラス
 * repository : http://github.com/sugamasao/browser_utility
 */
package com.github.sugamasao.browser_utility {

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
		include "./../version/Version.as";

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
		 * createBrowser() called ExternalInterface
		 *
		 * @return <code>Browser</code> instance.
		 * 
		 * @see Browser
		 */
		public static function get browser():Browser {
			if(!_browser) {
				_browser = createBrowser();
			}
			return _browser;
		}

		/**
		 * get location object propertie.
		 * 
		 * createBrowser() called ExternalInterface
		 *
		 * @return <code>Location</code> instance.
		 * 
		 * @see Location
		 */
		public static function get location():Location {
			if(!_location) {
				_location = createLocation();
			}
			return _location;
		}

		/**
		 * refresh Browser object.
		 *
		 * ExternalInterface.call again.
		 *
		 * @return <code>Browser</code> instance.
		 * 
		 * @see Browser
		 */
		public static function get refreshBrowser():Browser {
			_browser = null;
			return browser;
		}

		/**
		 * refresh Location object.
		 * 
		 * ExternalInterface.call again.
		 *
		 * @return <code>Location</code> instance.
		 * 
		 * @see Location
		 */
		public static function get refreshLocation():Location {
			_location = null;
			return location;
		}

		private static function createBrowser():Browser {
			return new Browser(getUserAgentData());
		}

		private static function createLocation():Location {
			return new Location(getLocationData());
		}

		private static function getUserAgentData():String {
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

		private static function getLocationData():Object {
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
}
