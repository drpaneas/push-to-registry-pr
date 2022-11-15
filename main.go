package main

import (
	"fmt"
	"html"
	"net/http"
	"runtime/debug"
)

var Commit = func() string {
	if info, ok := debug.ReadBuildInfo(); ok {
		for _, setting := range info.Settings {
			if setting.Key == "vcs.revision" {
				return setting.Value
			}
		}
	}

	return ""
}()

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		_, _ = fmt.Fprintf(w, "Webserver build commit: %q", html.EscapeString(Commit))
	})

	_ = http.ListenAndServe(":8081", nil)

}
