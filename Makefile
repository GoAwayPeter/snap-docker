BUILDERIMAGETAG=snappbuilder
REGISTRY=gcr.io
PROJNAME=clean-feat-219119
PRODIMAGETAG=snapp-deploy
PORT=8002
 
# Builds the toolchain (snap.dev) image, builds the app inside this container
# then builds the production image which copies in the previously output application
.PHONY: all
all:
	docker build -f ${PWD}/docker/snap.dev -t ${BUILDERIMAGETAG} ${PWD}
	docker run -it -v ${PWD}/app:/app ${BUILDERIMAGETAG} 
	docker build -f ${PWD}/docker/snap.prod -t ${REGISTRY}/${PROJNAME}/${PRODIMAGETAG} ${PWD}

# Rebuild just the production base image
.PHONY: prod
prod:
	docker build -f ${PWD}/docker/snap.prod -t ${REGISTRY}/${PRODIMAGETAG} ${PWD}

# Run the production image (if it exists)
.PHONY: run
run:
	docker run -it -p ${PORT}:8000 ${REGISTRY}/${PRODIMAGETAG}



