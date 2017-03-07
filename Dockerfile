FROM buildpack-deps:jessie-scm
EXPOSE 80
WORKDIR /
CMD ["/app"]
COPY skeleton-docker-go /app
COPY static /static
