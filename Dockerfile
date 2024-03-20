FROM ac2-registry.cn-hangzhou.cr.aliyuncs.com/ac2/pytorch:2.2.0.1-3.2304-cu121
RUN pip install --progress-bar off --upgrade pip
ADD ./requirements-patch.txt /tmp/requirements.txt
RUN pip install  --progress-bar off -r /tmp/requirements.txt
ADD . /opt/app
WORKDIR /opt/app
CMD  ["python3", "main.py"]