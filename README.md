# gha-redis

## Description
Run Redis.

## Inputs
| Key               | Required | Default   | Description             |
|-------------------|----------|-----------|-------------------------|
| **version**       | **true** | `6.0`     | MySql version to use.   |

## Outputs
| Key               | Value                       |
|-------------------|-----------------------------|
| **container-ip**  | IP address of the container |

### Example of step configuration and usage:
```yaml
steps:
  - name: 'Start Redis'
    uses: adore-me/gha-redis@master
    with:
      version: '6.0'
```

You can skip the `with` section if you are ok with the default values.
```yaml
steps:
  - name: 'Start Redis'
    uses: adore-me/gha-redis@master
```
