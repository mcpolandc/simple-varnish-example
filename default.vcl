vcl 4.0;

backend default {
    .host = "https://dog.ceo";
}

sub vcl_recv {
    if (req.method == "GET" && req.url ~ "api/breeds/list/all") {
        return (hash);
    }
    return (pass);
}

sub vcl_hash {
    return (lookup);
}

sub vcl_miss {
    return (fetch);
}

sub vcl_hit {
    return (deliver);
}

sub vcl_backend_response {
    set beresp.http.X-Cacheable = "YES";

    return (deliver);
}

sub vcl_deliver {
    return (deliver);
}