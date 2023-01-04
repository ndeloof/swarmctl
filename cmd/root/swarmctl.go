package root

import (
	"fmt"
	dockercli "github.com/docker/cli/cli"
	"github.com/docker/cli/cli/command"
	"github.com/moby/swarmctl/cmd/config"
	"github.com/moby/swarmctl/cmd/node"
	"github.com/moby/swarmctl/cmd/secret"
	"github.com/moby/swarmctl/cmd/service"
	"github.com/moby/swarmctl/cmd/stack"
	"github.com/moby/swarmctl/cmd/swarm"
	"github.com/moby/swarmctl/cmd/version"
	"github.com/spf13/cobra"
)

func RootCommand(cli command.Cli) *cobra.Command {
	var ver bool
	cmd := &cobra.Command{
		Short:            "Swarm Control",
		Use:              "swarmctl COMMAND",
		TraverseChildren: true,
		RunE: func(cmd *cobra.Command, args []string) error {
			if ver {
				return version.NewVersionCommand(cli).Execute()
			}
			if len(args) == 0 {
				return cmd.Help()
			}
			return dockercli.StatusError{
				StatusCode: 16,
				Status:     fmt.Sprintf("unknown swarmctl command: %q", "swarmctl "+args[0]),
			}
		},
	}

	cmd.AddCommand(
		swarm.NewSwarmCommand(cli),
		node.NewNodeCommand(cli),
		secret.NewSecretCommand(cli),
		service.NewServiceCommand(cli),
		config.NewConfigCommand(cli),
		stack.NewStackCommand(cli),
		version.NewVersionCommand(cli),
	)
	cmd.Flags().BoolVarP(&ver, "version", "v", false, "Show the Swarm Controller version information")
	return cmd
}
