BUILDERIMAGE=snappbuilder
REGISTRY=something
PRODIMAGENAME=else
PORT=8002
 
.PHONY: all
all:
	docker build -f ${PWD}/docker/snap.dev -t ${BUILDERIMAGE} ${PWD}
	docker run -it -v ${PWD}/app:/app ${BUILDERIMAGE} 
	docker build -f ${PWD}/docker/snap.prod -t ${REGISTRY}/${PRODIMAGENAME} ${PWD}

.PHONY: prod
prod:
	docker build -f ${PWD}/docker/snap.prod -t ${REGISTRY}/${PRODIMAGENAME} ${PWD}

.PHONY: run
run:
	docker run -it -p ${PORT}:8000 ${REGISTRY}/${PRODIMAGENAME}



