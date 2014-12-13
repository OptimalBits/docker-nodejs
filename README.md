docker-nodejs
=============

#About 

This is a NodeJS image based on the best ubuntu 14.04 image [phusion/baseimage-docker](https://github.com/phusion/baseimage-docker) and [Dockerfile/nodejs](https://github.com/dockerfile/nodejs) which is currently un-tagged and useless for any kind of safe reproducibility on production scenarios.

Check the dockerfile at [github](https://github.com/OptimalBits/docker-nodejs)

#Usage

Just FROM it in your *Dockerfile* like this:

```
FROM optimalbits/nodejs:0.10.33
```

Remember to always specify a valid tag.




