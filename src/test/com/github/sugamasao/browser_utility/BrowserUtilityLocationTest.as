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

		[Test(description="null test. not Exception rais test"), ]
		public function locationNullTest():void {
			var location:Location = new Location(null);
			Assert.assertEquals(location.hash, "");
		}

		[Test(description="empty object test. not Exception rais test"), ]
		public function locationEmptyTest():void {
			var location:Location = new Location({});
			Assert.assertEquals(location.hash, "");
		}


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

		/*********************
		* toString Test
		**********************/
		[Test(description="toString"), ]
		public function toString1Test():void {
			var location:Location = new Location(_location);
			assertThat(location.toString(), containsString("Location"));
			assertThat(location.toString(), containsString("location[hash]=" + _location["hash"]));
			assertThat(location.toString(), containsString("location[host]=" + _location["host"]));
			assertThat(location.toString(), containsString("location[hostname]=" + _location["hostname"]));
			assertThat(location.toString(), containsString("location[href]=" + _location["href"]));
			assertThat(location.toString(), containsString("location[pathname]=" + _location["pathname"]));
			assertThat(location.toString(), containsString("location[port]=" + _location["port"]));
			assertThat(location.toString(), containsString("location[protocol]=" + _location["protocol"]));
			assertThat(location.toString(), containsString("location[search]=" + _location["search"]));
		}
		[Test(description="toString"), ]
		public function toString2Test():void {
			_location["hash"] = null;
			var location:Location = new Location(_location);
			assertThat(location.toString(), containsString("Location"));
			assertThat(location.toString(), containsString("location[hash]=null"));
		}

		[Test(description="toString"), ]
		public function toString3Test():void {
			var location:Location = new Location(null);
			assertThat(location.toString(), containsString("Location"));
			assertThat(location.toString(), containsString("location = null"));
		}

	}
}
