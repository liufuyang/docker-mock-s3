FROM python:2.7
MAINTAINER Fuyang Liu <fli@tradeshift.com>

RUN apt-get update && \
 	apt-get install git && \
 	apt-get clean && \
 	git clone https://github.com/liufuyang/mock-s3.git

WORKDIR mock-s3
RUN python setup.py install

EXPOSE 10001
VOLUME /data
ENTRYPOINT ["mock_s3", "--hostname", "0.0.0.0", "--root", "/data"]
