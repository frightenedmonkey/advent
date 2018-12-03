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

func TestCalculatingAListOfValuesWithoutFindingDupes(t *testing.T) {
	result := calculate(0, "./test_input.txt", false)

	assert.Equal(t, 3, result)
}

func TestFindingTheFirstDupeFrequency(t *testing.T) {
	result := calculate(0, "./test_input.txt", true)
	assert.Equal(t, 2, result)

	result = calculate(0, "./test_input2.txt", true)
	assert.Equal(t, 0, result)

	result = calculate(0, "./test_input3.txt", true)
	assert.Equal(t, 10, result)

	result = calculate(0, "./test_input4.txt", true)
	assert.Equal(t, 5, result)
}
