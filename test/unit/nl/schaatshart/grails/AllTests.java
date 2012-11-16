package nl.schaatshart.grails;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({ DonatieStatusControllerTests.class, DonatieTests.class, DonatieControllerTests.class })
public class AllTests {

}
