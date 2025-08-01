FROM ubuntu:22.04

# 필수 업데이트 및 의존성 설치  
RUN apt-get update && apt-get install -y \
    curl \
    git \
    tmate \
    && rm -rf /var/lib/apt/lists/*

# Node.js 설치 (원하는 버전으로 변경 가능)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# 작업 디렉토리 설정  
WORKDIR /app

# 프로젝트 파일 복사 (package.json 등)
COPY package*.json ./

# 의존성 설치  
RUN npm install

# 전체 소스 복사  
COPY . .

# 포트 노출  
EXPOSE 3000

# 컨테이너 시작 시 tmate 세션 열기 + 앱 실행  
CMD sh -c "tmate -F -S /tmp/tmate.sock & npm run start"
