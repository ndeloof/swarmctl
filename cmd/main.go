package main

import (
	"fmt"
	"os"

	"github.com/docker/cli/cli"
	"github.com/docker/cli/cli/command"
	commands "github.com/moby/swarmctl/cmd/root"
)

func main() {
	os.Args = append([]string{"docker"}, os.Args[1:]...)
	dockerCli, err := command.NewDockerCli()
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}

	cmd := commands.RootCommand(dockerCli)
	opts, flags := cli.SetupPluginRootCommand(cmd)
	tcmd := cli.NewTopLevelCommand(cmd, dockerCli, opts, flags)
	tcmd.Initialize() //nolint:errcheck

	cmd, args, err := tcmd.HandleGlobalFlags()
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	// We've parsed global args already, so reset args to those
	// which remain.
	cmd.SetArgs(args)
	err = cmd.Execute()
	if sterr, ok := err.(cli.StatusError); ok {
		if sterr.Status != "" {
			fmt.Fprintln(dockerCli.Err(), sterr.Status)
		}
		// StatusError should only be used for errors, and all errors should
		// have a non-zero exit status, so never exit with 0
		if sterr.StatusCode == 0 {
			os.Exit(1)
		}
		os.Exit(sterr.StatusCode)
	}
	if err != nil {
		fmt.Fprintln(dockerCli.Err(), err)
		os.Exit(1)
	}
}
