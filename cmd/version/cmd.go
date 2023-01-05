package version

import (
	"fmt"
	"strings"

	"github.com/docker/cli/cli"
	"github.com/docker/cli/cli/command"
	"github.com/moby/swarmctl/cmd/stack/formatter"
	"github.com/moby/swarmctl/internal"
	"github.com/spf13/cobra"
)

type versionOptions struct {
	format  string
	short   bool
	version bool
}

func NewVersionCommand(dockerCli command.Cli) *cobra.Command {
	opts := versionOptions{}
	cmd := &cobra.Command{
		Use:   "version [OPTIONS]",
		Short: "Display Swarm Control version",
		Args:  cli.NoArgs,
		RunE: func(cmd *cobra.Command, _ []string) error {
			runVersion(opts)
			return nil
		},
		Annotations: map[string]string{
			"swarm": "manager",
		},
	}
	// define flags for backward compatibility with com.docker.cli
	flags := cmd.Flags()
	flags.StringVarP(&opts.format, "format", "f", "", "Format the output. Values: [pretty | json]. (Default: pretty)")
	flags.BoolVar(&opts.short, "short", false, "Shows only Swarm Controller's version number.")
	flags.BoolVarP(&opts.version, "version", "v", false, "Show the Docker Compose version information")
	flags.MarkHidden("version") //nolint:errcheck

	return cmd
}

func runVersion(opts versionOptions) {
	if opts.short {
		fmt.Println(strings.TrimPrefix(internal.Version, "v"))
		return
	}
	if formatter.Format(opts.format).IsJSON() {
		fmt.Printf("{\"version\":%q, \"commit\":%q}\n", internal.Version, internal.GitCommit)
		return
	}
	fmt.Printf("Swarm Controller version %s - %s\n", internal.Version, internal.GitCommit)
}
