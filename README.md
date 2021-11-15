# Purpose
I set up this simple `Docker` setup to mine Raptoreum because I was cold and needed a bit more heat, and this seemed to be popular. I also hate using things that aren't in conatiners, so now we have this :D There is a `Dockerfile` in the repo for the provider of the miner, but that's to build, which is more bloated than I need.

# Limitations
- This doesn't get the miner for you yet, because I'm lazy and did this while watching football
- This doesn't have a multi-stage build to generate the benchmark file and then build a final image with the optimization file in it for you to be run with different options, because I'm lazy
- This doesn't use environment variables to pass in your configs, because, well, you get the idea

# Usage
- Download the miner and extract it to the working directory (found [here](https://github.com/WyvernTKC/cpuminer-gr-avx2/releases)
- Edit the `config.json` with your pool address (if applicable), credentials, and algorithm tuning info (I set `threads` to a non-maxed out number, for example). First set `no-tune` to `false` and `force-tune` to `true` for the next step, but after that negate them
- Run the `cpuminer.sh` locally until it generates the `tune_config` file which will allow the miner to figure out what parameters make it fastest. This can increase your results drastically, so it's worth doing.
- After this, negate the values in your config as directed, run `docker-compose build` to get the image built with your correct config and optimization file, and you can run with `docker-compose up -d`