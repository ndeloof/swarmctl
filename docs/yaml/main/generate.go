package main

import (
	"fmt"
	"os"
	"path/filepath"

	. "github.com/moby/swarmctl/cmd/swarmctl"

	clidocstool "github.com/docker/cli-docs-tool"
	"github.com/docker/cli/cli/command"
	"github.com/spf13/cobra"
)

func generateDocs(opts *options) error {
	dockerCLI, err := command.NewDockerCli()
	if err != nil {
		return err
	}
	cmd := &cobra.Command{
		Use:               "docker",
		DisableAutoGenTag: true,
	}
	cmd.AddCommand(RootCommand(dockerCLI))
	disableFlagsInUseLine(cmd)

	tool, err := clidocstool.New(clidocstool.Options{
		Root:      cmd,
		SourceDir: opts.source,
		TargetDir: opts.target,
		Plugin:    true,
	})
	if err != nil {
		return err
	}
	return tool.GenAllTree()
}

func disableFlagsInUseLine(cmd *cobra.Command) {
	visitAll(cmd, func(ccmd *cobra.Command) {
		// do not add a `[flags]` to the end of the usage line.
		ccmd.DisableFlagsInUseLine = true
	})
}

// visitAll will traverse all commands from the root.
// This is different from the VisitAll of cobra.Command where only parents
// are checked.
func visitAll(root *cobra.Command, fn func(*cobra.Command)) {
	for _, cmd := range root.Commands() {
		visitAll(cmd, fn)
	}
	fn(root)
}

type options struct {
	source string
	target string
}

func main() {
	cwd, _ := os.Getwd()
	opts := &options{
		source: filepath.Join(cwd, "docs", "reference"),
		target: filepath.Join(cwd, "docs", "reference"),
	}
	fmt.Printf("Project root: %s\n", opts.source)
	fmt.Printf("Generating yaml files into %s\n", opts.target)
	if err := generateDocs(opts); err != nil {
		_, _ = fmt.Fprintf(os.Stderr, "Failed to generate documentation: %s\n", err.Error())
	}
}
