boot:
	docker-compose up  --force-recreate --build -d 
start:
	docker-compose -f docker-compose.yml  up  --force-recreate -d 

# 编译golang docker镜像
build:
