# ขั้นตอนแรก: ใช้ official Go image (1.24.3) เป็น base image สำหรับการ build
FROM golang:1.24.3 AS builder

WORKDIR /app

# คัดลอก go.mod และ go.sum เข้าไปใน container
COPY go.mod go.sum ./

RUN go mod tidy

# คัดลอกโค้ดทั้งหมดไปที่ working directory
COPY . .

# สร้างแอปพลิเคชัน
RUN go build -o app .

# ขั้นตอนที่ 2: ใช้ alpine หรือ slim image ที่เบากว่า
FROM alpine:latest

# ติดตั้ง dependencies ที่จำเป็น
RUN apk update && apk add libc6-compat

# คัดลอกไฟล์แอปพลิเคชันจากขั้นตอนการ build
COPY --from=builder /app/app /app

# กำหนด entrypoint
ENTRYPOINT ["/app"]

# เปิดพอร์ต 8080
EXPOSE 8080
