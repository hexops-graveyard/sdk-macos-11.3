package main

import (
	"bytes"
	"fmt"
	"io/ioutil"
	"log"
	"os"
)

func main() {
	data, err := ioutil.ReadFile(os.Args[1])
	if err != nil {
		log.Fatal(err)
	}
	var buf bytes.Buffer
	var stripping = false
	for _, line := range bytes.Split(data, []byte{'\n'}) {
		if bytes.HasPrefix(line, []byte("reexported-libraries:")) {
			stripping = true
			continue
		}
		if stripping {
			if len(line) == 0 ||  line[0] == ' ' || line[0] == '\t' {
				continue
			}
			stripping = false
		}
		if !stripping {
			fmt.Fprintf(&buf, "%s\n", line)
		}
	}
	info, err := os.Stat(os.Args[1])
	if err != nil {
		log.Fatal(err)
	}
	if err := ioutil.WriteFile(os.Args[1], buf.Bytes()[:buf.Len()-1], info.Mode()); err != nil {
		log.Fatal(err)
	}
}
