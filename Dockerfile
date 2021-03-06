FROM centos:7
RUN yum update -y && \
yum install epel-release -y && \
yum install python3 -y
COPY . /usr/local/epam
WORKDIR /usr/local/epam
ENV FLASK_APP js_example
ENV LC_ALL en_US.utf-8
RUN pip3 install -e .

CMD [ "flask", "run", "--host=0.0.0.0"]

