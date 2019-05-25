FROM klabteam/base:latest

MAINTAINER K-Lab Authors <service@kesci.com>

ENV NB_USER kesci
ENV TERM=dumb

USER $NB_USER

RUN sudo apt-get update && sudo apt-get install -y scala postgresql zsh swig

# Install Jupyter and Py3 packages
RUN mkdir -p ~/.pip/ && \
    pip install jupyter && \
    pip install \
    opencv-python==4.1.0.25 \
    scipy==1.2.0 \
    numpy==1.16.3 \
    scikit-learn==0.21.1 \
    keras==2.2.4 \
    patsy==0.5.1 \
    pandas==0.24.2 \
    theano==1.0.4 \
    xgboost==0.82 \
    statsmodels==0.9.0 \
    tensorflow==1.13.1 \
    line_profiler==2.1.2 \
    orderedmultidict==1.0 \
    smhasher==0.150.1 \
    textblob==0.15.1 \
    h5py==2.8.0.rc1 \
    pudb==2017.1 \
    bokeh==1.0.2 \
    seaborn==0.9.0 \
    pillow==5.3.0 \
    mpld3==0.3 \
    mplleaflet==0.0.5 \
    gpxpy==1.1.2 \
    arrow==0.12.1 \
    sexmachine==0.1.1 \
    geohash==1.0 \
    tpot==0.6.8 \
    haversine==0.4.5 \
    toolz==0.8.2 \
    cytoolz==0.8.2 \
    sacred==0.6.10 \
    plotly==3.9.0 \
    pyecharts==1.1.0 \
    fitter==1.0.8 \
    langid==1.1.6 \
    delorean==0.6.0 \
    trueskill==0.4.4 \
    heamy==0.0.7 \
    vida==0.3 \
    missingno==0.4.0 \
    pandas-profiling==1.4.2 \
    s2sphere==0.2.4 \
    matplotlib-venn==0.11.5 \
    pyldavis==2.1.1 \
    altair==1.2.0 \
    ml_metrics==0.1.4 \
    tables==3.4.2 \
    blaze==0.10.1 \
    pydot==1.2.3 \
    pyparsing==2.1.10 \
    mdp==3.5 \
    rsa==3.4.2 \
    netaddr==0.7.19 \
    bs4==0.0.1 \
    jieba==0.39 \
    lightgbm==2.2.3 \
    xlrd==1.2.0 \
    mxnet==1.4.1 \
    wordcloud==1.5.0 \
    gensim==3.7.3 \
    pygal==2.4.0 \
    cufflinks==0.12.1 \
    scikit-image==0.14.2 \
    bunch==1.0.1 \
    https://download.pytorch.org/whl/cpu/torch-1.1.0-cp36-cp36m-linux_x86_64.whl \
    torchvision \
    lxml==4.2.1 \
    xlearn==0.40a1 \
    networkx==2.3 \
    catboost==0.14.2 \
    mlxtend==0.16.0 \
    librosa==0.6.1 \
    python_speech_features==0.6 \
    sympy==1.2 \
    nltk==3.4.1 \
    NiftyNet==0.3.0 \
    Cython==0.29.7 \
    pyltr==0.2.4 \
    tqdm==4.32.1 \
    bert-tensorflow==1.0.1 \
    pytorch-pretrained-bert==0.6.2 \
    # klab-plugin
    klab-autotime==0.0.2 \
    && \
    jupyter nbextension install --user --py vega

ENV KERAS_BACKEND tensorflow

# Basic python2 packages
RUN python2 -m pip install \
    scipy==0.18.1 \
    numpy==1.12.0 \
    scikit-learn==0.19.1 \
    patsy==0.4.1 \
    pandas==0.19.2 \
    theano==0.8.2 \
    keras==2.1.5 \
    xgboost==0.7.post4 \
    statsmodels==0.8.0 \
    tensorflow==1.2.0 \
    line_profiler==2.0 \
    orderedmultidict==0.7.11 \
    smhasher==0.150.1 \
    textblob==0.11.1 \
    h5py==2.8.0.rc1 \
    pudb==2017.1 \
    bokeh==0.12.4 \
    plotly==2.0.1 \
    lightgbm==2.1.0 \
    bunch==1.0.1 \
    gensim==3.4.0 \
    nltk==3.2.5 \
    textstat==0.4.1 \
    readability==0.2 \
    beautifulsoup4==4.6.0 \
    lxml==4.2.1 \
    jieba==0.39 \
    networkx==2.1 \
    catboost==0.8.1 \
    matplotlib \
    # k-lab plugin
    klab-autotime==0.0.2 && \
    python2 -m pip install -U numpy

