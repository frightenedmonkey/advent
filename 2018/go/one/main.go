package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
)

type duper struct {
	changes     []int
	frequencies map[int]bool
	found       bool
	current     int
	duplicate   int
}

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

	dupe := os.Getenv("FIND_DUPES")

	findDupe := false
	if dupe != "" {
		findDupe, _ = strconv.ParseBool(dupe)
	}

	result := calculate(starting, inputFile, findDupe)
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

func calculate(current int, inputFile string, findDupe bool) int {
	input, err := os.Open(inputFile)

	if err != nil {
		log.Fatal(err)
	}

	defer input.Close()

	scan := bufio.NewScanner(input)

	frequencies := make(map[int]bool)

	frequencies[current] = true

	changes := make([]int, 0)

	// first, build a slice of ints that we will iterate over
	for scan.Scan() {
		changes = append(changes, strtoi(scan.Text()))
	}

	// This is the part one outcome
	if !findDupe {
		for _, f := range changes {
			current = current + f
		}

		return current
	}

	finder := &duper{
		changes:     changes,
		frequencies: frequencies,
		found:       false,
		current:     current,
	}

	for !finder.found {
		finder.find()
	}

	return finder.current
}

func (d *duper) find() {
	for _, i := range d.changes {
		d.current = d.current + i
		// we found a dupe
		if _, ok := d.frequencies[d.current]; ok {
			d.found = true
			return
		}

		d.frequencies[d.current] = true
	}
}
