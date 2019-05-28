FROM library/golang 
COPY app.go .
COPY static/ static/
RUN CGO_ENABLED=0 GOOS=linux go build -o static_app app.go

FROM scratch
COPY --from=0 /go .
EXPOSE 3000
CMD ["/static_app"]
