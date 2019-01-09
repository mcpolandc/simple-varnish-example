vcl 4.0;

backend default {
    .host = "doggos";
    .port = "3000";
}

sub vcl_recv {
    if (req.method == "GET" && req.url ~ "api/dogs") {
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