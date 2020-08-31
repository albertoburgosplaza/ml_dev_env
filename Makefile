build:
	docker build -f Dockerfile -t mldev .

code:
	docker run \
	-p ${PORT}:${PORT} \
	-v ${WORKSPACE}:/home/root/workspace \
	-ti mldev \
	/bin/zsh -c \
	"source activate ml \
	&& code-server /home/root/workspace/ --verbose --port ${PORT} --host 0.0.0.0 --auth none"

jupyter:
	docker run \
	-p ${PORT}:${PORT} \
	-v ${WORKSPACE}:/home/root/workspace \
	-ti mldev \
	/bin/zsh -c \
	"source activate ml \
	&& cd /home/root/workspace/ \
	&& SHELL=/bin/zsh jupyter-lab --ip=0.0.0.0 --no-browser --port ${PORT} --allow-root"

code2:
	docker run \
	-p ${PORT}:${PORT} \
	-v ${WORKSPACE}:/home/root/workspace \
	-t mldev \
	/bin/zsh -c \
	"source activate ml \
	&& TERM=xterm code-server /home/root/workspace/ --log trace --verbose --port ${PORT} --host 0.0.0.0 --auth none"
