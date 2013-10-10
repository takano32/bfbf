package main

import (
	"fmt"
	"bufio"
	"os"
)

func scan() string {
	reader := bufio.NewReader(os.Stdin)
	input, _ := reader.ReadString('\n')
	return input
}

func header() {
	fmt.Println(`
package main

import (
"fmt"
)

type memory [2000]int32

type Memory struct {
   Pointer int
   Memory memory
}


func (brain *Memory) Next() {
      brain.Pointer = brain.Pointer + 1
}

func (brain *Memory) Prev() {
      brain.Pointer = brain.Pointer - 1
}

func (brain *Memory) Inc() {
      brain.Memory[brain.Pointer] = brain.Memory[brain.Pointer] + 1
}

func (brain *Memory) Dec() {
      brain.Memory[brain.Pointer] = brain.Memory[brain.Pointer] - 1
}

func (brain *Memory) Out() {
      fmt.Print(string(rune(brain.Memory[brain.Pointer])))
}

func (brain *Memory) IsNonZero() bool {
      return brain.Memory[brain.Pointer] != 0
}


func main() {
var BrainMemory *Memory
BrainMemory = &Memory{
Pointer: 0} 
`)
}

func printer(src string) {
	switch src {
	case "+":
		fmt.Println("BrainMemory.Inc()")
	case "-":
		fmt.Println("BrainMemory.Dec()")
	case ".":
		fmt.Println("BrainMemory.Out()")
	case ">":
		fmt.Println("BrainMemory.Next()")
	case "<":
		fmt.Println("BrainMemory.Prev()")
	case "[":
		fmt.Println("for BrainMemory.IsNonZero() {")
	case "]":
		fmt.Println("}")
	}
}

func main() {
	src := scan()
	header()
	for _, chara := range src {
		printer(string(chara))
	}
	fooder()
}

func fooder() {
	fmt.Println("}")
}
