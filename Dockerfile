FROM ubuntu
RUN apt-get update && apt-get install wget
RUN wget http://logiciels.ign.fr/spip.php?action=telecharger&arg=169 -O - | tar -xz
