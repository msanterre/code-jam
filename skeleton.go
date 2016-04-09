package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strings"
)

const (
	InputFilePath  = "A-large-practice.in"
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

	return ""
}

func main() {
	lines := ReadLines(InputFilePath)

	os.Remove(OutputFilePath)
	file, err := os.Create(OutputFilePath)

	if err != nil {
		panic(err)
	}

	for i, line := range lines {
		result := solve(line)
		fmt.Println("Problem:", line)
		fmt.Printf("Case #%d: %s\n", i+1, result)
		fmt.Fprintf(file, "Case #%d: %s\n", i+1, result)
	}

	fmt.Println("All done!")

}
