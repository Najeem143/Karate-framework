package api.runner;

import com.intuit.karate.junit5.Karate;

public class TestRunnerForFeature {
	
	@Karate.Test
	public Karate runTest() {
		
		return Karate.run("classpath.feature")
				.tags("Regression");
		
	}

}
