## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/ /'

.PHONY: gen-grpc
## gen-grpc: generate go grpc code from protofile
gen-grpc:
	@protoc -I proto proto/sso/sso.proto --go_out=./gen/go --go_opt=paths=source_relative  --go-grpc_out=./gen/go --go-grpc_opt=paths=source_relative 
