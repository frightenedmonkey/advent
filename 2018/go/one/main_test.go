package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

// I realize this is a silly test; I maintain that I am silly.
func TestParsingStringToInt(t *testing.T) {
	compValues := map[string]int{
		"0":  0,
		"+1": 1,
		"-2": -2,
	}

	for k, v := range compValues {
		assert.Equal(t, v, strtoi(k))
	}
}

func TestCalculatingAListOfValues(t *testing.T) {
	result := calculate(0, "./test_input.txt")

	assert.Equal(t, 3, result)
}
