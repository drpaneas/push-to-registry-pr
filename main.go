package main

import (
	"fmt"
	"html"
	"log"
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
		_, err := fmt.Fprintf(w, "Webserver build commit: %q", html.EscapeString(Commit))
		if err != nil {
			return
		}
	})

	log.Fatal(http.ListenAndServe(":8081", nil))

}
