# git-mirror
Build the Docker to mirror the git repositories to local disk. Now, it supports the `git-lfs`.

## Usage
````
docker run --name=git-mirroring \
           -e GIT_LIST=<your git list file> \
           -e PROXY=<proxy> \
           -v <your repos>:/repos \
           edzhu/git-mirror:latest
````
**Options:**
- `GIT_LIST` is the list of git repositories addresses. Each line contains one git repository address. For exmaple,
    ````
    https://user:password@github.com/xxxx/abc.git
    https://user2:password@bitbucket.com/xxx/def.git
    ...
    ````
- `<your repos>` is the root path to store the repositories. Each repository is cloned to the folder, `<repo name>.git`.
- `PROXY` is an optional parameter, which allows you to set the proxy for the git.