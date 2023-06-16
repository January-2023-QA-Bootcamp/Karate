package api;

import com.intuit.karate.junit5.Karate;

public class PlayersRunner {

    @Karate.Test
    Karate test(){
        return Karate.run("players-api.feature").tags("@reusable-helper-param").relativeTo(getClass());
    }
}
