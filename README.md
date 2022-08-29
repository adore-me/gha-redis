# gha-redis

## Description
Run composer install with custom PHP image.

## Inputs
| Key               | Default   | Description                 |
|-------------------|-----------|-----------------------------|
| **version**       | `5.7`     | MySql version to use.       |
| **root-password** | `secret`  | Root password.              |
| **user**          | `adoreme` | Additional user.            |
| **password**      | `secret`  | Additional user's password. |
| **db-name**       | `adoreme` | Database name.              |

## Outputs
| Key               | Value                       |
|-------------------|-----------------------------|
| **container-ip**  | IP address of the container |

### Example of step configuration and usage:
```yaml
steps:
  - name: 'Start MySql'
    uses: adore-me/mysql-action@master
    with:
      version: 5.7
      root-password: ${{ secrets.MYSQL_ROOT_PASSWORD }}
      user: ${{ secrets.MYSQL_USER }}
      password: ${{ secrets.MYSQL_PASSWORD }}
      db-name: ${{ secrets.MYSQL_DB_NAME }}
```

You can skip the `with` section if you are ok with the default values.
```yaml
steps:
  - name: 'Run Composer Install'
    uses: adore-me/mysql-action@master
```
