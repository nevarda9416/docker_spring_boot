# Ngày tạo: 28/06/2024
# Sử dụng hình ảnh Gradle chính thức để build
# Hình ảnh này có sẵn Gradle và JDK 17
FROM gradle:7.4.2-jdk17 AS build

# Đặt thư mục làm việc trong container là /app
WORKDIR /app

# Mở cổng 8081 (nếu ứng dụng của bạn sử dụng cổng này, điều này không bắt buộc)
EXPOSE 8081

# Sao chép các file cấu hình Gradle vào container
COPY build.gradle settings.gradle ./

# Sao chép thư mục src vào container
COPY src ./src

# Chạy lệnh Gradle để build ứng dụng và bỏ qua các bài test
RUN gradle clean build -x test

# Sử dụng hình ảnh JDK chính thức để chạy ứng dụng
FROM openjdk:17-jdk-slim

# Sao chép file jar đã build từ bước trước vào hình ảnh này
COPY --from=build /app/build/libs/*.jar app.jar

# Định nghĩa lệnh để chạy ứng dụng
ENTRYPOINT ["java", "-jar", "app.jar"]

