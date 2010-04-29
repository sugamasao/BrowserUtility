//  -*- coding: utf-8 -*-$
package test.com.github.sugamasao.browser_utility
{
	import org.flexunit.Assert;
	import org.hamcrest.*;
	import org.hamcrest.core.*;
	import org.hamcrest.text.*;
	import com.github.sugamasao.browser_utility.*;

	/**
	 * BrowserUtility Browser クラスのテスト用クラス
	 */
	public class BrowserUtilityUATest {
		// IE UA.
		private var uaIE:Array = [
			"Mozilla/4.0 (compatible; MSIE 4.0; MSN 2.5; Windows 95)",
			"Mozilla/4.0 (compatible; MSIE 4.0; Windows 95; DigExt);",
			"Mozilla/4.0 (compatible; MSIE 4.0; Windows 95)",
			"Mozilla/4.0 (compatible; MSIE 4.01; MSN 2.5; MSN 2.5; Windows 98)",
			"Mozilla/4.0 (compatible; MSIE 4.01; MSN 2.5; Windows 95)",
			"Mozilla/4.0 (compatible; MSIE 4.01; MSN 2.5; Windows 98)",
			"Mozilla/4.0 (compatible; MSIE 4.01; Windows 95)",
			"Mozilla/4.0 (compatible; MSIE 4.01; Windows 95; Yahoo! JAPAN Version Windows 95/NT CD-ROM Edition 1.0.)",
			"Mozilla/4.0 (compatible; MSIE 4.01; Windows 98)",
			"Mozilla/4.0 (compatible; MSIE 4.01; Windows 98; BIGLOBE)",
			"Mozilla/4.0 (compatible; MSIE 4.01; Windows 98; canoncopyer)",
			"Mozilla/4.0 (compatible; MSIE 4.01; Windows 98; Compaq)",
			"Mozilla/4.0 (compatible; MSIE 4.0; Windows 98; DigExt);",
			"Mozilla/4.0 (compatible; MSIE 4.01; Windows NT)",
			"Mozilla/4.0 (compatible; MSIE 4.01; Mac_PowerPC)",
			"Mozilla/4.0 (compatible; MSIE 4.5; Mac_PowerPC)",
			"Mozilla/4.0 (compatible; MSIE 5.0; Mac_PowerPC)",
			"Mozilla/4.0 (compatible; MSIE 5.16; Mac_PowerPC)",
			"Mozilla/4.0 (compatible; MSIE 5.17; Mac_PowerPC)",
			"Mozilla/4.0 (compatible; MSIE 5.22; Mac_PowerPC)",
			"Mozilla/4.0 (compatible; MSIE 5.23; Mac_PowerPC)",
			"Mozilla/4.0 (compatible; MSIE 5.5; Windows 95)",
			"Mozilla/4.0 (compatible; MSIE 5.5; Windows 98)",
			"Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0)",
			"Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; .NET CLR 1.0.3705)",
			"Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; by TSG)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 1.0.3705)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.40607)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.40607; .NET CLR 1.0.3705)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; NOKTURNAL KICKS ASS)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; FDM;",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; Maxthon; .NET CLR 1.1.4322; .NET CLR 2.0.41115)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; .NET CLR 1",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows 98)",
			"Mozilla/4.0 (compatible; MSIE 6.0; AOL 9.0; Windows NT 5.1; iebar; .NET CLR 1.0.3705)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Win32);",
			"Mozilla/4.0 (compatible; MSIE 6.0; Win32); .NET CLR 1.0.3705)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows 98; Hotbar 4.4.6.0)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows 98; Win 9x 4.90)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 4.0)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 4.0; BVG",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; .NET CLR 1.0.3705; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; .NET CLR 1.1.4322; FDM)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; {FF0C8E09-3C86-44CB-834A-B8CEEC80A1D7}; iOpus-I-M)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; i-Nav 3.0.1.0F; .NET CLR 1.0.3705; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; MathPlayer 2.0; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; Maxthon; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; T312461)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0;)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1);",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.0.3705)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 1.0.3705)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 2.0.40607)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Alexa Toolbar)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; BrowserBob)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; DFO-MPO Internet Explorer 6.0)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; ENGINE; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT))",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; ESB{F40811EE-DF17-4BC9-8785-B362ABF34098}; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; FDM)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; FTDv3 Browser; .NET CLR 1.0.3705; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; .NET CLR 2.0.40607)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; FunWebProducts; AtHome033)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; HCI0449; .NET CLR 1.0.3705)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; i-NavFourF; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Maxthon;",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Maxthon; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; MyIE2; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; MyIE2; Maxthon; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Q312461; FunWebProducts; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Woningstichting Den Helder; .NET CLR 1.0.3705)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.41115)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; MyIE2; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; MyIE2; Maxthon; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 6.0; Windows XP)",
			"MSIE 6.0; Windows 2000",
			"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1)",
			"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)",
			"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1)",
			"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)",
			"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30)",
			"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506)",
			"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.1)",
			"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)",
			"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648)",
			"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; InfoPath.1",
			"Mozilla/4.0 (compatible; GoogleToolbar 5.0.2124.2070; Windows 6.0; MSIE8.0.6001.18241)"
		];

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
		[Test(description="isIE tests."), ]
		public function UAISIETest():void {
			var b:Browser = null;
			for each(var ua:String in uaIE) {
				b = new Browser(ua);
				assertThat(b.isIE, true);
			}
		}

	}
}
