//  -*- coding: utf-8 -*-$
package test.com.github.sugamasao.browser_utility
{
	import org.flexunit.Assert;
	import org.hamcrest.*;
	import org.hamcrest.core.*;
	import org.hamcrest.text.*;
	import com.github.sugamasao.browser_utility.BrowserUtility;

	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	import mx.collections.*;
	import mx.controls.*;

	/**
	 * BrowserUtility Browser クラスのテスト用クラス
	 */
	public class BrowserUtilityUATest {

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
		/**
		 * インスタンス化しないことのテスト
		 */
//		[Test(expected="Error", description="new するとエラーになるのを確認"), ]
//		public function loggerNewTest():void {
//			new Logger();
//		}

//		[Test(description="ログ確認のテスト(Int)"), ]
//		public function loggerLogIntTest():void {
//			className = getQualifiedClassName(0);
//			assertThat(Logger.log(10), containsString("10<" + className + ">"));
//		}

	}
}
