FROM golang as build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server
EXPOSE 8080

FROM scratch
WORKDIR /app
COPY --from=build /app/server .

CMD [ "./server" ]