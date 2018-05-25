# tiniconda
Docker: Tini + Miniconda3

Some distros (see tags) with the tini treatment and Miniconda3. Great for your own base image for a jupyter/singleuser like image. At this point it only contains Miniconda's default packages, so any Jupyter Notebook/Lab/Hub still needs to be installed using your preferred method (pip/conda).

Several clean/minimal utils installed, based on other clean images. This makes Docker files easier to type, without worrying too much about cleaning up every single time. Be careful though, they are quite rigorous.
