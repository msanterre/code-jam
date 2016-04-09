package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strings"
	"strconv"
	"sort"
)

const (
	InputFilePath  = "B-small-practice.in"
	OutputFilePath = "results.out"
)

func ReadLines(filepath string) []string {
	fmt.Println("Loading file: ", filepath)

	fileContent, err := ioutil.ReadFile(filepath)

	if err != nil {
		fmt.Println("Could not open file")
		panic(err)

	}

	lines := strings.Split(string(fileContent), "\n")
	lines = lines[1 : len(lines)-1]

	return lines
}

func solve(line string) string {
	parts := strings.Split(line, " ")

	// Load
	characters := parts[1:]

	positions := make([]int, len(characters))

	for i, char := range(characters) {
		positions[i], _ = strconv.Atoi(char)
	}

	// Solve
	minutes := 0

	for positions[0] != 0 {
		sort.Sort(sort.Reverse(sort.IntSlice(positions)))
		minutes += 1

		fmt.Println("positions:", positions)

		max := positions[0]
 		min := positions[0]

		for i:= 0; (i < len(positions) && positions[i] > 1); i++ {
			if positions[i] < min {
				min = positions[i]
			}
		}

		if positions[0] != 1 && (len(positions) == 1 || max >= min*2) {
			old := positions[0]
			take := old / 2
			positions[0] = old - take
			positions = append(positions, take)
			continue
		}

		for i := 0; i < len(positions); i++ {
			if positions[i] > 0 {
				positions[i]--
			}
		}
	}

	return strconv.Itoa(minutes)
}

func main() {
	lines := ReadLines(InputFilePath)

	os.Remove(OutputFilePath)
	file, err := os.Create(OutputFilePath)

	if err != nil {
		panic(err)
	}

	for i := 0; i < len(lines); i += 2 {
		line := lines[i] + " " + lines[i+1]

		result := solve(line)
		fmt.Printf("Case #%d: %s\n", (i/2)+1, result)
		fmt.Fprintf(file, "Case #%d: %s\n", (i/2)+1, result)
	}

	fmt.Println("All done!")

}
