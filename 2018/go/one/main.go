package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
)

func main() {
	sp := os.Getenv("STARTING")
	starting := 0 // default
	if sp != "" {
		starting = strtoi(sp)
	}

	inputFile := os.Getenv("INPUT_FILE")

	if inputFile == "" {
		inputFile = "input_one.txt"
	}

	result := calculate(starting, inputFile)
	fmt.Println("Got end result", result)
}

// wrapper on strconv.Atoi, but fatal on error
func strtoi(s string) int {
	i, err := strconv.Atoi(s)

	if err != nil {
		log.Fatalf("Error converting to int %s", err)
	}

	return i
}

func calculate(starting int, inputFile string) int {
	input, err := os.Open(inputFile)

	if err != nil {
		log.Fatal(err)
	}

	defer input.Close()

	scan := bufio.NewScanner(input)

	for scan.Scan() {
		starting = starting + strtoi(scan.Text())
	}

	return starting
}
