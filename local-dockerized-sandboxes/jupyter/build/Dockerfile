
#this is an update to test using the base notebook - smaller image
FROM jupyter/tensorflow-notebook:latest
ARG AUTO_CONFIG_JSON

pip install nbdefense_jupyter 

jupyter server extension enable nbdefense_jupyter

CMD ["start.sh", "jupyter", "lab", "--ip=0.0.0.0" ]


# current version of jupyterhub/tensorflow-notebook as found: https://hub.docker.com/r/jupyter/tensorflow-notebook/tags?page=1&ordering=last_updated
# and grabbing the tag that is associated with the same build as "latest" while not simply relying on that tag.
# tensorflow-notebook includes: https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-tensorflow-notebook
# dask, pandas, numexpr, matplotlib, scipy, seaborn, scikit-learn, scikit-image, sympy, cython, patsy, statsmodel,
# cloudpickle, dill, numba, bokeh, sqlalchemy, hdf5, vincent, beautifulsoup, protobuf, xlrd, bottleneck, pytables
# ipywidgets, ipympl, facets, tensorflow

