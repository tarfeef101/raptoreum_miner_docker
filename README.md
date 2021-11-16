# Purpose
I set up this simple `Docker` setup to mine Raptoreum because I was cold and needed a bit more heat, and this seemed to be popular. I also hate using things that aren't in containers, so now we have this :D There is a `Dockerfile` in the repo for the provider of the miner, but that's to build, which is more bloated than I need. Also, if you use this without reading/configuring, you're gonna mine for me, so while that's awesome and I appreciate it, you probably don't want to do that, and should read on. When you configure this as instructed, I will get nothing, the only "losses" you'll have are the dev fee for the mining client, which I have nothing to do with. I set those as low as possible, but that's all I can do.

# Usage
- Set the following environment variables, as desired
  - `URL` (str) for the URL to mine to (default value is to `zergpool`). I do recommend something other than the default `flockpool` to encourage decentralization
  - `URL_BACKUP` (str) for the backup URL should the former be unresponsive (default is the `NA` endpoint for `zergpool`)
  - `USERNAME` (str) to set your stratum username
  - `PASSWORD` (str) to set your stratum password
  - `ALGO` (str) to change the algorithm (default is `gr`/ghostminer)
  - `THREADS` (int) to set the amount of threads (not cores) to use, default is unlimited
  - `DONATION` (float) to set the donation amount in percent, default is `0` (will set the minimum, currently `1.75% for gr only`)
  - `TUNE_FULL` (boolean, json style) set to `true` to do an "in-depth" tune, default is `false`
- Uncomment the `volumes` section to mount in a `tune_config` file if you have one generated. Otherwise, the entrypoint script will generate one on startup, which takes a couple hours, then start mining after that. Highly recommend you uncomment this to persist the config file. You may choose to find one online for your CPU, do this at your own discretion.
- Run the service with `docker-compose up -d`, it should pull the latest from `Docker Hub`. If you want to ensure the build is the latest, run `docker-compose up --build -d` to build locally.
