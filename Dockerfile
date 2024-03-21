FROM ac2-registry.cn-hangzhou.cr.aliyuncs.com/ac2/pytorch:2.2.0.1-3.2304-cu121
RUN pip install --progress-bar off --upgrade pip
ADD ./requirements-patch.txt /tmp/requirements.txt
RUN pip install  --progress-bar off -r /tmp/requirements.txt
RUN yum install procps-ng -y
ADD . /opt/app
WORKDIR /opt/app
RUN pip config --user set global.progress_bar off
RUN pip install --progress-bar off supervisor
CMD  ["supervisord", "-c", "/opt/app/supervisord.conf"]