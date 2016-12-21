package com.tomearly;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

@Controller
class HelloWorldController {

    @RequestMapping(value = "/omdbAPI/search/{searchTerm}/{page}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public String getString(@PathVariable("searchTerm") String searchTerm, @PathVariable("page") String pageNumber) throws IOException {
        String x = new OmdbGet().getContent("http://www.omdbapi.com/?s=" + searchTerm + "&page=" + pageNumber);
        return x;
    }
}