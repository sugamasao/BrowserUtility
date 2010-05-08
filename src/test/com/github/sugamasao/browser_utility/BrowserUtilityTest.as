//  -*- coding: utf-8 -*-$
package test.com.github.sugamasao.browser_utility
{
	import org.flexunit.Assert;
	import org.hamcrest.*;
	import org.hamcrest.core.*;
	import org.hamcrest.text.*;
	import com.github.sugamasao.browser_utility.*;

	/**
	 * BrowserUtility クラスのテスト用クラス
	 */
	public class BrowserUtilityTest {

		/******************************************************
		* セットアップ実施
		*******************************************************/

		/*
		 * テスト毎に実行される
		 */
		[Before]
		public function alsoRunBeforeEveryTest():void { 
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

		[Test(description="location object create"), ]
		public function locationCreateTest():void {
			Assert.assertTrue(BrowserUtility.location is Location)
		}

		[Test(description="location object refresh"), ]
		public function locationRefreshTest():void {
			var location:Location = BrowserUtility.location;
			Assert.assertFalse(BrowserUtility.refreshLocation === location);
		}

		[Test(description="browser object create"), ]
		public function browserCreateTest():void {
			Assert.assertTrue(BrowserUtility.browser is Browser)
		}

		[Test(description="browser object refresh"), ]
		public function browserRefreshTest():void {
			var browser:Browser = BrowserUtility.browser;
			Assert.assertFalse(BrowserUtility.refreshBrowser === browser);
		}

		[Test(description="version test"), ]
		public function versionTest():void {
			assertThat(BrowserUtility.VERSION, containsString("v"));
		}

		[Test(description="toString test"), ]
		public function toStringTest():void {
			assertThat(BrowserUtility.toString(), containsString("BrowserUtility version=v"));
		}


	}
}
