# 베이스 이미지 설정  
FROM ubuntu:20.04

# 환경설정  
ENV DEBIAN_FRONTEND=noninteractive

# 필요한 패키지 설치  
RUN apt-get update && \
    apt-get install -y tmate wget curl && \
    apt-get clean

# Tmate 실행 스크립트  
CMD ["tmate"]
