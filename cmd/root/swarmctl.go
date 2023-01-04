package root

import (
	"github.com/docker/cli/cli/command"
	"github.com/moby/swarmctl/cmd/config"
	"github.com/moby/swarmctl/cmd/node"
	"github.com/moby/swarmctl/cmd/secret"
	"github.com/moby/swarmctl/cmd/service"
	"github.com/moby/swarmctl/cmd/stack"
	"github.com/moby/swarmctl/cmd/swarm"
	"github.com/spf13/cobra"
)

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
		stack.NewStackCommand(cli),
	)
	return cmd
}
