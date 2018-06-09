####	Commands for Docker Launcher     ###

###		docker build -t mycrystallang .  ###
#### 	docker run -it mycrystallang 	 ###

FROM crystallang/crystal
LABEL maintainer="wde-mell@student.42.fr"

RUN apt-get update -y && apt-get upgrade -y 
RUN apt-get install -y build-essential curl libevent-dev libssl-dev libxml2-dev libyaml-dev libgmp-dev git
RUN curl http://crystal-lang.s3.amazonaws.com/llvm/llvm-3.5.0-1-linux-x86_64.tar.gz | tar xz -C /opt

ADD . /opt/crystal-head

WORKDIR /opt/crystal-head

ENV CRYSTAL_CONFIG_VERSION HEAD
ENV CRYSTAL_CONFIG_PATH lib:/opt/crystal-head/src:/opt/crystal-head/libs
ENV LIBRARY_PATH /opt/crystal/embedded/lib
ENV PATH /opt/crystal-head/bin:/opt/llvm-3.5.0-1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

##### 	https://hub.docker.com/r/crystallang/crystal/   ###

#### 	Crystal is a programming language with the following goals: ####

# Have a syntax similar to Ruby (but compatibility with it is not a goal)
# Statically type-checked but without having to specify the type of variables or method arguments.
# Be able to call C code by writing bindings to it in Crystal.
# Have compile-time evaluation and generation of code, to avoid boilerplate code.
# Compile to efficient native code.

# Crystal est un langage de programmation avec les objectifs suivants:

# Avoir une syntaxe similaire à Ruby (mais la compatibilité avec ce n'est pas un objectif)
# Type vérifié statiquement mais sans avoir à spécifier le type de variables ou d'arguments de méthode.
# Pouvoir appeler le code C en lui écrivant des liens dans Crystal.
# Avoir une évaluation à la compilation et la génération de code, pour éviter le code standard.
# Compiler vers un code natif efficace.

####  https://auth0.com/blog/an-introduction-to-crystal-lang/  ####
