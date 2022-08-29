# gha-redis

## Description
Run Redis.

## Inputs
| Key               | Default | Description                 |
|-------------------|---------|-----------------------------|
| **version**       | `6.0`   | MySql version to use.       |

## Outputs
| Key               | Value                       |
|-------------------|-----------------------------|
| **container-ip**  | IP address of the container |

### Example of step configuration and usage:
```yaml
steps:
  - name: 'Start MySql'
    uses: adore-me/gha-redis@master
    with:
      version: '6.0'
```

You can skip the `with` section if you are ok with the default values.
```yaml
steps:
  - name: 'Run Composer Install'
    uses: adore-me/gha-redis@master
```
