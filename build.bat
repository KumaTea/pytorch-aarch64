REM docker buildx prune -f

cd docker

cd py39
docker buildx build --pull --platform linux/arm64,linux/arm/v7 -t kumatea/pytorch:1.8.1 -t kumatea/pytorch:1.8.1-py39 -t kumatea/pytorch:py39 -t kumatea/pytorch:latest --push .
docker buildx build --pull --platform linux/arm64,linux/arm/v7 -t kumatea/pytorch:1.8.1-full -t kumatea/pytorch:1.8.1-py39-full -t kumatea/pytorch:py39-full -f full.Dockerfile --push .
cd ..

cd py38
docker buildx build --pull --platform linux/arm64,linux/arm/v7 -t kumatea/pytorch:1.8.1-py38 -t kumatea/pytorch:py38 --push .
docker buildx build --pull --platform linux/arm64,linux/arm/v7 -t kumatea/pytorch:1.8.1-py38-full -t kumatea/pytorch:py38-full -f full.Dockerfile --push .
cd ..

cd py37
docker buildx build --pull --platform linux/arm64,linux/arm/v7 -t kumatea/pytorch:1.8.1-py37 -t kumatea/pytorch:py37 --push .
docker buildx build --pull --platform linux/arm64,linux/arm/v7 -t kumatea/pytorch:1.8.1-py37-full -t kumatea/pytorch:py37-full -f full.Dockerfile --push .
cd ..

cd py36
docker buildx build --pull --platform linux/arm64,linux/arm/v7 -t kumatea/pytorch:1.8.1-py36 -t kumatea/pytorch:py36 --push .
docker buildx build --pull --platform linux/arm64,linux/arm/v7 -t kumatea/pytorch:1.8.1-py36-full -t kumatea/pytorch:py36-full -f full.Dockerfile --push .
cd ..
