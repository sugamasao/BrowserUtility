// -*- coding: utf-8 -*-$
/**
 * com.github.sugamasao.brouser_utility.BrowserUtility クラス
 * repository : http://github.com/sugamasao/browser_utility
 */
package com.github.sugamasao.browser_utility {

	import flash.utils.getQualifiedClassName;

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
		private var _isUnknown:Boolean = false;
		private var _version:Number = 0;

		//----------------------------
		// constents.
		//----------------------------

		// Browser Check String
		private const IE_STRING:String = "msie";
		private const FIREFOX_STRING:String = "firefox/";
		private const SAFARI_STRING:String = "safari/";
		private const OPERA_STRING:String = "opera";
		private const CHROME_STRING:String = "chrome/";

		// get Browser Version ReExp
		private const IE_REGEXP:RegExp =/msie\s*(\d*\.?\d*)/;
		private const FIREFOX_REGEXP:RegExp =/firefox\/(\d*\.?\d*)/;
		private const SAFARI_LEGACY_REGEXP:RegExp =/safari\/(\d*\.?\d*)/;
		private const SAFARI_MODERN_REGEXP:RegExp =/version\/(\d*\.?\d*)/;
		private const SAFARI_REGEXP:RegExp =/safari\/(\d*\.?\d*)/;
		private const OPERA_REGEXP:RegExp =/opera[\/\s](\d*\.?\d*)/;
		private const CHROME_REGEXP:RegExp =/chrome\/(\d*\.?\d*)/;

		/**
		 * create Browser.
		 * 
		 * @param useragent get to ExternalInterface called UserAgent String
		 * @example UserAgent String: <listing version="3.0"> "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; ja-jp) AppleWebKit/531.22.7 (KHTML, like Gecko) Version/4.0.5 Safari/531.22.7" </listing> 
		 */
		public function Browser(useragent:String) {
			_userAgent = useragent;
		}

		/**
		 * isIE?.
		 *
		 * @return true is this Browser.
		 * @default false
		 */
		public function get isIE():Boolean {
			parse();
			return _isIE;
		}

		/**
		 * isFirefox?.
		 *
		 * @return true is this Browser.
		 * @default false
		 */
		public function get isFirefox():Boolean {
			parse();
			return _isFirefox;
		}

		/**
		 * isSafari?.
		 *
		 * @return true is this Browser.
		 * @default false
		 */
		public function get isSafari():Boolean {
			parse();
			return _isSafari;
		}

		/**
		 * isChrome?.
		 *
		 * @return true is this Browser.
		 * @default false
		 */
		public function get isChrome():Boolean {
			parse();
			return _isChrome;
		}

		/**
		 * isOpera?.
		 *
		 * @return true is this Browser.
		 * @default false
		 */
		public function get isOpera():Boolean {
			parse();
			return _isOpera;
		}

		/**
		 * isKnown?.
		 *
		 * @return true is browser check faild.
		 * @default false
		 */
		public function get isUnknown():Boolean {
			parse();
			return _isUnknown;
		}

		/**
		 * browser Version.
		 * is Version Number is UA writing Version.
		 *
		 * @return Browser Version
		 * @default false
		 */
		public function get version():Number {
			parse();
			return _version;
		}

		/**
		 * set UserAgent getter.
		 *
		 * @return UserAgent(String)
		 * @default null
		 */
		public function get userAgent():String {
			return _userAgent;
		}

		/**
		 * toString.
		 *
		 * @return String
		 */
		public function toString():String {
			var array:Array = [];
			
			array.push(getQualifiedClassName(this));
			if(_userAgent) {
				array.push("UserAgent=" + _userAgent);
				array.push("isIE=" + _isIE);
				array.push("isFirefox=" + _isFirefox);
				array.push("isSafari=" + _isSafari);
				array.push("isChrome=" + _isChrome);
				array.push("isOpera=" + _isOpera);
				array.push("isUnknown=" + _isUnknown);
				array.push("version=" + _version);
			} else {
				array.push("UserAgent=" + null);
			}

			return array.join(" ");
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

			var ua:String = _userAgent.toLowerCase();
			try {
				// check browser.
				if(isBrowserCheckIE(ua)) {
					_isIE = true;
					_version = getBrowserVersionIE(ua);
				} else if(isBrowserCheckFirefox(ua)) {
					_isFirefox = true;
					_version = getBrowserVersionFirefox(ua);
				} else if(isBrowserCheckSafari(ua)) {
					_isSafari = true;
					_version = getBrowserVersionSafari(ua);
				} else if(isBrowserCheckOPERA(ua)) {
					_isOpera = true;
					_version = getBrowserVersionOPERA(ua);
				} else if(isBrowserCheckChrome(ua)) {
					_isChrome = true;
					_version = getBrowserVersionChrome(ua);
				} else {
					_isUnknown = true;
				}
			}catch(e:TypeError) {
				_isIE = false;
				_isFirefox = false;
				_isSafari = false;
				_isOpera = false;
				_isChrome = false;
				_isUnknown = true;
				_version = 0;
			}
			_init = true;
		}

		/**
		 * chekc for MSIE.
		 * 
		 * @param ua
		 * @return true is IE
		 */
		private function isBrowserCheckIE(ua:String):Boolean {
			return (ua.search(IE_STRING) != -1) && (ua.search(OPERA_STRING) == -1)
		}

		/**
		 * get for MSIE version.
		 * 
		 * @param ua
		 * @return UA Version Number
		 */
		private function getBrowserVersionIE(ua:String):Number {
			return parseFloat(IE_REGEXP.exec(ua)[1]);
		}

		/**
		 * chekc for Firefox.
		 * 
		 * @param ua
		 * @return true is Firefox
		 */
		private function isBrowserCheckFirefox(ua:String):Boolean {
			return (ua.search(FIREFOX_STRING) != -1);
		}

		/**
		 * get for Firefox version.
		 * 
		 * @param ua
		 * @return UA Version Number
		 */
		private function getBrowserVersionFirefox(ua:String):Number {
			return parseFloat(FIREFOX_REGEXP.exec(ua)[1]);
		}

		/**
		 * chekc for Safari.
		 * 
		 * @param ua
		 * @return true is Safari
		 */
		private function isBrowserCheckSafari(ua:String):Boolean {
			return (ua.search(SAFARI_STRING) != -1) && (ua.search(CHROME_STRING) == -1);
		}

		/**
		 * get for Safari version.
		 * 
		 * @param ua
		 * @return UA Version Number
		 */
		private function getBrowserVersionSafari(ua:String):Number {
			var version:Number = 0;
			if(SAFARI_MODERN_REGEXP.test(ua)) {
				version = parseFloat(SAFARI_MODERN_REGEXP.exec(ua)[1]);
			} else {
				version = parseFloat(SAFARI_LEGACY_REGEXP.exec(ua)[1]);
				if(version >= 400) {
					version = 2.0;
				} else if(version >= 300) {
					version = 1.3;
				} else if(version >= 120) {
					version = 1.2;
				} else if(version >= 100) {
					version = 1.1;
				} else {
					version = 1.0;
				}
			}
			return version;
		}

		/**
		 * chekc for OPERA.
		 * 
		 * @param ua
		 * @return true is OPERA
		 */
		private function isBrowserCheckOPERA(ua:String):Boolean {
			return (ua.search(OPERA_STRING) != -1);
		}

		/**
		 * get for OPERA version.
		 * 
		 * @param ua
		 * @return UA Version Number
		 */
		private function getBrowserVersionOPERA(ua:String):Number {
			return parseFloat(OPERA_REGEXP.exec(ua)[1]);
		}

		/**
		 * chekc for Chrome.
		 * 
		 * @param ua
		 * @return true is Chrome
		 */
		private function isBrowserCheckChrome(ua:String):Boolean {
			return (ua.search(CHROME_STRING) != -1);
		}

		/**
		 * get for Chrome version.
		 * 
		 * @param ua
		 * @return UA Version Number
		 */
		private function getBrowserVersionChrome(ua:String):Number {
			return parseFloat(CHROME_REGEXP.exec(ua)[1]);
		}

	}
}

