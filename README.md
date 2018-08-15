# docker-ftpdeploy

Docker image to deploy files using FTP.

<https://hub.docker.com/r/jrobinsonc/ftpdeploy/>

## Usage

1. Start the container:

    ```shell
    docker run -it -v $(pwd):/root/repo jrobinsonc/ftpdeploy bash
    ```
1. From inside the container you can push files using:

    ```shell
    git ftp init --syncroot /root/repo --remote-root / -u "ftp-user" -p "ftp-pass" "ftp://hostname:21"
    ```

For more details about *GIT-FTP*, visit:  
<https://github.com/git-ftp/git-ftp>

## License

Released under the [MIT license](https://raw.githubusercontent.com/jrobinsonc/docker-ftpdeploy/master/LICENSE).