# Docker container for Serverless development with Python

Automated Docker build for the Serverless framework

This is based off my methodology of running serverless Python application. Details on the entire
setup [can be found in this blog
post ](http://blog.brianz.bz/post/structuring-serverless-applications-with-python/)

These images are built in Docker Cloud. The Serverless version to
build is specified as a build `ARG` (build argument) which is set
using `--build-arg` during the `docker build` command.  To pass this
argument, we need a Docker Cloud build hook which resides in
`hooks/build`.

# Instructions for updating versions

In order to bump the Serverless version, the only real requirement is
to change the version in the `hooks/build` file.  The `Makefile` also
has references to the Serverless version, _but this is really for
testing the build locally_.

My workflow is usually:

- Update versions in `Makefile` and run `make build`
- If the build works, update the versions in `hooks/build`
- Create PR
- On merge to `master`, Docker Hub will do the builds automatically for both `latest` and a tagged
  version, where the tag is the Serverless version..

See the following for more information on Docker Cloud build hooks:

https://docs.docker.com/docker-cloud/builds/advanced/#source-repository--branch-clones
