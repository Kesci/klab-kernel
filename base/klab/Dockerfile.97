FROM klabteam/base:gpu-latest

MAINTAINER K-Lab Authors <service@kesci.com>

ENV NB_USER kesci

USER $NB_USER

# Install Jupyter and Py3 packages
RUN mkdir -p ~/.pip/ && \
    pip install jupyter && \
    pip install \
    opencv-python==3.4.4.19 \
    scipy==1.2.0 \
    numpy==1.15.4 \
    scikit-learn==0.20.2 \
    keras==2.2.4 \
    patsy==0.5.1 \
    pandas==0.23.4 \
    theano==1.0.3 \
    xgboost==0.81 \
    statsmodels==0.9.0 \
    tensorflow-gpu==1.12.0 \
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
    plotly==3.4.2 \
    fitter==1.0.8 \
    langid==1.1.6 \
    delorean==0.6.0 \
    trueskill==0.4.4 \
    heamy==0.0.7 \
    vida==0.3 \
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
    pygal==2.4.0 \
    cufflinks==0.12.1 \
    scikit-image==0.13.1 \
    bunch==1.0.1 \
    torch \
    torchvision \
    lxml==4.2.1 \
    xlearn==0.40a1 \
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
    # k-lab plugin
    klab-autotime==0.0.2 && \
    python2 -m pip install -U numpy

ENV LD_LIBRARY_PATH /usr/local/lib:/opt/conda/lib
ENV CFLAGS="-I /opt/conda/lib/python3.6/site-packages/numpy/core/include $CFLAGS"
RUN pip install \
    tornado==4.5.3 \
    hmmlearn==0.2.1 \
    scikit-image==0.14.1 \
    onnx==1.3.0 \
    allennlp==0.8.0 \
    pystan==2.18.0.0 \
    fbprophet==0.3.post2

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
index-url = https://pypi.tuna.tsinghua.edu.cn/simple\n" > ~/.pip/pip.conf && \
    rm -rf /home/$NB_USER/.cache/pip/*

WORKDIR /home/$NB_USER/work
