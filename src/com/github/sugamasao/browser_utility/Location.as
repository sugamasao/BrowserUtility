//  -*- coding: utf-8 -*-$
/**
 * com.github.sugamasao.brouser_utility.BrowserUtility クラス
 * repository : http://github.com/sugamasao/browser_utility
 */
package com.github.sugamasao.browser_utility {

	import flash.utils.getQualifiedClassName;

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
			_location = location;
		}

		/**
		 * getting JS location.hash.
		 * 
		 * @return location.hash.
		 */
		public function get hash():String {
			parse();
			return _hash;
		}

		/**
		 * getting JS location.host.
		 * 
		 * @return location.host.
		 */
		public function get host():String {
			parse();
			return _host;
		}

		/**
		 * getting JS location.hostname.
		 * 
		 * @return location.hostname.
		 */
		public function get hostname():String {
			parse();
			return _hostname;
		}

		/**
		 * getting JS location.href.
		 * 
		 * @return location.href.
		 */
		public function get href():String {
			parse();
			return _href;
		}

		/**
		 * getting JS location.pathname.
		 * 
		 * @return location.hostname.
		 */
		public function get pathname():String {
			parse();
			return _pathname;
		}

		/**
		 * getting JS location.port.
		 * 
		 * @return location.port.
		 */
		public function get port():String {
			parse();
			return _port;
		}

		/**
		 * getting JS location.protocol.
		 * 
		 * @return location.protocol.
		 */
		public function get protocol():String {
			parse();
			return _protocol;
		}

		/**
		 * getting JS location.search.
		 * 
		 * @return location.search.
		 */
		public function get search():String {
			parse();
			return _search;
		}

		/**
		 * toString.
		 * 
		 * @return String
		 */
		public function toString():String {
			var array:Array = [];
			array.push(getQualifiedClassName(this));
			if(_location) {
				for (var key:String in _location) {
					var value:String = _location[key] ? _location[key] : "null";
					array.push("location[" + key + "]=" + value);
				}
			} else {
				array.push("location = null");
			}

			return array.join(" ");
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
			_hash     = _location.hash ? _location.hash : "";
			_host     = _location.host ? _location.host : "";
			_hostname = _location.hostname ? _location.hostname : "";
			_href     = _location.href ? _location.href : "";
			_pathname = _location.pathname ? _location.pathname : "";
			_port     = _location.port ? _location.port : "";
			_protocol = _location.protocol ? _location.protocol : "";
			_search   = _location.search ? _location.search : "";

			_init = true;
		}
	}
}

