package ui;

import com.intuit.karate.junit5.Karate;

public class UIRunner {

    @Karate.Test
    Karate test(){
        return Karate.run("webAutomation.feature").tags("@firefox").relativeTo(getClass());
    }
}
