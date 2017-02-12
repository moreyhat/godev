FROM ubuntu:latest

MAINTAINER moriyatto

ENV ARCH amd64
ENV GOVERSION 1.7.5
ENV HOME /root
ENV PATH $PATH:/usr/local/go/bin
ENV GOPATH $HOME/work

RUN apt-get update -y \
	&& apt-get install vim curl git -y \
	&& curl -s -o /tmp/go.tar.gz https://storage.googleapis.com/golang/go$GOVERSION.linux-$ARCH.tar.gz \
	&& tar -C /usr/local -xzf /tmp/go.tar.gz \
	&& rm /tmp/go.tar.gz \
	&& curl -s -fLo /root/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
	&& echo "let g:go_fmt_command = \"goimports\"" >> $HOME/.vimrc \
	&& git clone https://github.com/fatih/vim-go.git $HOME/.vim/pack/plugins/start/vim-go \
	&& go get github.com/nsf/gocode \
		  github.com/alecthomas/gometalinter \
		  golang.org/x/tools/cmd/goimports \
		  golang.org/x/tools/cmd/guru \
		  golang.org/x/tools/cmd/gorename \
		  github.com/golang/lint/golint \
		  github.com/rogpeppe/godef \
		  github.com/kisielk/errcheck \
		  github.com/jstemmer/gotags \
		  github.com/klauspost/asmfmt/cmd/asmfmt \
		  github.com/fatih/motion \
		  github.com/zmb3/gogetdoc \
		  github.com/zmb3/gogetdoc \
		  github.com/josharian/impl

WORKDIR $HOME/work
