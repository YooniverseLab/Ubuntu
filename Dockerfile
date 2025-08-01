FROM ubuntu:22.04

# 필수 업데이트 및 tmate 설치  
RUN apt-get update && \
    apt-get install -y tmate && \
    rm -rf /var/lib/apt/lists/*

# 필요하면 포트 열기 (터미널 세션 공유용)
EXPOSE 2222

# 컨테이너 시작 시 tmate 세션 열기와 앱 실행  
CMD sh -c "tmate -F -S /tmp/tmate.sock & your_app_command"
