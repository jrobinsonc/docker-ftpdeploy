# Docker FTP Deploy

This docker image aims to help with continuous deployment when only FTP can be used.

Imagine you want to implement a continuous deployment process in a pipeline for your project but your hosting provider only gives you FTP access, with this image you can set up that in a very easy way.

<https://hub.docker.com/r/jrobinsonc/ftpdeploy/>

## Usage

### Basic usage

1. Start the container:

    ```shell
    docker run -it -v $(pwd):/root/repo jrobinsonc/ftpdeploy bash
    ```
1. To do deployments:

    The first time you must use `git ftp init`:
    
    ```shell
    git ftp init --syncroot /root/repo --remote-root / -u "ftp-user" -p "ftp-pass" "ftp://hostname:21"
    ```
    
    After that you have to change to `git ftp push`:
    
    ```shell
    git ftp push --syncroot /root/repo --remote-root / -u "ftp-user" -p "ftp-pass" "ftp://hostname:21"
    ```

For more details about *GIT-FTP*, visit:  
<https://github.com/git-ftp/git-ftp>

### Integrate into a pipeline

You can use this image in a pipeline to automatically deploy your project.

Doc soon.

## License

Released under the [MIT license](https://raw.githubusercontent.com/jrobinsonc/docker-ftpdeploy/master/LICENSE).
