package main

import (
	"context"
	"fmt"
	"golang.org/x/net/context/ctxhttp"
	"net/http"
	"time"
)

func main() {
	// Create a context with a timeout
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()
		
	// URL to fetch
	url := "https://jsonplaceholder.typicode.com/todos/1"

	// Perform an HTTP GET request using ctxhttp
	resp, err := ctxhttp.Get(ctx, http.DefaultClient, url)
	if err != nil {
		fmt.Printf("Failed to fetch URL: %v\n", err)
		return
	}
	defer resp.Body.Close()

	// Print the status and headers
	fmt.Printf("Status: %s\n", resp.Status)
	fmt.Println("Headers:")
	for key, values := range resp.Header {
		fmt.Printf("  %s: %s\n", key, values)
	}

	// Read and print the body
	body := make([]byte, 512)
	n, _ := resp.Body.Read(body)
	fmt.Printf("Body: %s\n", string(body[:n]))
}