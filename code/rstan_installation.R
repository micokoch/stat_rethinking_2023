# Installing rstan
# https://github.com/rmcelreath/rethinking

# Configuring C Toolchain for Mac
# https://github.com/stan-dev/rstan/wiki/Configuring-C---Toolchain-for-Mac

library(macrtools)
macos_rtools_install()

# Not sure what I'm supposed to do with this.

dotR <- file.path(Sys.getenv("HOME"), ".R")
if (!file.exists(dotR)) dir.create(dotR)
M <- file.path(dotR, "Makevars")
if (!file.exists(M)) file.create(M)
arch <- ifelse(R.version$arch == "aarch64", "arm64", "x86_64")
cat(paste("\nCXX14FLAGS += -O3 -mtune=native -arch", arch, "-ftemplate-depth-256"),
    file = M, sep = "\n", append = FALSE)

# Installing RStan
remove.packages("rstan")
if (file.exists(".RData")) file.remove(".RData")

# Sys.setenv(DOWNLOAD_STATIC_LIBV8 = 1) # only necessary for Linux without the nodejs library / headers
install.packages("rstan", repos = "https://cloud.r-project.org/", dependencies = TRUE)

# Verifying Installation
example(stan_model, package = "rstan", run.dontrun = TRUE)

# How to use rstan
library("rstan") # observe startup messages
options(mc.cores = parallel::detectCores())
rstan_options(auto_write = TRUE)

#######
# Installing CmdStanR
# https://mc-stan.org/cmdstanr/
# we recommend running this is a fresh R session or restarting your current session
install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))
library(cmdstanr)

cmdstanr::install_cmdstan()

# Install `rethinking`
install.packages(c("coda","mvtnorm","devtools","loo","dagitty","shape"))
library(devtools)
devtools::install_github("rmcelreath/rethinking")

