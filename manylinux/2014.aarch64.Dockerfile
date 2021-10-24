FROM quay.io/pypa/manylinux2014_aarch64

RUN set -ex \
        \
        && echo "cd /root" >> /root/.bashrc \
        && sed -e 's|^mirrorlist=|#mirrorlist=|g' -e 's|^#baseurl=http://mirror.centos.org/altarch/|baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos-altarch/|g' -e 's|^#baseurl=http://mirror.centos.org/$contentdir/|baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos-altarch/|g' -i.bak /etc/yum.repos.d/CentOS-*.repo
        && yum install -y dnf \
        && dnf install -y epel-release \
        && sed -e 's!^metalink=!#metalink=!g' -e 's!^#baseurl=!baseurl=!g' -e 's!//download\.fedoraproject\.org/pub!//mirrors.tuna.tsinghua.edu.cn!g' -e 's!http://mirrors!https://mirrors!g' -i /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel-testing.repo
        && dnf install -y autogen bash ca-certificates centos-release-scl cmake curl devtoolset-8 gettext git libffi-devel libjpeg-devel openssl-devel nano ninja-build wget xz zlib-devel \
        && dnf clean all \
        && yum clean all \
        && rm -rf /var/cache/dnf \
        && rm -rf /var/cache/yum

RUN set -ex \
        \
        && wget https://sourceforge.net/projects/libpng/files/libpng16/1.6.37/libpng-1.6.37.tar.xz/download -O libpng-1.6.37.tar.xz \
        && tar -xJf libpng-1.6.37.tar.xz \
        && cd libpng-1.6.37 \
        && ./configure --enable-shared \
        && make check \
        && make -j$(nproc) \
        && make install \
        && cd .. \
        && rm -rf libpng-1.6.37 libpng-1.6.37.tar.xz

RUN set -ex \
        \
        && /opt/python/cp39-cp39/bin/pip config set global.index-url https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple \
        && /opt/python/cp39-cp39/bin/python3.9 -m pip install -U pip setuptools wheel auditwheel \
        && /opt/python/cp39-cp39/bin/python3.9 -m pip install -U cffi dataclasses future "numpy~=1.21.0" pillow pyyaml requests six typing_extensions tqdm -f https://ext.maku.ml/whl/stable.html \
        && /opt/python/cp38-cp38/bin/python3.8 -m pip install -U pip setuptools wheel auditwheel \
        && /opt/python/cp38-cp38/bin/python3.8 -m pip install -U cffi dataclasses future "numpy~=1.21.0" pillow pyyaml requests six typing_extensions tqdm -f https://ext.maku.ml/whl/stable.html \
        && /opt/python/cp37-cp37m/bin/python3.7 -m pip install -U pip setuptools wheel auditwheel \
        && /opt/python/cp37-cp37m/bin/python3.7 -m pip install -U cffi dataclasses future "numpy~=1.21.0" pillow pyyaml requests six typing_extensions tqdm -f https://ext.maku.ml/whl/stable.html \
        && /opt/python/cp36-cp36m/bin/python3.6 -m pip install -U pip setuptools wheel auditwheel \
        && /opt/python/cp36-cp36m/bin/python3.6 -m pip install -U cffi dataclasses future numpy pillow pyyaml requests six typing_extensions tqdm -f https://ext.maku.ml/whl/stable.html \
        && /opt/python/cp310-cp310/bin/python3.10 -m pip install -U pip setuptools wheel auditwheel \
        && /opt/python/cp310-cp310/bin/python3.10 -m pip install -U cffi dataclasses future "numpy~=1.21.0" pillow pyyaml requests six typing_extensions tqdm -f https://ext.maku.ml/whl/stable.html \
        && rm -rf /root/.cache/* \
        && rm -rf /root/.config/pip

COPY custom.bashrc /root/

RUN set -ex \
        \
        && ln -s /usr/bin/ninja-build /usr/bin/ninja \
        && cat /root/custom.bashrc >> /root/.bashrc

CMD ["/bin/bash"]
