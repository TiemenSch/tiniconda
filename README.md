# tiniconda
[![](https://images.microbadger.com/badges/version/tiemensch/tiniconda:alpine-3.7.svg)](https://microbadger.com/images/tiemensch/tiniconda:alpine-3.7 "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/tiemensch/tiniconda:alpine-3.7.svg)](https://microbadger.com/images/tiemensch/tiniconda:alpine-3.7 "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/tiemensch/tiniconda:ubuntu-bionic.svg)](https://microbadger.com/images/tiemensch/tiniconda:ubuntu-bionic "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/tiemensch/tiniconda:ubuntu-bionic.svg)](https://microbadger.com/images/tiemensch/tiniconda:ubuntu-bionic "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/tiemensch/tiniconda.svg)](https://microbadger.com/images/tiemensch/tiniconda "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/tiemensch/tiniconda.svg)](https://microbadger.com/images/tiemensch/tiniconda "Get your own image badge on microbadger.com")

Docker: Tini + Miniconda3

Some distros (see tags) with the tini treatment and Miniconda3. Great for your own base image for a jupyter/singleuser like image. At this point it only contains Miniconda's default packages, so any Jupyter Notebook/Lab/Hub still needs to be installed using your preferred method (pip/conda).

Several clean/minimal utils installed, based on other clean images. This makes Docker files easier to type, without worrying too much about cleaning up every single time. Be careful though, they are quite rigorous.
