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

		// UserAgent list. for http://www.openspc2.org/userAgent/
		private var ieList:Array = [
			{ua:'Mozilla/4.0 (compatible; MSIE 4.0; MSN 2.5; Windows 95)', ver:4.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 4.0; Windows 95; DigExt);', ver:4.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 4.0; Windows 95)', ver:4.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 4.01; MSN 2.5; MSN 2.5; Windows 98)', ver:4.01}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 4.01; MSN 2.5; Windows 95)', ver:4.01}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 4.01; MSN 2.5; Windows 98)', ver:4.01}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 4.01; Windows 95)', ver:4.01}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 4.01; Windows 95; Yahoo! JAPAN Version Windows 95/NT CD-ROM Edition 1.0.)', ver:4.01}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 4.01; Windows 98)', ver:4.01}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 4.01; Windows 98; BIGLOBE)', ver:4.01}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 4.01; Windows 98; canoncopyer)', ver:4.01}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 4.01; Windows 98; Compaq)', ver:4.01}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 4.0; Windows 98; DigExt);', ver:4.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 4.01; Windows NT)', ver:4.01}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 4.01; Mac_PowerPC)', ver:4.01}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 4.5; Mac_PowerPC)', ver:4.5}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; AOL 5.0; Windows 98; DigExt)2.26.2000 19:46:43', ver:5.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; MSN 2.5; MSN 2.5; Windows 98; DigExt)', ver:5.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; MSN 2.5; Windows 95; DigExt)3.2.2000 16:2:20 asdf', ver:5.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; MSN 2.5; Windows 98)', ver:5.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; MSN 2.5; Windows 98; DigExt)', ver:5.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; Windows 95)', ver:5.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; Windows 95; DigExt)', ver:5.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; Windows 95; DigExt; i-CABLE)', ver:5.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; Windows 95; DigExt; ocnie5-1)', ver:5.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; Windows 95; Yahoo! JAPAN Version Windows 95/NT CD-ROM Edition 1.0.)', ver:5.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; Windows 95; DigExt);', ver:5.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; Windows 98)', ver:5.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; Windows 98; CNETHomeBuild051099)', ver:5.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; Windows 98; DigExt)', ver:5.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; Windows 98; DigExt; ocnie5-1)', ver:5.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; Windows 98; wn_ie5_ja_v1)', ver:5.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; Windows 98; Yahoo! JAPAN Version Windows 95/NT CD-ROM Edition 1.0.; DigExt)', ver:5.0}, 
		];


		private var chromeList:Array = [
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Chrome/0.2.149.27 Safari/525.13', ver:0.2}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.19 (KHTML, like Gecko) Chrome/1.0.154.48 Safari/525.19', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/530.5 (KHTML, like Gecko) Chrome/2.0.172.33 Safari/530.5', ver:2.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/532.0 (KHTML, like Gecko) Chrome/3.0.195.38 Safari/532.0 ', ver:3.0}
		];

		private var firefoxList:Array = [
			{ua:'Mozilla/5.0 (X11; U; Linux i686; rv:1.7.3) Gecko/20040913 Firefox/0.10', ver:0.10}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.0; rv:1.7.3) Gecko/20040913 Firefox/0.10', ver:0.10}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; rv:1.7.3) Gecko/20040913 Firefox/0.10', ver:0.10}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; rv:1.7.3) Gecko/20041001 Firefox/0.10.1', ver:0.10}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; rv:1.7.3) Gecko/20041001 Firefox/0.10.1', ver:0.10}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.0; rv:1.7.3) Gecko/20041001 Firefox/0.10.1', ver:0.10}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.2; rv:1.7.3) Gecko/20041001 Firefox/0.10.1', ver:0.10}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; ja-JP; rv:1.6) Gecko/20040206 Firefox/0.8', ver:0.8}, 
			{ua:'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.6) Gecko/20040206 Firefox/0.8', ver:0.8}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; ja-JP; rv:1.6) Gecko/20040207 Firefox/0.8', ver:0.8}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.6) Gecko/20040206 Firefox/0.8', ver:0.8}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; ja-JP; rv:1.7) Gecko/20040614 Firefox/0.9', ver:0.9}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; es-ES; rv:1.7) Gecko/20040708 Firefox/0.9', ver:0.9}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; ja-JP; rv:1.7) Gecko/20040707 Firefox/0.9.2', ver:0.9}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.5) Gecko/20041107 Firefox/0.9.2 StumbleUpon/1.994', ver:0.9}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; ja-JP; rv:1.7) Gecko/20040803 Firefox/0.9.3', ver:0.9}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.7) Gecko/20040803 Firefox/0.9.3', ver:0.9}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7) Gecko/20040803 Firefox/0.9.3', ver:0.9}, 
			{ua:'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.7) Gecko/20040803 Firefox/0.9.3', ver:0.9}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.7) Gecko/20040803 Firefox/0.9.3', ver:0.9}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.4) Gecko/20040803 Firefox/0.9.3', ver:0.9}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7) Gecko/20041013 Firefox/0.9.3 (Ubuntu)', ver:0.9}, 
			{ua:'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.7) Gecko/20041013 Firefox/0.9.3 (Ubuntu)', ver:0.9}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.7.5) Gecko/20041107 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Win 9x 4.90; nl-NL; rv:1.7.5) Gecko/20041202 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Win 9x 4.90; nl-NL; rv:1.7.5) Gecko/20041202 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Win98; nl-NL; rv:1.7.5) Gecko/20041202 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.0; de-DE; rv:1.7.5) Gecko/20041108 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.0; de-DE; rv:1.7.5) Gecko/20041122 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-GB; rv:1.7.5) Gecko/20041107 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-GB; rv:1.7.5) Gecko/20041110 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.7.5) Gecko/20041107 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.0; fr-FR; rv:1.7.5) Gecko/20041108 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.0; it-IT; rv:1.7.5) Gecko/20041110 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-DE; rv:1.7.5) Gecko/20041107 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-DE; rv:1.7.5) Gecko/20041108 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-DE; rv:1.7.5) Gecko/20041122 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.7.5) Gecko/20041110 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.5) Gecko/20041107 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.5) Gecko/20041107 Firefox/1.0 StumbleUpon/1.999', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; es-ES; rv:1.7.5) Gecko/20041210 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; fr-FR; rv:1.7.5) Gecko/20041108 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; nl-NL; rv:1.7.5) Gecko/20041202 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; sv-SE; rv:1.7.5) Gecko/20041108 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US; rv:1.7.5) Gecko/20041107 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US; rv:1.8b) Gecko/20050212 Firefox/1.0+ (MOOX M3)', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; WinNT4.0; en-US; rv:1.7.5) Gecko/20041107 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.8b) Gecko/20050118 Firefox/1.0+', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8b) Gecko/20050118 Firefox/1.0+', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; FreeBSD i386; en-US; rv:1.7.5) Gecko/20050103 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i386; en-US; rv:1.7.5) Gecko/20041109 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; de-DE; rv:1.7.5) Gecko/20041128 Firefox/1.0 (Debian package 1.0-4)', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.5) Gecko/20041107 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; ja-JP; rv:1.7.5) Gecko/20041108 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.5) Gecko/20041111 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.5) Gecko/20041111 Firefox/1.0 (Debian package 1.0-2)', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.5) Gecko/20041116 Firefox/1.0 (Ubuntu) (Ubuntu package 1.0-2ubuntu3)', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.5) Gecko/20041119 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.5) Gecko/20041123 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.5) Gecko/20041128 Firefox/1.0 (Debian package 1.0-4)', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.5) Gecko/20041130 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.5) Gecko/20041214 Firefox/1.0 StumbleUpon/1.999', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.5) Gecko/20041219 Firefox/1.0 (Debian package 1.0+dfsg.1-1)', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.5) Gecko/20050110 Firefox/1.0 (Debian package 1.0+dfsg.1-2)', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.7.5) Gecko/20041107 Firefox/1.0', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; nl-NL; rv:1.7.5) Gecko/20050221 Firefox/1.0 (Ubuntu) (Ubuntu package 1.0+dfsg.1-6ubuntu1)', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; rv:1.8b) Gecko/20050124 Firefox/1.0+', ver:1.0}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.6) Gecko/20050306 Firefox/1.0.1 (Debian package 1.0.1-2)', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.6) Gecko/20050223 Firefox/1.0.1', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.6) Gecko/20050225 Firefox/1.0.1', ver:1.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-DE; rv:1.7.6) Gecko/20050226 Firefox/1.0.1', ver:1.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; ja-JP-mac; rv:1.8) Gecko/20051111 Firefox/1.5', ver:1.5}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; ja; rv:1.8) Gecko/20051111 Firefox/1.5', ver:1.5}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8) Gecko/20051111 Firefox/1.5', ver:1.5}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; ja; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1', ver:1.5}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; ja; rv:1.8.0.2) Gecko/20060308 Firefox/1.5.0.2', ver:1.5}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; ja; rv:1.8.0.3) Gecko/20060426 Firefox/1.5.0.3', ver:1.5}, 
			{ua:'Mozilla/5.0 (X11; U; Linux i686; ja; rv:1.8.0.4) Gecko/20060508 Firefox/1.5.0.4', ver:1.5}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; ja; rv:1.8.1.20) Gecko/20081217 Firefox/2.0.0.20', ver:2.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.12) Gecko/20080201 Firefox/2.0.0.12', ver:2.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; ja-JP-mac; rv:1.8.1.20) Gecko/20081217 Firefox/2.0.0.20', ver:2.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 5.1; ja; rv:1.9.0.6) Gecko/2009011913 Firefox/3.0.6', ver:3.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 6.0; ja; rv:1.9.0.6) Gecko/2009011913 Firefox/3.0.6 (.NET CLR 3.5.30729)', ver:3.0}, 
			{ua:'Mozilla/5.0 (Windows; U; Windows NT 6.0; ja; rv:1.9.0.17) Gecko/2009122116 Firefox/3.0.17 GTB6 (.NET CLR 3.5.30729)', ver:3.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; ja-JP-mac; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6', ver:3.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; ja-JP-mac; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6 GTB5', ver:3.0}, 
		];

		private var safariList:Array = [
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/85.7 (KHTML, like Gecko) Safari/85.6', ver:1.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/85.7 (KHTML, like Gecko) Safari/85.7', ver:1.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/85.8.2 (KHTML, like Gecko) Safari/85.8', ver:1.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/85.8.2 (KHTML, like Gecko) Safari/85.8.1', ver:1.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/85.8.5 (KHTML, like Gecko) Safari/85.8', ver:1.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/103u (KHTML, like Gecko) Safari/100.1', ver:1.1}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/124 (KHTML, like Gecko) Safari/125.1', ver:1.2}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/125.2 (KHTML, like Gecko) Safari/125.8', ver:1.2}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/125.4 (KHTML, like Gecko) Safari/125.9', ver:1.2}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/125.5.5 (KHTML, like Gecko) Safari/125.11', ver:1.2}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/125.5.5 (KHTML, like Gecko) Safari/125.12', ver:1.2}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/125.5.5 (KHTML, like Gecko) Safari/125.12', ver:1.2}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; nl-nl) AppleWebKit/125.5.5 (KHTML, like Gecko) Safari/125.12', ver:1.2}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.5.6 (KHTML, like Gecko) Safari/125.12', ver:1.2}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/312.1 (KHTML, like Gecko) Safari/312', ver:1.3}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/312.1.1 (KHTML, like Gecko) Safari/312', ver:1.3}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/312.5 (KHTML, like Gecko) Safari/312.3', ver:1.3}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.5', ver:1.3}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.6', ver:1.3}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/412 (KHTML, like Gecko) Safari/412', ver:2.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/412.6.2 (KHTML, like Gecko) Safari/125.11', ver:1.2}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/412.6.2 (KHTML, like Gecko) Safari/412.2.2', ver:2.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/412.7 (KHTML, like Gecko) Safari/412.5', ver:2.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/416.11 (KHTML, like Gecko) Safari/416.12', ver:2.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/418 (KHTML, like Gecko) Safari/417.9.2', ver:2.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; ja-jp) AppleWebKit/418 (KHTML, like Gecko) Safari/417.9.3', ver:2.0}, 
		// this 'version'
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/522.11.1 (KHTML, like Gecko) Version/3.0.3 Safari/522.12.1', ver:3.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; ja-jp) AppleWebKit/523.10.3 (KHTML, like Gecko) Version/3.0.4 Safari/523.10', ver:3.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/523.10.6 (KHTML, like Gecko) Version/3.0.4 Safari/523.10.6', ver:3.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/523.12 (KHTML, like Gecko) Version/3.0.4 Safari/523.12', ver:3.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/523.12.2 (KHTML, like Gecko) Version/3.0.4 Safari/523.12.2', ver:3.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; ja-jp) AppleWebKit/525.13 (KHTML, like Gecko) Version/3.1 Safari/525.13', ver:3.1}, 
			{ua:'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; ja-jp) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.20', ver:3.1}, 
			{ua:'Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; ja-jp) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.2 Safari/525.22', ver:3.1}, 
			{ua:'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_5; ja-jp) AppleWebKit/525.26.2 (KHTML, like Gecko) Version/3.2 Safari/525.26.12', ver:3.2}, 
			{ua:'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; ja-jp) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16', ver:4.0}, 
			{ua:'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_2; ja-jp) AppleWebKit/531.21.8 (KHTML, like Gecko) Version/4.0.4 Safari/531.21.10', ver:4.0}
		];

		private var operaList:Array = [
			{ua:'Mozilla/4.0 (Windows 95;US) Opera 3.62 [en]', ver:3.62}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; Mac_PowerPC) Opera 6.0 [en]', ver:6.0}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; Windows 2000) Opera 6.01 [ja]', ver:6.01}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; Windows ME) Opera 6.03 [ja]', ver:6.03}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; Windows 2000) Opera 6.05 [ja]', ver:6.05}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; Windows XP) Opera 6.06 [ja]', ver:6.06}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 5.0; Windows 2000) Opera 6.06 [ja]', ver:6.06}, 
			{ua:'Opera 7.11', ver:7.11}, 
			{ua:'Opera/7.23 (Windows NT 5.0; U) [ja]', ver:7.23}, 
			{ua:'Opera/7.52 (Windows NT 5.1; U) [en]', ver:7.52}, 
			{ua:'Opera/7.53 (Windows NT 5.0; U) [ja]', ver:7.53}, 
			{ua:'Opera/7.54 (Windows NT 5.0; U) [ja]', ver:7.54}, 
			{ua:'Opera/7.54 (Windows NT 5.1; U) [en]', ver:7.54}, 
			{ua:'Opera/7.54 (Windows NT 5.1; U) [pl]', ver:7.54}, 
			{ua:'Opera/7.54 (X11; Linux i686; U) [en]', ver:7.54}, 
			{ua:'Opera/7.54 (X11; Linux i686; U) [sv]', ver:7.54}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1) Opera 7.11 [en]', ver:7.11}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1) Opera 7.21 [pt-BR]', ver:7.21}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1) Opera 7.22 [ja]', ver:7.22}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0) Opera 7.23 [ja]', ver:7.23}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0) Opera 7.23 [en]', ver:7.23}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux i686) Opera 7.23 [ja]', ver:7.23}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1) Opera 7.23 [fr]', ver:7.23}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Mac_PowerPC) Opera 7.50 [en]', ver:7.50}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0) Opera 7.53 [en]', ver:7.53}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1) Opera 7.53 [ja]', ver:7.53}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1) Opera 7.54 [ja]', ver:7.54}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0) Opera 7.54 [en]', ver:7.54}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1) Opera 7.54 [en]', ver:7.54}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0) Opera 7.54u1 [ja]', ver:7.54}, 
			{ua:'Opera/7.54 (Windows 98; U) [ja]', ver:7.54}, 
			{ua:'Mozilla/4.78 (Windows NT 5.1; U) Opera 7.23 [ja]', ver:7.23}, 
			{ua:'Mozilla/5.0 (Windows NT 5.0; U) Opera 7.54 [en]', ver:7.54}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; X11; OpenBSD i386) Opera 7.54 [en]', ver:7.54}, 
			{ua:'Opera/8.0 (X11; Linux i686; U; ja)', ver:8.0}, 
			{ua:'Opera/8.01 (Windows ME; U; ja)', ver:8.01}, 
			{ua:'Opera/8.01 (Windows NT 5.1; U; ja)', ver:8.01}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Mac_PowerPC Mac OS X; ja) Opera 8.01', ver:8.01}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; ja) Opera 8.01', ver:8.01}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; tr) Opera 8.02', ver:8.02}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; ja) Opera 8.02', ver:8.02}, 
			{ua:'Opera/8.5 (Windows NT 5.0; U; ja)', ver:8.5}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; ja) Opera 8.5', ver:8.5}, 
			{ua:'Opera/8.51 (Windows NT 5.1; U; ja)', ver:8.51}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; ja) Opera 8.51', ver:8.51}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; de) Opera 8.52', ver:8.52}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; pl) Opera 8.52', ver:8.52}, 
			{ua:'Mozilla/5.0 (Windows NT 5.1; U; ja) Opera 8.52', ver:8.52}, 
			{ua:'Opera/8.53 (Windows NT 5.1; U; ja)', ver:8.53}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; ja) Opera 8.53', ver:8.53}, 
			{ua:'Opera/8.54 (Windows NT 5.1; U; ja)', ver:8.54}, 
			{ua:'Opera/8.54 (Windows NT 5.0; U; ja)', ver:8.54}, 
			{ua:'Mozilla/5.0 (X11; Linux i686; U; cs) Opera 8.54', ver:8.54}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; KDDI-SA39) Opera 8.60 [ja]', ver:8.60}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; ja) Opera 9.00', ver:9.00}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; en) Opera 9.00', ver:9.00}, 
			{ua:'Opera/9.00 (Windows NT 5.1; U; ja)', ver:9.00}, 
			{ua:'Opera/9.0 (Windows NT 5.1; U; en)', ver:9.0}, 
			{ua:'Opera/9.00 (Macintosh; PPC Mac OS X; U; ja)', ver:9.00}, 
			{ua:'Opera/9.02 (Macintosh; PPC Mac OS X; U; ja)', ver:9.02}, 
			{ua:'Opera/9.02 (Windows NT 5.1; U; zh-tw)', ver:9.02}, 
			{ua:'Opera/9.10 (Windows NT 6.0; U; ja)', ver:9.10}, 
			{ua:'Opera/9.21 (Windows NT 6.0; U; ja)', ver:9.21}, 
			{ua:'Opera/9.22 (Windows NT 5.1; U; ja)', ver:9.22}, 
			{ua:'Opera/9.23 (Windows NT 5.1; U; ja)', ver:9.23}, 
			{ua:'Opera/9.23 (Windows ME; U; ja)', ver:9.23}, 
			{ua:'Opera/9.26 (Windows NT 5.1; U; ja)', ver:9.26}, 
			{ua:'Opera/9.51 (Windows NT 5.1; U; ja)', ver:9.51}, 
			{ua:'Opera/9.52 (Macintosh; Intel Mac OS X; U; ja)', ver:9.52}, 
			{ua:'Opera/9.52 (Windows NT 5.1; U; ja)', ver:9.52}, 
			{ua:'Opera/9.60 (Macintosh; Intel Mac OS X; U; ja) Presto/2.1.1', ver:9.60}, 
			{ua:'Opera/9.60 (Windows NT 5.1; U; ja) Presto/2.1.1', ver:9.60}, 
			{ua:'Opera/9.61 (Windows NT 5.1; U; ja) Presto/2.1.1', ver:9.61}, 
			{ua:'Opera/9.62 (Windows NT 5.1; U; ja) Presto/2.1.1', ver:9.62}, 
			{ua:'Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux i686; ja) Opera 10.10', ver:10.10}
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
		
		[Test(description="null test. not Exception rais test"), ]
		public function browserNullTest():void {
			var b:Browser = new Browser(null);
			Assert.assertFalse(b.isIE);
		}

		[Test(description="empty String test. not Exception rais test"), ]
		public function browserEmptyTest():void {
			var b:Browser = new Browser("");
			Assert.assertFalse(b.isIE);
		}

		//-------------------
		// IE
		//-------------------
		[Test(description="isIE tests."), ]
		public function UserAgentIsIETest():void {
			var b:Browser = null;
			for each(var obj:Object in ieList) {
				b = new Browser(obj.ua);
				Assert.assertTrue(b.isIE);
			}
		}

		[Test(description="isIE version tests."), ]
		public function UserAgentIEVersionTest():void {
			var b:Browser = null;
			for each(var obj:Object in ieList) {
				b = new Browser(obj.ua);
				Assert.assertEquals(b.version, Number(obj.ver));
			}
		}

		//-------------------
		// Chrome
		//-------------------
		[Test(description="isChrome tests."), ]
		public function UserAgentIsChromeTest():void {
			var b:Browser = null;
			for each(var obj:Object in chromeList) {
				b = new Browser(obj.ua);
				Assert.assertTrue(b.isChrome);
			}
		}

		[Test(description="isChrome version tests."), ]
		public function UserAgentChromeVersionTest():void {
			var b:Browser = null;
			for each(var obj:Object in chromeList) {
				b = new Browser(obj.ua);
				Assert.assertEquals(b.version, Number(obj.ver));
			}
		}

		//-------------------
		// Firefox
		//-------------------
		[Test(description="isFirefox tests."), ]
		public function UserAgentIsFirefoxTest():void {
			var b:Browser = null;
			for each(var obj:Object in firefoxList) {
				b = new Browser(obj.ua);
				Assert.assertTrue(b.isFirefox);
			}
		}

		[Test(description="isForefox version tests."), ]
		public function UserAgentFirefoxVersionTest():void {
			var b:Browser = null;
			for each(var obj:Object in firefoxList) {
				b = new Browser(obj.ua);
				Assert.assertEquals(b.version, Number(obj.ver));
			}
		}

		//-------------------
		// Safari
		//-------------------
		[Test(description="isSafari tests."), ]
		public function UserAgentIsSafariTest():void {
			var b:Browser = null;
			for each(var obj:Object in safariList) {
				b = new Browser(obj.ua);
				Assert.assertTrue(b.isSafari);
			}
		}

		[Test(description="isSafari version tests."), ]
		public function UserAgentSafariVersionTest():void {
			var b:Browser = null;
			for each(var obj:Object in safariList) {
				b = new Browser(obj.ua);
				Assert.assertEquals(b.version, Number(obj.ver));
			}
		}
		
		//-------------------
		// Opera
		//-------------------
		[Test(description="isOpera tests."), ]
		public function UserAgentIsOperaTest():void {
			var b:Browser = null;
			for each(var obj:Object in operaList) {
				b = new Browser(obj.ua);
				Assert.assertTrue(b.isOpera);
			}
		}

		[Test(description="isOpera version tests."), ]
		public function UserAgentOperaVersionTest():void {
			var b:Browser = null;
			for each(var obj:Object in operaList) {
				b = new Browser(obj.ua);
				Assert.assertEquals(b.version, Number(obj.ver));
			}
		}


	}
}