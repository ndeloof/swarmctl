package main

import (
	"fmt"
	"github.com/moby/swarmctl/cmd/config"
	"github.com/moby/swarmctl/cmd/secret"
	"os"

	"github.com/docker/cli/cli"
	"github.com/docker/cli/cli/command"
	"github.com/moby/swarmctl/cmd/node"
	"github.com/moby/swarmctl/cmd/service"
	"github.com/moby/swarmctl/cmd/swarm"
	"github.com/spf13/cobra"
)

func main() {
	os.Args = append([]string{"docker"}, os.Args[1:]...)
	dockerCli, err := command.NewDockerCli()
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}

	cmd := RootCommand(dockerCli)
	opts, flags := cli.SetupPluginRootCommand(cmd)
	tcmd := cli.NewTopLevelCommand(cmd, dockerCli, opts, flags)
	tcmd.Initialize()

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

func RootCommand(cli command.Cli) *cobra.Command {
	cmd := &cobra.Command{
		Short:            "Swarm Control",
		Use:              "swarmctl COMMAND",
		TraverseChildren: true,
	}

	cmd.AddCommand(
		swarm.NewSwarmCommand(cli),
		node.NewNodeCommand(cli),
		secret.NewSecretCommand(cli),
		service.NewServiceCommand(cli),
		config.NewConfigCommand(cli),
	)
	return cmd
}
