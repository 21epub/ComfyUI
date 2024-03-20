FROM ac2-registry.cn-hangzhou.cr.aliyuncs.com/ac2/pytorch:2.2.0.1-3.2304
RUN pip install --upgrade pip
ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt
ADD . /opt/app
WORKDIR /opt/app
CMD  ["python", "main.py"]