ENV LD_LIBRARY_PATH /usr/local/lib:/opt/conda/lib
ENV CFLAGS="-I /opt/conda/lib/python3.6/site-packages/numpy/core/include $CFLAGS"

RUN pip install \
    tornado==4.5.3 \
    hmmlearn==0.2.1 \
    onnx==1.3.0 \
    allennlp==0.8.3 \
    pystan==2.18.0.0 \
    #fbprophet==0.5 \
    ipython-sql==0.3.9 \
    psycopg2-binary==2.8.2 \
    findspark==1.3.0 \
    pyspark==2.4.2 \
    modin==0.5.0 \
    auto-sklearn==0.5.2 \
    https://github.com/facebookresearch/fastText/archive/v0.2.0.zip \
    Wordbatch==1.3.8

# Set spark home
ENV SPARK_HOME=/opt/conda/lib/python3.6/site-packages/pyspark

# Open source toolkit for cheminformatics
# RUN conda install -y rdkit

RUN sudo apt-get update && sudo apt-get install -y scala postgresql zsh

# Julia commonly used packages
RUN julia -e 'import Pkg; Pkg.add("IJulia")' && \
    julia -e 'import Pkg; Pkg.add("Distributions")' && \
    julia -e 'import Pkg; Pkg.add("StatPlots")' && \
    julia -e 'import Pkg; Pkg.add("Query")' && \
    julia -e 'import Pkg; Pkg.add("Missings")' && \
    julia -e 'import Pkg; Pkg.add("PyCall")' && \
    julia -e 'import Pkg; Pkg.add("LaTeXStrings")' && \
    julia -e 'import Pkg; Pkg.add("Flux")' && \
    julia -e 'import Pkg; Pkg.add("Plots")' && \
    julia -e 'import Pkg; Pkg.add("PyPlot")' && \
    julia -e 'import Pkg; Pkg.add("RDatasets")' && \
    julia -e 'import Pkg; Pkg.add("Zygote")' && \
    julia -e 'import Pkg; Pkg.add("Knet")' && \
    julia -e 'import Pkg; Pkg.add("DataFrames")' && \
    julia -e 'import Pkg; Pkg.add("NNlib")' && \
    julia -e 'import Pkg; Pkg.add("Turing")' && \
    julia -e 'import Pkg; Pkg.add("UnicodePlots")' && \
    julia -e 'import Pkg; Pkg.add("PlotlyJS")'

# Install chinese fonts, set minus numbers available,  and set it as default(must be set after matplotlib installed), add tuna mirror pypi souce index
COPY MicrosoftYaHei.ttf /opt/conda/lib/python3.6/site-packages/matplotlib/mpl-data/fonts/ttf/

RUN echo 'font.family         : sans-serif' >> /opt/conda/lib/python3.6/site-packages/matplotlib/mpl-data/matplotlibrc && \
    echo 'font.sans-serif     : Microsoft YaHei, DejaVu Sans, Bitstream Vera Sans, Lucida Grande, Verdana, Geneva, Lucid, Arial, Helvetica, Avant Garde, sans-serif' >> /opt/conda/lib/python3.6/site-packages/matplotlib/mpl-data/matplotlibrc && \
    echo 'axes.unicode_minus  : False' >> /opt/conda/lib/python3.6/site-packages/matplotlib/mpl-data/matplotlibrc && \
    echo "[global]\n\
index-url = https://pypi.tuna.tsinghua.edu.cn/simple\n" > ~/.pip/pip.conf

RUN rm -rf /home/$NB_USER/.cache/pip/*

WORKDIR /home/$NB_USER/work
