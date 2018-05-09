[![Build Status](https://travis-ci.org/Kesci/klab-kernel.svg?branch=master)](https://travis-ci.org/Kesci/klab-kernel)

# K-Lab 镜像

K-Lab 镜像是一个集成了 Python2, Python3, R 以及 Anaconda 的集成开发镜像，已经安装了大部分常用的包，被科赛网用户大量使用，充分验证了通用性和可用性。

## 运行

可以直接用镜像运行 `docker run -it klabteam/klab bash`, 进入交互式命令行模式。也可以启动 notebook 使用，` docker run -p 8888:8888  klabteam/klab jupyter notebook --ip 0.0.0.0 --port 8888`。

## 添加自己的包

base 镜像主要安装的是一些在国内安装比较麻烦的包和工具，我们提前安装好了，klab 镜像主要是需要 pip 装的包，这样方便修改 Dockerfile，除此之外，镜像源也改成了国内的源，可以更快的安装自己的依赖包。
首先需要构建 base 镜像，但还是建议直接拉下来 `docker pull kesci/base`，因为里面的包都是因为网络原因很难下载的包，然后构建 klab 镜像的话运行
```
cd $Klab-kernel-dir/base/klab
docker build -t kesci/klab .
```

## 自动化测试

在本地运行成功以后，可以把测试加入到测试脚本中，一般的 py3 的测试可以追加到 `test/test_import_py3.py` 下，其他工具类的测试可以加入到 `test/test.sh`。
