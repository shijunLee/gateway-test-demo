package main

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	r := mux.NewRouter()
	r.PathPrefix("/").Handler(http.HandlerFunc(func(rw http.ResponseWriter, r *http.Request) {
		var dataMap = map[string]interface{}{}
		dataMap["url"] = r.RequestURI
		dataMap["header"] = r.Header
		data, _ := json.Marshal(dataMap)
		rw.WriteHeader(200)
		rw.Write(data)
		rw.Header().Set("content-type", "application/json")
	}))
	log.Fatal(http.ListenAndServe("0.0.0.0:8080", r))
}
