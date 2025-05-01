FROM gcr.io/oss-fuzz-base/base-builder

# Install required tools for building zlib
RUN apt-get update && apt-get install -y autoconf automake libtool git

# Set working directory (required by OSS-Fuzz)
WORKDIR /src

# Copy all project files (make sure project.yaml is included)
COPY . .

# Set environment variable explicitly (optional safety)
ARG FUZZING_LANGUAGE
ENV FUZZING_LANGUAGE=${FUZZING_LANGUAGE}

# Build everything using the OSS-Fuzz helper
RUN compile
