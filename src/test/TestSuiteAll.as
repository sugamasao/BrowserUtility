package test {
	import org.flexunit.Assert;
	import test.com.github.sugamasao.browser_utility.*;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]   
	public class TestSuiteAll {
		public var t1:BrowserUtilityUATest;
		public var t2:BrowserUtilityLocationTest;
		public var t3:BrowserUtilityTest;
	}
}
