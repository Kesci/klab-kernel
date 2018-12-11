FROM klabteam/base:latest

MAINTAINER K-Lab Authors <service@kesci.com>

ENV NB_USER kesci

USER $NB_USER

# workaround for "Cannot remove entries from nonexistent file /opt/conda/lib/python3.5/site-packages/easy-install.pth"
#RUN mkdir -p /opt/conda/lib/python3.5/site-packages && touch /opt/conda/lib/python3.5/site-packages/easy-install.pth && touch /opt/conda/lib/python3.5/site-packages/urllib3-1.12-py3.5.egg

# Install Jupyter and Py3 packages
RUN mkdir -p ~/.pip/ && \
    pip install jupyter && \
    # Basic python packages
    pip install \
    opencv-python \
    scipy==1.0.0 \
    numpy==1.14.2 \
    scikit-learn==0.19.1 \
    keras==2.1.5 \
    patsy==0.4.1 \
    pandas==0.22.0 \
    theano==1.0.1 \
    xgboost==0.7.post4 \
    statsmodels==0.8.0 \
    tensorflow==1.12.0 \
    # biopython==1.70 \ will raise error
    line_profiler==2.0 \
    orderedmultidict==0.7.11 \
    smhasher==0.150.1 \
    textblob==0.15.1 \
    h5py==2.8.0.rc1 \
    pudb==2017.1 \
    bokeh==0.12.14 \
    seaborn==0.8.1 \
    # Extra python packages
    pillow==4.2.1 \
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
    plotly==2.0.1 \
    tflearn==0.3.2 \
    fitter==1.0.8 \
    langid==1.1.6 \
    # Delorean. Useful for dealing with datetime
    delorean==0.6.0 \
    trueskill==0.4.4 \
    heamy==0.0.7 \
    vida==0.3 \
    # Useful data exploration libraries (for missing data and generating reports)
    missingno==0.4.0 \
    pandas-profiling==1.4.0 \
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
    # milk==0.6.1 \ find some bugs here, will add this package later
    # pattern==2.6 \ this pkg have some bugs when installing, admit it this time
    rsa==3.4.2 \
    netaddr==0.7.19 \
    bs4==0.0.1 \
    jieba==0.39 \
    lightgbm==2.1.0 \
    xlrd==1.0.0 \
    h2o==3.18.0.4 \
    mxnet==1.1.0.post0 \
    wordcloud==1.4.1 \
    gensim==3.4.0 \
    # textstat==0.4.1 \ only have py2 version
    # readability==0.2 \ onyl have py3.2 & py2.7 version
    # pyecharts==0.2.7 \
    pygal==2.4.0 \
    cufflinks==0.12.1 \
    scikit-image==0.13.1 \
    bunch==1.0.1 \
    http://download.pytorch.org/whl/cpu/torch-1.0.0-cp35-cp35m-linux_x86_64.whl \
    torchvision \
    lxml==4.2.1 \
    xlearn==0.40a1 \
    pystan==2.14 \
    networkx==2.1 \
    catboost==0.8.1 \
    mlxtend==0.12.0 \
    librosa==0.6.1 \
    python_speech_features==0.6 \
    sympy==1.2 \
    nltk==3.3 \
    NiftyNet==0.3.0 \
    # klab-plugin
    klab-autotime==0.0.2 \
    && \
    pip install fbprophet && \
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
    # biopython==1.68 \ will raise error
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
    # tqdm==4.19.5 \
    gensim==3.4.0 \
    nltk==3.2.5 \
    textstat==0.4.1 \
    readability==0.2 \
    # scikit-image==0.13.1 \ install later
    beautifulsoup4==4.6.0 \
    lxml==4.2.1 \
    jieba==0.39 \
    networkx==2.1 \
    catboost==0.8.1 \
    # scikit-multilearn==0.0.5 \
    # scikit-optimize==0.5.1 \
    # scikit-plot==0.3.4 \
    # scikit-surprise==1.0.5 \
    # k-lab plugin
    klab-autotime==0.0.2 && \
    python2 -m pip install -U numpy

ENV LD_LIBRARY_PATH /usr/local/lib:/opt/conda/lib
ENV CFLAGS="-I /opt/conda/lib/python3.5/site-packages/numpy/core/include $CFLAGS"
RUN pip install \
    tornado==4.5.3 \
    hmmlearn==0.2.0 \
    scikit-image==0.14.1 \
    onnx==1.3.0

# Install chinese fonts, set minus numbers available,  and set it as default(must be set after matplotlib installed), add tuna mirror pypi souce index
COPY MicrosoftYaHei.ttf /opt/conda/lib/python3.5/site-packages/matplotlib/mpl-data/fonts/ttf/

RUN echo 'font.family         : sans-serif' >> /opt/conda/lib/python3.5/site-packages/matplotlib/mpl-data/matplotlibrc && \
    echo 'font.sans-serif     : Microsoft YaHei, DejaVu Sans, Bitstream Vera Sans, Lucida Grande, Verdana, Geneva, Lucid, Arial, Helvetica, Avant Garde, sans-serif' >> /opt/conda/lib/python3.5/site-packages/matplotlib/mpl-data/matplotlibrc && \
    echo 'axes.unicode_minus  : False' >> /opt/conda/lib/python3.5/site-packages/matplotlib/mpl-data/matplotlibrc && \
    echo "[global]\n\
index-url = https://pypi.tuna.tsinghua.edu.cn/simple\n" > ~/.pip/pip.conf

RUN rm -rf /home/$NB_USER/.cache/pip/*

WORKDIR /home/$NB_USER/work
