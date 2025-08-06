FROM gradle:jdk-21-and-23-graal-jammy

# 작업 디렉토리 설정
WORKDIR /app

# 소스 코드와 Gradle 래퍼 복사
COPY build.gradle.kts .
COPY settings.gradle.kts .

# Gradle 래퍼에 실행 권한 부여
RUN gradle wrapper

# 종속성 설치
RUN ./gradlew dependencies --no-daemon

# 소스 코드 복사
COPY src src

# 애플리케이션 빌드
RUN ./gradlew build --no-daemon

# 이후 명령어가 편하도록 불필요한 파일 삭제
RUN rm -rf /app/build/libs/*-plain.jar

# 빌드된 JAR 파일 복사
RUN mv /app/build/libs/*.jar app.jar

# 실행할 JAR 파일 지정
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=prod", "app.jar"]