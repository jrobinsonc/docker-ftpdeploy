# Docker FTP Deploy

Docker image to do deployments using FTP.

This is useful when you can't implement a better solution like Capistrano or another alternative. Those solutions require SSH-enabled servers or at least root access to install third-party software to handle the deployment but, what if you only have FTP access? There is where this image becomes handy.

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
