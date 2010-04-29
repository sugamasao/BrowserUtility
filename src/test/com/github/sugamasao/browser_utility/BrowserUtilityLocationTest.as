//  -*- coding: utf-8 -*-$
package test.com.github.sugamasao.browser_utility
{
	import org.flexunit.Assert;
	import org.hamcrest.*;
	import org.hamcrest.core.*;
	import org.hamcrest.text.*;
	import com.github.sugamasao.browser_utility.BrowserUtility;
	import flash.external.ExternalInterface;

	/**
	 * BrowserUtility Location クラスのテスト用クラス
	 */
	public class BrowserUtilityLocationTest {

		/******************************************************
		* セットアップ実施
		*******************************************************/

    private var location:Object = null;

		/*
		 * テスト毎に実行される
		 */
		[Before]
		public function alsoRunBeforeEveryTest():void { 
      if(ExternalInterface.available) {
        location = ExternalInterface.call('function(){return window.location;}');
      }
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
			assertThat(BrowserUtility.location.hash, containsString(location.hash));
		}

		[Test(description="location.host"), ]
		public function locationHostTest():void {
			assertThat(BrowserUtility.location.host, containsString(location.host));
		}

		[Test(description="location.hostname"), ]
		public function locationHostnameTest():void {
			assertThat(BrowserUtility.location.hostname, containsString(location.hostname));
		}

		[Test(description="location.href"), ]
		public function locationHrefTest():void {
			assertThat(BrowserUtility.location.href, containsString(location.href));
		}

		[Test(description="location.pathname"), ]
		public function locationPathnameTest():void {
			assertThat(BrowserUtility.location.pathname, containsString(location.pathname));
		}

		[Test(description="location.port"), ]
		public function locationPortTest():void {
			assertThat(BrowserUtility.location.port, containsString(location.port));
		}

		[Test(description="location.protocol"), ]
		public function locationProtocolTest():void {
			assertThat(BrowserUtility.location.protocol, containsString(location.protocol));
		}

		[Test(description="location.search"), ]
		public function locationSearchTest():void {
			assertThat(BrowserUtility.location.search, containsString(location.search));
		}

	}
}
