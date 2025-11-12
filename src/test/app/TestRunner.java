package com.mycompany;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.DisplayName;

@DisplayName("Karate API Test Runner")
class TestRunner {
    @Karate.Test
    Karate testAllFeatures() {
        return Karate.run("classpath:api")
                .relativeTo(getClass());
    }

    @Karate.Test
    Karate testSmokeTests() {
        return Karate.run("classpath:api/bookStore")
                .tags("@Smoke")
                .relativeTo(getClass());
    }

    @Karate.Test
    Karate testLoginFeature() {
        return Karate.run("classpath:api/account/login.feature")
                .relativeTo(getClass());
    }
}