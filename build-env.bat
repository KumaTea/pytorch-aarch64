cd py39
docker buildx build --pull --platform linux/arm64,linux/arm/v7 -t kumatea/build:py39 -t kumatea/build:latest --push .
cd ..

cd py38
docker buildx build --pull --platform linux/arm64,linux/arm/v7 -t kumatea/build:py38 --push .
cd ..

cd py37
docker buildx build --pull --platform linux/arm64,linux/arm/v7 -t kumatea/build:py37 --push .
cd ..

cd py36
docker buildx build --pull --platform linux/arm64,linux/arm/v7 -t kumatea/build:py36 --push .
cd ..
