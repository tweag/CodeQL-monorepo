package com.example;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class AppTest {

    @Test
    public void testApp() {
        App app = new App();
        String result = app.getMessage();
        assertEquals("Hello, World!", result);
    }
}