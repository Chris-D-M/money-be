# 사용할 이미지 설정
FROM python:3.10

# 작업 디렉토리 설정
WORKDIR /app

# 소스 코드 복사
COPY . /app
COPY requirements.txt /prisma/schema.prisma /app/

# 필요한 라이브러리 설치
RUN pip install -r requirements.txt
RUN pip install prisma

RUN prisma generate

EXPOSE 8000

# FastAPI 서버 실행
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
