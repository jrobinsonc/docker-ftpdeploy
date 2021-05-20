# Docker FTP Deploy

This docker image aims to help with continuous deployment when only FTP can be used.

<https://hub.docker.com/r/jrobinsonc/ftpdeploy/>

## Usage

```shell
image: jrobinsonc/ftpdeploy

pipelines:
  default:
    - step:
        name: Deploy
        #trigger: manual
        deployment: production
        script: 
          - git ftp push -v --syncroot 'dist' --remote-root '$FTP_PATH' -u '$FTP_USER' -p '$FTP_PASS' '$FTP_HOST'
```

⚠️ Remember that the first time you must use `git ftp init` to upload all the files or `git ftp catchup` if the server has already the files:
    
```shell
git ftp init  --syncroot 'dist' --remote-root '$FTP_PATH' -u '$FTP_USER' -p '$FTP_PASS' '$FTP_HOST'
```

For more details about *GIT-FTP*, visit:  
<https://github.com/git-ftp/git-ftp>

## License

Released under the [MIT license](https://raw.githubusercontent.com/jrobinsonc/docker-ftpdeploy/master/LICENSE).
