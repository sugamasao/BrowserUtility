//  -*- coding: utf-8 -*-$
package test.com.github.sugamasao.browser_utility
{
	import org.flexunit.Assert;
	import org.hamcrest.*;
	import org.hamcrest.core.*;
	import org.hamcrest.text.*;
	import com.github.sugamasao.browser_utility.*;
	import flash.external.ExternalInterface;

	/**
	 * BrowserUtility Location クラスのテスト用クラス
	 */
	public class BrowserUtilityLocationTest {

		/******************************************************
		* セットアップ実施
		*******************************************************/

		private var _location:Object = null;

		/*
		 * テスト毎に実行される
		 */
		[Before]
		public function alsoRunBeforeEveryTest():void { 
			_location = {};
			_location['hash'] = "#hash";
			_location['host'] = "http://example.com";
			_location['hostname'] = "example.com";
			_location['href'] = "http://example.com/hoge?query=fuga#hash";
			_location['pathname'] = "/hoge";
			_location['port'] = "80";
			_location['protocol'] = "http:";
			_location['search'] = "?query=fuga";
		}

		/*
		 * テスト毎に実行される
		 */
		[After]
		public function runAfterEveryTest():void {
		}

		/******************************************************
		* テスト実施
		*******************************************************/

		[Test(description="location.hash"), ]
		public function locationHashTest():void {
			var location:Location = new Location(_location);
			assertThat(location.hash, containsString(_location.hash));
		}

		[Test(description="location.host"), ]
		public function locationHostTest():void {
			var location:Location = new Location(_location);
			assertThat(location.host, containsString(_location.host));
		}

		[Test(description="location.hostname"), ]
		public function locationHostnameTest():void {
			var location:Location = new Location(_location);
			assertThat(location.hostname, containsString(_location.hostname));
		}

		[Test(description="location.href"), ]
		public function locationHrefTest():void {
			var location:Location = new Location(_location);
			assertThat(location.href, containsString(_location.href));
		}

		[Test(description="location.pathname"), ]
		public function locationPathnameTest():void {
			var location:Location = new Location(_location);
			assertThat(location.pathname, containsString(_location.pathname));
		}

		[Test(description="location.port"), ]
		public function locationPortTest():void {
			var location:Location = new Location(_location);
			assertThat(location.port, containsString(_location.port));
		}

		[Test(description="location.protocol"), ]
		public function locationProtocolTest():void {
			var location:Location = new Location(_location);
			assertThat(location.protocol, containsString(_location.protocol));
		}

		[Test(description="location.search"), ]
		public function locationSearchTest():void {
			var location:Location = new Location(_location);
			assertThat(location.search, containsString(_location.search));
		}

	}
}
