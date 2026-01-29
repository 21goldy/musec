package main

import (
	"context"
	"log"
	"github.com/supabase-community/supabase-go"
)


func main () {
	var err error

	string API_URL = "https://vkpmvhjqkpvwjsufiafc.supabase.co"
	string API_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZrcG12aGpxa3B2d2pzdWZpYWZjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQ0MDcyNjUsImV4cCI6MjA3OTk4MzI2NX0.UzUlpIlfushxBUMjhVwIZ2blJauITrc-KKlWWC3mN4M"

    client, err := supabase.NewClient(API_URL, API_KEY, &supabase.ClientOptions{})
     if err != nil {
      fmt.Println("Failed to initalize the client: ", err)
     }

	log.Println("✅ Connected to Supabase Postgres")
}
