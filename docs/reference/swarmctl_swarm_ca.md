# docker swarmctl swarm ca

<!---MARKER_GEN_START-->
Display and rotate the root CA

### Options

| Name             | Type          | Default     | Description                                                                             |
|:-----------------|:--------------|:------------|:----------------------------------------------------------------------------------------|
| `--ca-cert`      | `pem-file`    |             | Path to the PEM-formatted root CA certificate to use for the new cluster                |
| `--ca-key`       | `pem-file`    |             | Path to the PEM-formatted root CA key to use for the new cluster                        |
| `--cert-expiry`  | `duration`    | `2160h0m0s` | Validity period for node certificates (ns\|us\|ms\|s\|m\|h)                             |
| `-d`, `--detach` |               |             | Exit immediately instead of waiting for the root rotation to converge                   |
| `--external-ca`  | `external-ca` |             | Specifications of one or more certificate signing endpoints                             |
| `-q`, `--quiet`  |               |             | Suppress progress output                                                                |
| `--rotate`       |               |             | Rotate the swarm CA - if no certificate or key are provided, new ones will be generated |


<!---MARKER_GEN_END-->

