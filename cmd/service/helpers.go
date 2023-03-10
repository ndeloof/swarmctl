package service

import (
	"context"
	"io"

	"github.com/docker/cli/cli/command"
	"github.com/docker/docker/pkg/jsonmessage"
	"github.com/moby/swarmctl/cmd/service/progress"
)

// waitOnService waits for the service to converge. It outputs a progress bar,
// if appropriate based on the CLI flags.
func waitOnService(ctx context.Context, dockerCli command.Cli, serviceID string, quiet bool) error {
	errChan := make(chan error, 1)
	pipeReader, pipeWriter := io.Pipe()

	go func() {
		errChan <- progress.ServiceProgress(ctx, dockerCli.Client(), serviceID, pipeWriter)
	}()

	if quiet {
		go io.Copy(io.Discard, pipeReader) //nolint:errcheck
		return <-errChan
	}

	err := jsonmessage.DisplayJSONMessagesToStream(pipeReader, dockerCli.Out(), nil)
	if err == nil {
		err = <-errChan
	}
	return err
}
